import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/time_controller.dart';

class OnCall extends StatefulWidget {
  const OnCall({super.key});

  @override
  State<OnCall> createState() => _OnCallState();
}

class _OnCallState extends State<OnCall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimerController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showModelBottomSheet();
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'End-to-end Encrypted',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_sharp))
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/baground_image.jpg'))),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              const Text(
                'Siraj',
                style: TextStyle(fontSize: 25),
              ),
              Obx(() {
                return Text(
                  controller.time.value,
                  style: TextStyle(fontSize: 15.r),
                );
              }),
              SizedBox(
                height: 145.h,
              ),
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  radius: 80.r,
                  backgroundImage:
                      const AssetImage('assets/1675173721756-01-min.jpeg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModelBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: false,
      isDismissible: false,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_up)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.volume_up)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.video_call)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.mic_off_sharp)),
                IconButton(
                    onPressed: () => SystemNavigator.pop(),
                    icon: const CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.call_end))),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        );
      },
    );
  }
}
