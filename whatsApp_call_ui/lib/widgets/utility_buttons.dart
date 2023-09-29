import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallUtilityButton extends StatelessWidget {
  const CallUtilityButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.text,
    required this.bagroundColor,
  });
  final Function() onTap;
  final Widget icon;
  final String? text;
  final Color bagroundColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: bagroundColor, radius: 25.r, child: icon),
            SizedBox(
              height: 15.h,
            ),
            text != null
                ? Text(
                    text ?? '',
                  )
                : const SizedBox(),
          ],
        ));
  }
}
