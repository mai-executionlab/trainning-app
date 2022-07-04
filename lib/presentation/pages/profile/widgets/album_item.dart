import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile/views/profile_photo/profile_photo_controller.dart';
import 'package:training_app/presentation/theme/colors.dart';
import 'package:training_app/presentation/theme/style.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    Key? key,
    required this.title,
    required this.listImg,
    required this.type,
  }) : super(key: key);

  final String title;
  final List<String> listImg;
  final PhotoType type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:(type== PhotoType.byAlbum? TextStyles.mediumBold : TextStyles.largRegular) //14 bold vs 16 regular
              .copyWith(color: AppColors.black), // check type of album
        ),
        const SizedBox(height: 16),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) => NetImage(
                  width: 107,
                  height: 107,
                  imageUrl: listImg[index],
                  radius: 4,
                ))
      ],
    );
  }
}
