import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallUtilityButton extends StatelessWidget {
  const CallUtilityButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.text,
  });
  final Function() onTap;
  final IconData icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.r,
            ),
            text != null
                ? Text(
                    text ?? '',
                    style: TextStyle(fontSize: 15.r),
                  )
                : const SizedBox(),
          ],
        ));
  }
}
