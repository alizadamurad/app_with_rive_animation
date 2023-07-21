import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../../components/animated_button.dart';
import '../../components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btncontroller;
  @override
  void initState() {
    _btncontroller = OneShotAnimation(
      'active',
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: 100,
            bottom: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv',
              fit: BoxFit.cover),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: const [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 60,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Don't skip design. Learn design and code,by building real apps with React and Swift.Complete courses about the best tools.",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedButton(
                    btncontroller: _btncontroller,
                    press: () {
                      _btncontroller.isActive = true;
                      customSignInDialog(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                        "Purchase includes access to 30+ courses,240+ premium tutorials,120+ hours of videos,source files and certificates"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<Object?> customSignInDialog(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      transitionDuration: const Duration(microseconds: 400),
      barrierLabel: "SignIN",
      context: context,
      pageBuilder: (context, _, __) => Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.94),
              borderRadius: const BorderRadius.all(
                Radius.circular(45),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Sign in",
                            style:
                                TextStyle(fontSize: 34, fontFamily: "Poppins"),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            child: Text(
                                textAlign: TextAlign.center,
                                "Access to 240+ hours of content. Learn design and code,by building real apps with React and Swift."),
                          ),
                          const SignInForm(),
                          Row(
                            children: const [
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "OR",
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 1.5,
                              )),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text(
                              "Sign up with Email,Apple or Google",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/email_box.svg'),
                                padding: EdgeInsets.zero,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/apple_box.svg'),
                                padding: EdgeInsets.zero,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/google_box.svg'),
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.85 -
                            MediaQuery.of(context).size.height +
                            35,
                        left: 0,
                        right: 0,
                        child: IgnorePointer(
                          ignoring: true,
                          child: GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
