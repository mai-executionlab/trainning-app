import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/theme/theme.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String img =
        'https://s3-alpha-sig.figma.com/img/47d5/1338/57484cdd623343e87837bb1052d460a6?Expires=1657497600&Signature=Q6ARQdxc0myZoaF-uwkqH7CWoHd9FbQRY-8HrLsr6ur6wrvRFiYh29r39tQ~xoAA2fyLQ6u3iLt80ejqQg6zmIEfJmHdB1jWMVTaHX5TnUbjwK1UUC3dTj7TQJLdldU8FUuCAhkMwsNB9rRzLNYjBgG3sTQcHRNj2EKOde1105JNEyEFSloRZs9Wn7ldJZT5Bd0cNg1ITsXH-v6UZA1Y5F1PEApinVVPBnND22ywUcZT37mmZKMXSjqQoXwmZxPUakNDhtwmCT49SJknH7ZdtzFlIrqMWHBatritGVKqRYSJSIOQBqowqal2LOHBpZuGdRR7Nvr7nzY6K7sb2qJ5tA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA';

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
                  '沖縄はお任せください！',
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
          const SizedBox(height: 15),
          Text(
            '一緒に特別な思い出を作りましょう！！',
            style: TextStyles.mediumBold,
          ),
          const SizedBox(height: 20),
          Text(
            '私は東京でフリーのツアープランニングをしています。沖縄出身のうちなーんちゅなので、ガイドブックに載っていない情報やお店の事をお伝えできます！お客様のご要望に合わせてプランを組み立てるので、一緒に特別な思い出を作りましょう！！',
            style: TextStyles.mediumRegular
                .copyWith(height: 20 / 14, color: AppColors.brand2),
          ),
          const SizedBox(height: 20),
          NetImage(width: double.maxFinite, height: 218, imageUrl: img),
          const SizedBox(height: 25),
          ////////////////////// folder & tags
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  AppAssets.folder,
                  width: 16,
                ),
              ),
              Text(
                '沖縄本島ガイド会',
                style: TextStyles.mediumRegular,
              ),
            ],
          ),
          const SizedBox(height: 18),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                        height: 24,
                        width: 70,
                        decoration: ShapeDecoration(
                          color: AppColors.brand2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            'ドイツ語',
                            style: TextStyles.smallBold
                                .copyWith(color: AppColors.white, height: 1),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        '日常会話レベル',
                        style: TextStyles.mediumRegular
                            .copyWith(color: AppColors.brand2),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 9),
              itemCount: 3)
        ],
      ),
    );
  }
}
