import 'package:flutter/cupertino.dart';
import 'package:training_app/domain/entities/entity.dart';
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
  final List<Media?> listImg;
  final MediaType type;
  @override
  Widget build(BuildContext context) {
    var nonnullList = listImg
        .where((element) => element?.mediumAttachmentUrl != null)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: (type == MediaType.byAlbum
                  ? TextStyles.mediumBold
                  : TextStyles.largRegular) //14 bold vs 16 regular
              .copyWith(color: AppColors.black), // check type of album
        ),
        const SizedBox(height: 16),
        if (nonnullList.isNotEmpty)
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: nonnullList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
              ),
              itemBuilder: (context, index) => NetImage(
                    width: 107,
                    height: 107,
                    imageUrl: nonnullList[index]?.mediumAttachmentUrl ?? '',
                    radius: 4,
                  ))
      ],
    );
  }
}
