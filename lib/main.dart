import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:law_in_people_hand/model/entity/bill.mock.dart';
import 'package:law_in_people_hand/path.dart';
import 'model/api.dart';
import 'model/entity/user.mock.dart';
import 'view/view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApiManager(
    host: "http://49.50.162.163:8081",
    sub: [
      ApiPath(
        name: "user",
        subs: [
          ApiPath(
            name: "userId",
            isPathVariable: true,
            fetches: [
              ApiFetch(
                name: "findUser",
                methodType: MethodType.get,
                mock: const ApiMock(
                  defaultKey: '1',
                  data: {
                    '1' : mockUser,
                  },
                ),
              ),
            ],
          ),
          ApiPath(
            name: "login-if-exists",
            fetches: [
              ApiFetch(
                name: "loginIfExists",
                methodType: MethodType.post,
              ),
            ],
          ),
          ApiPath(
            name: "create",
            fetches: [
              ApiFetch(
                name: "createUser",
                methodType: MethodType.post,
              ),
            ],
          ),
        ],
      ),
      ApiPath(
        name: "bill",
        subs: [
          ApiPath(
            name: "list",
            fetches: [
              ApiFetch(
                name: "getAllBillList",
                methodType: MethodType.get,
              ),
            ],
          ),
        ],
      ),
      ApiPath(
        name: "vote",
        subs: [
          ApiPath(
            name: "most",
            fetches: [
              ApiFetch(
                name: "getMostVotedBill",
                methodType: MethodType.get,
                mock: const ApiMock(
                  defaultKey: "1",
                  data: {
                    "1" : mockVotedBillList,
                  },
                ),
              ),
            ],
          ),
          ApiPath(
            name: "list",
            subs: [
              ApiPath(
                name: "userId",
                isPathVariable: true,
                fetches: [
                  ApiFetch(
                    name: "getMyBillList",
                    methodType: MethodType.get,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ApiPath(
        name: "see",
        subs: [
          ApiPath(
            name: "most",
            fetches: [
              ApiFetch(
                name: "getMostSeenBill",
                methodType: MethodType.get,
                mock: const ApiMock(
                  defaultKey: "1",
                  data: {
                    "1" : mockSeenBillList,
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  KakaoSdk.init(nativeAppKey: "3ee29797902fc3c1204f84e2885c322b");

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PathManagerWidget(
      title: "law in people hand",
      homeName: "/login",
      materialAppWrapBuilder: (context, app) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          // 최근 추세는 9:20 이지만, 노치 등의 이유로 SafeArea를 사용할 것이기 때문에
          // 높이를 조금 줄입니다.
          builder: (_, __) => app,
        );
      },
      theme: ThemeData(
        fontFamily: "pretendard"
      ),
      root: [
        PathRoute(
          name: "login",
          constructor: Login.new,
        ),
        PathRoute(
          name: "home",
          constructor: Home.new,
        ),
        PathRoute(
          name: "bill_list",
          constructor: BillList.new,
        ),
        PathRoute(
          name: "bill_detail",
          constructor: BillDetail.new,
        ),
      ],
    );
  }
}






