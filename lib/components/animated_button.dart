import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController btncontroller,
    required this.press,
  }) : _btncontroller = btncontroller;

  final RiveAnimationController _btncontroller;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Stack(
          children: [
            RiveAnimation.asset(controllers: [
              _btncontroller,
            ], 'assets/RiveAssets/button.riv'),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.arrow_right,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Start the course",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
