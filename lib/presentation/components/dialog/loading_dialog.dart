import 'package:flutter/material.dart';
import 'package:training_app/presentation/theme/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black.withOpacity(0.7),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0)),
      child: const SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
