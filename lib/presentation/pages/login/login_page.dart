import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/login/login_controller.dart';
import 'package:training_app/presentation/pages/pages.dart';
import 'package:training_app/presentation/theme/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pwController = TextEditingController();
    // ref.listen<AuthState>(loginProvider, (_, state) {
    //   if (state.status == AuthStatus.success) {
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (_) => const ProfilePage()));
    //   } else if (state.status == AuthStatus.processing) {}
    // });
    return Consumer(
      builder: (context, ref, child) {
        ref.listen<AuthState>(
          loginProvider,
          (preState, state) {
            if (preState?.status == AuthStatus.processing &&
                state.status == AuthStatus.success) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ProfilePage()));
            } else if (state.status == AuthStatus.processing) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => LoadingDialog());
            }
          },
        );
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppStyles.horizontalMargin),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Spacer(flex: 3),
                        const SizedBox(height: 80),
                        Hero(
                          tag: 'logo',
                          child: Center(
                            child: Image.asset(
                              AppAssets.logo,
                              height: 50,
                            ),
                          ),
                        ),
                        // const Spacer(flex: 2),
                        const SizedBox(height: 48),
                        Text(
                          ref.watch(loginProvider).message ?? '',
                          maxLines: 2,
                          style: TextStyles.smallRegular
                              .copyWith(color: AppColors.red),
                        ),

                        const SizedBox(height: 12),
                        AuthInput(
                          hintText: 'メールアドレス',
                          controller: emailController,
                        ),

                        const SizedBox(height: 10),
                        AuthInput(
                          hintText: 'パスワード',
                          inputPassword: true,
                          controller: pwController,
                        ),

                        // const Spacer(flex: 1),
                        const SizedBox(height: 40),
                        PrimaryTextButton(
                          height: 48,
                          width: double.maxFinite,
                          text: 'ログアウト',
                          buttonStyle: ButtonStyles.elevated,
                          onPressed: () {
                            // if () {
                            ref.read(loginProvider.notifier).login(
                                email: emailController.text,
                                pw: pwController.text);
                            // }
                            // formKey.currentState!.validate();
                          },
                        ),

                        // const Spacer(flex: 1),
                        const SizedBox(height: 15),
                        Center(
                          child: Text(
                            'パスワードを忘れた方はこちら',
                            style: TextStyles.mediumRegular
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        // const Spacer(flex: 2),
                        const SizedBox(height: 40),
                        PrimaryTextButton(
                          height: 48,
                          width: double.maxFinite,
                          text: 'ガイドナビとは',
                          buttonStyle: ButtonStyles.outlined,
                          onPressed: () {},
                        ),

                        // const Spacer(flex: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
