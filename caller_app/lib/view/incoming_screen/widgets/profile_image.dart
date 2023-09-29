import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Hero(
        tag: 'hero',
        child: CircleAvatar(
          radius: 90.r,
          backgroundImage:
              const AssetImage('assets/IMG_20230620_213445_759.jpg'),
        ),
      ),
    );
  }
}
