import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/calll_screen_controller.dart';
import '../incoming_screen/widgets/profile_image.dart';
import 'widget/button.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimerController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/IMG_20230620_213445_759.jpg')),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Boosted volume successfully',
                      style: TextStyle(fontSize: 20.r),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ProfileImage(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Siraj',
                      style: TextStyle(fontSize: 23.r),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sim_card,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '+91 8606513677',
                          style: TextStyle(fontSize: 20.r),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'India',
                          style: TextStyle(fontSize: 20.r),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.hd,
                        ),
                      ],
                    ),
                    Obx(() {
                      return Text(
                        controller.time.value,
                        style: TextStyle(fontSize: 20.r),
                      );
                    }),
                    SizedBox(
                      height: 90.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CallUtilityButton(
                          icon: Icons.videocam_outlined,
                          text: 'Video call',
                          onTap: () {},
                        ),
                        CallUtilityButton(
                          icon: Icons.add,
                          text: 'Add call',
                          onTap: () {},
                        ),
                        CallUtilityButton(
                          icon: Icons.edit_note,
                          text: 'Note',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CallUtilityButton(
                            icon: Icons.mic_off,
                            text: 'Mute',
                            onTap: () {},
                          ),
                          CallUtilityButton(
                            icon: Icons.pause_circle_outline,
                            text: 'Hold',
                            onTap: () {},
                          ),
                          CallUtilityButton(
                            icon: Icons.record_voice_over_outlined,
                            text: 'record',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CallUtilityButton(
                            icon: Icons.volume_up_outlined,
                            onTap: () {},
                          ),
                          IconButton(
                              onPressed: () => SystemNavigator.pop(),
                              icon: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 35.r,
                                child: Icon(
                                  Icons.call_end,
                                  color: Colors.white,
                                  size: 38.r,
                                ),
                              )),
                          CallUtilityButton(
                            icon: Icons.dialpad,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
