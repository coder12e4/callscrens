import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../call_screen/call_screen.dart';
import 'widgets/caller_details.dart';
import 'widgets/profile_image.dart';
import 'widgets/swip_button.dart';

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CallerDetails(),
            const ProfileImage(),
            // SwipeUpDownDemo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => SystemNavigator.pop(),
                    icon: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25.r,
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ))),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CallScreen(),
                          ));
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 25.r,
                        child: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
