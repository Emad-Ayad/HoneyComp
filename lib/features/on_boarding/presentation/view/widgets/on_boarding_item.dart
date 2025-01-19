import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honey_comp/gen/assets.gen.dart';
import 'package:honey_comp/generated/l10n.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  final String  image;
  final Widget title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.55,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(Assets.images.backgroundGreen,
                    fit: BoxFit.fill),
              ),
              Positioned(
                right: 25,
                top: 30,
                child: TextButton(onPressed: (){}, child:  Text(S.of(context).skip)),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SizedBox(
                  height: 175,
                  width: 175,
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        title,
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(subTitle,textAlign: TextAlign.center,style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),),
        ),
      ],
    );
  }
}
