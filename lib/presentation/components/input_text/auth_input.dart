import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/presentation/pages/login/login_controller.dart';
import 'package:training_app/presentation/theme/theme.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key? key,
    this.hintText,
    this.validator,
    this.inputPassword = false,
    this.controller,
  }) : super(key: key);

  final String? hintText;
  final String? Function(String?)? validator;
  final bool inputPassword;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      Color? color = ref.watch(loginController).status == AuthStatus.fail ||
              (controller!.text.isEmpty &&
                  ref.watch(loginController).status == AuthStatus.empty)
          ? AppColors.red
          : null;
      final borderStyle = OutlineInputBorder(
          borderSide: BorderSide(color: color ?? AppColors.grey));
      return TextFormField(
        controller: controller,
        maxLines: 1,
        obscureText: inputPassword,
        obscuringCharacter: 'X',
        validator: validator,
        style:
            TextStyles.mediumRegular.copyWith(color: color ?? AppColors.black),
        decoration: InputDecoration(
          helperMaxLines: 1,
          helperText: '',
          hintText: hintText,
          // errorText: '',

          fillColor: color?.withOpacity(0.05),
          hintStyle: TextStyles.mediumRegular.copyWith(color: AppColors.grey),
          errorStyle:
              TextStyles.mediumRegular.copyWith(color: Colors.transparent),
          filled: color != null,
          // errorStyle: TextStyles.,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppStyles.horizontalMargin,
            vertical: 0,
          ),
          isDense: false,

          enabledBorder: borderStyle,

          focusedBorder: borderStyle,
          // focusedErrorBorder: borderStyle.copyWith(
          //     borderSide: const BorderSide(color: AppColors.red)),
          // errorBorder: borderStyle.copyWith(
          //     borderSide: const BorderSide(color: AppColors.red)),
        ),
      );
    });
  }
}
