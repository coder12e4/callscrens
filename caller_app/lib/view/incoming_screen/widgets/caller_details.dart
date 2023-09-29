import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallerDetails extends StatelessWidget {
  const CallerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Call from',
          style: TextStyle(fontSize: 16.r),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Siraj',
          style: TextStyle(fontSize: 25.r),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Mobile +91 8606513677',
          style: TextStyle(fontSize: 20.r),
        ),
      ],
    );
  }
}
