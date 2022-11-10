import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:law_in_people_hand/model/api.dart';
import 'package:law_in_people_hand/path.dart';
import 'package:law_in_people_hand/utils.dart';
import 'package:law_in_people_hand/view/component/button.dart';
import 'package:law_in_people_hand/view/component/color.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:flutter_naver_login/flutter_naver_login.dart' as naver;
import 'package:law_in_people_hand/view/component/loading.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as apple;

import '../model/entity/user.dart';


final userProvider = StateProvider<User?>((ref) {
  return null;
});

class Login extends ConsumerStatefulWidget {
  final PathRouteEventRecorder recorder;

  const Login(this.recorder, {Key? key, Object? arguments}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: MyColor.brightBlue,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                          child: Text(
                            "국민의 손으로",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: MyColor.brightBlue.onWhite(0.8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4, top: 4),
                              child: SvgPicture.asset(
                                "images/app/icon-gradient.svg",
                                width: 90,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      LoginWithSocial(
                        socialName: "네이버",
                        icon: SvgPicture.asset(
                          "images/login/naver.svg",
                          width: 20,
                        ),
                        backgroundColor: const Color.fromRGBO(3, 199, 90, 1),
                        textColor: Colors.white,
                        onPressed: () async {
                          final data = await loginViaKakao();
                          if(data == null) {
                            print("naver 로그인이 제대로 수행되지 않았습니다.");
                            return;
                          }
                          await login(data, "NAVER");
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      LoginWithSocial(
                        socialName: "카카오",
                        icon: SvgPicture.asset(
                          "images/login/kakao.svg",
                          width: 24,
                        ),
                        backgroundColor: const Color.fromRGBO(247, 230, 0, 1),
                        onPressed: () async {
                          final data = await loginViaKakao();
                          if(data == null) {
                            print("kakao 로그인이 제대로 수행되지 않았습니다.");
                            return;
                          }
                          await login(data, "KAKAO");
                        },
                      ),
                      if(Platform.isIOS) ...[
                        const SizedBox(
                          height: 16,
                        ),
                        LoginWithSocial(
                          socialName: "애플",
                          icon: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: SvgPicture.asset(
                              "images/login/apple.svg",
                            ),
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () async {

                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(Map<String, dynamic> data, String accountType) async {
    var user = await ApiManager.instance.fetch<User?>(
      name: "loginIfExists",
      fromJson: (json) {
        if(json["id"] == null) {
          return null;
        } else {
          return User.fromJson(json);
        }
      },
      requestBody: RequestBody.fromJson({
        "accountType" : accountType,
        "socialId"    : data["socialId"],
      }),
    );

    user ??= await ApiManager.instance.fetch<User>(
      name: "createUser",
      fromJson: User.fromJson,
      requestBody: RequestBody.fromJson({
        "accountType" : accountType,
        "socialId"    : data["socialId"],
        "name"        : data["name"] ?? data["nickname"],
        "birthday"    : data["birthday"],
      }),
    );

    ref.read(userProvider.state).state = user;
    PathManager.instance.pushUniqueNamed(context, "home");
  }
}


class LoginWithSocial extends StatelessWidget {
  final String socialName;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final FutureVoidCallback onPressed;

  const LoginWithSocial({
    Key? key,
    required this.socialName,
    required this.icon,
    required this.backgroundColor,
    this.textColor = Colors.black,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainedButton(
      width: 240,
      height: 40,
      onPressed: onPressed,
      onLoading: MyCircularLoading(
        size: 20,
        strokeWidth: 3,
        colors: [
          backgroundColor,
          textColor,
        ],
      ),
      decoration: (isPressed) => ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            child: icon,
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            width: 80,
            child: Center(
              child: Text(
                "$socialName 로그인",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Future<Map<String, dynamic>?> loginViaKakao() async {
  try {
    // accessToken의 존재 및 유효성 검사
    if(await kakao.AuthApi.instance.hasToken()) {
      throw kakao.KakaoException("토근 없음");
    }
    kakao.AccessTokenInfo tokenInfo = await kakao.UserApi.instance.accessTokenInfo();
    if(tokenInfo.expiresIn <= 0) {
      throw kakao.KakaoException("토큰 만료");
    }
  } catch(e) {
    try {
      // 카카오 로그인 시도(1차)
      await kakao.UserApi.instance.loginWithKakaoTalk();

    } catch(e) {
      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (e is PlatformException && e.code == 'CANCELED') {
        return null;
      }

      try {
        // 카카오 계정으로 로그인 시도(2차)
        await kakao.UserApi.instance.loginWithKakaoAccount();
      } on Exception {
        return null;
      }
    }
  }

  kakao.User user = await kakao.UserApi.instance.me();
  String? birthday = user.kakaoAccount?.birthday;
  String? birthYear = user.kakaoAccount?.birthyear;
  String? birthdayValue = birthday == null || birthYear == null ?
  null : "$birthYear-${birthday.substring(0, 2)}-${birthday.substring(2, 4)}";

  kakao.Gender? gender = user.kakaoAccount?.gender;
  String? genderValue = gender == null ?
  null : gender == kakao.Gender.female ?
  "F" : "M";

  return {
    "socialId" : user.id.toString(),
    "birthday" : birthdayValue,
    "email"    : user.kakaoAccount?.email,
    "gender"   : genderValue,
    "phone"    : user.kakaoAccount?.phoneNumber,
    "name"     : user.kakaoAccount?.legalName,
    "nickname" : user.kakaoAccount?.profile?.nickname,
  };
}

Future<Map<String, dynamic>?> loginViaNaver() async {
  late naver.NaverLoginResult res;
  try {
    res = await naver.FlutterNaverLogin.logIn();
  } catch(e) {
    try {
      // 토큰을 갱신한 후 다시 시도합니다.
      final token = await naver.FlutterNaverLogin.currentAccessToken;
      if(!token.isValid()) {
        await naver.FlutterNaverLogin.refreshAccessTokenWithRefreshToken();
      }
      res = await naver.FlutterNaverLogin.logIn();
    } catch(e) {
      print(e);
      return null;
    }
  }

  String? birthdayValue = "${res.account.birthyear}-${res.account.birthday}";
  birthdayValue = RegExp("\d{4}-\d{2}-\d{2}").hasMatch(birthdayValue) ? birthdayValue : null;
  String? emailValue = res.account.email.contains("@") ? res.account.email : null;
  String? genderValue = RegExp("[M|F]").hasMatch(res.account.gender) ? res.account.gender : null;
  String? nameValue = res.account.name.isNotEmpty ? res.account.name : null;
  String? nickNameValue = res.account.nickname.isNotEmpty ? res.account.nickname : null;
  String? phoneValue = res.account.mobile.isNotEmpty ? res.account.mobile : null;

  return {
    "socialId" : res.account.id,
    "birthday" : birthdayValue,
    "email"    : emailValue,
    "gender"   : genderValue,
    "name"     : nameValue,
    "nickname" : nickNameValue,
    "phone"    : phoneValue,
  };
}

Future<Map<String, dynamic>?> loginViaApple() async {
  final credential = await apple.SignInWithApple.getAppleIDCredential(
    scopes: [
      apple.AppleIDAuthorizationScopes.fullName,

    ],
  );
}