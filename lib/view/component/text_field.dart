import 'package:flutter/material.dart';
import 'button.dart';
import 'color.dart';
import 'loading.dart';


class MyDefaultTextField extends StatefulWidget {
  late final FocusNode focusNode;
  final Widget? action;
  final TextEditingController? controller;
  late final Color fillColor;
  late final bool obscureText;

  MyDefaultTextField({
    Key? key,
    FocusNode? focusNode,
    this.controller,
    this.action,
    Color? fillColor,
    bool? obscureText,
  }) : super(key: key) {
    this.focusNode = focusNode ?? FocusNode();
    this.fillColor = fillColor ?? Colors.white;
    this.obscureText = obscureText ?? false;
  }

  @override
  State<MyDefaultTextField> createState() => _MyDefaultTextFieldState();
}

class _MyDefaultTextFieldState extends State<MyDefaultTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: (change) {
        setState(() {
          isFocused = change;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(
            color: isFocused ? MyColor.blue : MyColor.brightBlue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            if(widget.action != null) widget.action!
            else const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}


class MyDefaultTextFieldWithAction extends StatefulWidget {
  final Widget Function(double width)? onLoading;
  final Future<void> Function()? onPressed;
  final FocusNode? focusNode;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? obscureText;

  const MyDefaultTextFieldWithAction({
    Key? key,
    this.onLoading,
    this.onPressed,
    this.focusNode,
    required this.buttonText,
    this.controller,
    this.fillColor,
    TextStyle? buttonTextStyle,
    this.obscureText,
  }) : buttonTextStyle = buttonTextStyle ?? const TextStyle(), super(key: key);

  @override
  State<MyDefaultTextFieldWithAction> createState() => _MyDefaultTextFieldWithActionState();
}

class _MyDefaultTextFieldWithActionState extends State<MyDefaultTextFieldWithAction> {
  bool isPressed = false;
  late Future onPressedLogic;

  void initState() {
    super.initState();
  }

  Size buttonTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    return MyDefaultTextField(
      focusNode: widget.focusNode,
      fillColor: widget.fillColor,
      obscureText: widget.obscureText,
      action: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: OutlinedButton(
          onPressed: widget.onPressed == null ? null : (isPressed ? null : () {
            setState(() {
              onPressedLogic = widget.onPressed!().then((_) {
                setState(() {
                  isPressed = false;
                });
              });
              isPressed = true;
            });
          }),
          focusNode: widget.focusNode,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          child: isPressed ? SizedBox(
            width: buttonTextSize(widget.buttonText, widget.buttonTextStyle).width,
            child: (widget.onLoading != null ? widget.onLoading!(buttonTextSize(widget.buttonText, widget.buttonTextStyle).width) : const Center(
              child: SizedBox(
                width: 10,
                height: 10,
                child: MyDefaultCircularLoading(),
              ),
            )),
          ) : Text(
            widget.buttonText,
            style: widget.buttonTextStyle,
          ),
        ),
      ),
      controller: widget.controller,
    );
  }
}



void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyDefaultTextField(),
                const SizedBox(
                  height: 20,
                ),
                MyDefaultTextFieldWithAction(
                  buttonText: "안녕하세요 반갑습니다",
                  onPressed: () {
                    return Future.delayed(const Duration(seconds: 5));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  title: "안녕하세요 ㅎㅇ",
                  controller: controller1,
                  hintBuilder: (s) {
                    return Text(
                      s!,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyContainedButton(
                  width: 200,
                  height: 50,
                  onPressed: () async {
                    return Future.delayed(const Duration(seconds: 5));
                  },
                  child: const Text("버튼"),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}


class MyTextFieldWrapper extends StatefulWidget {
  final String title;
  final Widget Function(String? text)? hintBuilder;
  final Alignment? hintAlignment;
  final TextEditingController? controller;
  final Widget myDefaultTextField;

  const MyTextFieldWrapper(
    this.title,
    this.hintBuilder,
    this.hintAlignment,
    this.controller,
    this.myDefaultTextField,
    {Key? key}
  ) : super(key: key);

  @override
  State<MyTextFieldWrapper> createState() => _MyTextFieldWrapperState();
}

class _MyTextFieldWrapperState extends State<MyTextFieldWrapper> {

  void initState() {
    super.initState();
    widget.controller?.addListener(_hintRefresher);
  }

  void _hintRefresher() {
    setState(() {});
  }

  void dispose() {
    widget.controller?.removeListener(_hintRefresher);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        widget.myDefaultTextField,
        if(widget.hintBuilder != null) ...[
          const SizedBox(
            height: 4,
          ),
          Align(
            alignment: widget.hintAlignment ?? Alignment.centerLeft,
            child: widget.hintBuilder!(widget.controller?.text),
          ),
        ],
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final String title;
  final Widget Function(String? text)? hintBuilder;
  final Alignment? hintAlignment;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? fillColor;
  final bool? obscureText;

  const MyTextField({
    Key? key,
    required this.title,
    this.hintBuilder,
    this.hintAlignment,
    this.controller,
    this.focusNode,
    this.fillColor,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextFieldWrapper(
      title,
      hintBuilder,
      hintAlignment,
      controller,
      MyDefaultTextField(
        controller: controller,
        focusNode: focusNode,
        fillColor: fillColor,
        obscureText: obscureText,
      ),
    );
  }
}

class MyTextFieldWithAction extends StatelessWidget {
  final String title;
  final Widget Function(String? text)? hintBuilder;
  final Alignment? hintAlignment;
  final Widget Function(double width)? onLoading;
  final Future<void> Function() onPressed;
  final FocusNode? focusNode;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? obscureText;

  const MyTextFieldWithAction({
    Key? key,
    required this.title,
    this.hintBuilder,
    this.hintAlignment,
    this.onLoading,
    required this.onPressed,
    this.focusNode,
    required this.buttonText,
    this.buttonTextStyle,
    this.controller,
    this.fillColor,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextFieldWrapper(
      title,
      hintBuilder,
      hintAlignment,
      controller,
      MyDefaultTextFieldWithAction(
        controller: controller,
        focusNode: focusNode,
        onPressed: onPressed,
        buttonText: buttonText,
        buttonTextStyle: buttonTextStyle,
        onLoading: onLoading,
        fillColor: fillColor,
        obscureText: obscureText,
      ),
    );
  }
}

