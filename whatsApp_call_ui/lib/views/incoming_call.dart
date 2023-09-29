import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_design/views/calling_screen.dart';
import 'package:ui_design/widgets/utility_buttons.dart';

class IncomingCall extends StatefulWidget {
  const IncomingCall({super.key});

  @override
  State<IncomingCall> createState() => _IncomingCallState();
}

double _dragPosition = 0.0;
AnimationController? _controller;
Animation<double>? _animation;

class _IncomingCallState extends State<IncomingCall>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Create a bouncing animation
    _animation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.bounceOut, // Use bounceOut curve for bouncing effect
      ),
    );

    // Start the animation
    _controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/baground_image.jpg'))),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 40),
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage:
                      const AssetImage('assets/1675173721756-01-min.jpeg'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Siraj',
                style: TextStyle(fontSize: 25.r),
              ),
              const SizedBox(height: 10),
              Text(
                'WhatsApp voice call',
                style: TextStyle(fontSize: 18.r),
              ),
              const SizedBox(height: 385),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CallUtilityButton(
                        onTap: () {},
                        icon: const Icon(
                          Icons.call_end,
                          color: Colors.red,
                        ),
                        bagroundColor: Colors.black.withOpacity(.4),
                        text: 'Decline'),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _controller!,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      0, -_animation!.value + _dragPosition),
                                  child: child,
                                );
                              },
                              child: GestureDetector(
                                onVerticalDragUpdate: (details) {
                                  if (_controller!.isAnimating) {
                                    stopAnimation();
                                  }
                                  setState(() {
                                    _dragPosition += details.delta.dy;
                                  });
                                },
                                onVerticalDragEnd: (details) {
                                  if (_dragPosition < -10) {
                                    startAnimation();
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const OnCall(),
                                      ));
                                  setState(() {
                                    _dragPosition = 0;
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 25.r,
                                  child: const Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text('Swipe up to accept'),
                        SizedBox(
                          height: 23.h,
                        )
                      ],
                    ),

                    CallUtilityButton(
                        onTap: () {},
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        bagroundColor: Colors.transparent,
                        text: 'message'),
                    // IconButton(
                    //   onPressed: () => SystemNavigator.pop(),
                    //   icon: CircleAvatar(
                    //     backgroundColor: Colors.black.withOpacity(.4),
                    //     radius: 25.r,
                    //     child: const Icon(
                    //       Icons.call_end,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: CircleAvatar(
                    //     backgroundColor: Colors.green,
                    //     radius: 25.r,
                    //     child: const Icon(
                    //       Icons.phone,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: CircleAvatar(
                    //     backgroundColor: Colors.transparent,
                    //     radius: 25.r,
                    //     child: const Icon(
                    //       Icons.message,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void stopAnimation() {
    if (_controller!.status == AnimationStatus.forward) {
      _controller!.reverse();
    }
  }

  void startAnimation() {
    if (_controller!.status == AnimationStatus.dismissed) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
