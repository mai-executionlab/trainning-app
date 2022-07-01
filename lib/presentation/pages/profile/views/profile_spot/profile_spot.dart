import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/data/data_source/mock.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/widgets/spot_item.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileSpot extends StatelessWidget {
  const ProfileSpot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String img =
        'https://s3-alpha-sig.figma.com/img/b4e2/f648/aad0d867023f5e294ac5862683d16fc0?Expires=1657497600&Signature=DlS0aMlEIOjPDCEL66z5m~zKNqoydl~CyWnaR~BJq2PeNnL4uzwX1sGS63oWyj1ELNhnZNPUImfXwmYLhVRc1ex7btW5~LOczqhg5O~0Rwxw8OyNNwWB2aLRwH-85snakhsBVSsAJd-oygy0uv2~lPZOitrHIghhny6gF19YxtUlcrIvVPhjkz5Xz-MQ8eNY2bAojXhV6DpCEsfBaNGSaon6AP9YqzmlmYDXBc9PfUTfe~rf49b38NdyRYIOysGbiwhcFxkk~GpRHDvsMX34KmliC7bbxQLfaCHKcAz5sFDZgl-6rFbraLuk9u3Ir5fOO3NGPtUiqgKUBUp6edXv1A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA';
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.horizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '案内できる観光地',
                  style: TextStyles.extraLargeBold,
                ),
              ),
              CustomButton(
                height: 24,
                width: 24,
                icon: SvgPicture.asset(
                  AppAssets.edit,
                  width: 24,
                ),
                bgColor: Colors.transparent,
                onPressed: () {},
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 25),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SpotItem(
                    img: listSpot[index]['img'],
                    title: listSpot[index]['title'],
                    content: listSpot[index]['content'],
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              itemCount: listSpot.length)
        ],
      ),
    );
  }
}
