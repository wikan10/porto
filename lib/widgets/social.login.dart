import 'package:flutter/material.dart';
import 'package:myapp/colors/global.colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          alignment: Alignment.center,
          child: Text(
            '-Atau Login Dengan-',
            style: TextStyle(
              color: GlobalColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            ///google
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      )
                    ]),
                child: SvgPicture.asset(
                  'assets/google.svg',
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //facebook
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      )
                    ]),
                child: SvgPicture.asset(
                  'assets/facebook.svg',
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //twitterx
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      )
                    ]),
                child: SvgPicture.asset(
                  'assets/twitterx.svg',
                  height: 20,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
