import 'package:flutter/material.dart';
import 'package:law_in_people_hand/utils.dart';
import 'color.dart';
import 'loading.dart';


typedef FutureVoidCallback = Future<void> Function();

// text button


// outlined button
class MyOutlinedButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget child;
  final FutureVoidCallback? onPressed;
  final Widget? onLoading;
  final bool isExpand;
  final Color? borderColor;

  const MyOutlinedButton({
    Key? key,
    this.width,
    this.height,
    required this.child,
    this.onPressed,
    this.onLoading,
    this.isExpand = false,
    this.borderColor,
  }) : super(key: key);

  @override
  State<MyOutlinedButton> createState() => _MyOutlinedButtonState();
}

class _MyOutlinedButtonState extends State<MyOutlinedButton> {
  bool isPressed = false;
  late Future onPressedLogic;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.isExpand ? double.infinity : widget.width,
      height: widget.height,
      child: OutlinedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          side: MaterialStateProperty.all(
            BorderSide(
              color: widget.borderColor ?? Colors.black,
              width: 2,
            ),
          ),
          // backgroundColor: MaterialStateProperty.all(isPressed ? Colors.white.withOpacity(0.2) : Colors.transparent),
        ),
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
        child: isPressed ? (widget.onLoading != null ? widget.onLoading! : const Center(
          child: MyDefaultCircularLoading(strokeWidth: 3, size: 20),
        )) : widget.child,
      ),
    );

  }
}


// contained button
class MyContainedButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget child;
  final FutureVoidCallback? onPressed;
  final Widget? onLoading;
  final bool isExpand;
  final Decoration Function(bool isPressed)? decoration;
  final ButtonStyle Function(bool isPressed)? buttonStyle;

  const MyContainedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
    this.onLoading,
    this.isExpand = false,
    this.decoration,
    this.buttonStyle,
  }) : super(key: key);

  @override
  State<MyContainedButton> createState() => _MyContainedButtonState();
}

class _MyContainedButtonState extends State<MyContainedButton> {
  bool isPressed = false;
  late Future onPressedLogic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isExpand ? double.infinity : widget.width,
      height: widget.height,
      decoration: widget.decoration != null ? widget.decoration!(isPressed) : ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        gradient: widget.onPressed == null ? LinearGradient(
          colors: [
            MyColor.brightBlue.onWhite(),
            MyColor.brightBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ) : LinearGradient(
          colors: [
            MyColor.blue.onWhite(0.8),
            MyColor.blue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ElevatedButton(
        style: widget.buttonStyle != null ? widget.buttonStyle!(isPressed) : ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(isPressed ? Colors.white.withOpacity(0.2) : Colors.transparent),
        ),
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
        child: isPressed ? (widget.onLoading != null ? widget.onLoading! : const Center(
          child: MyDefaultCircularLoading(strokeWidth: 3, size: 24),
        )) : widget.child,
      ),
    );
  }
}
