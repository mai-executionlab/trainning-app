import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile_edit/profile_edit_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/label.dart';

class CustomSet extends StatelessWidget {
  CustomSet({
    Key? key,
    required this.label,
    this.isRequired,
    this.controller,
    this.hint,
    this.maxLength,
    Widget? child,
    this.bilingual = true,
  })  : _child = child ??
            InputText(
              controller: controller!,
              hint: hint,
              length: maxLength,
            ),
        super(key: key);

  final String label;
  final bool? isRequired;
  final TextEditingController? controller;
  final String? hint;
  final int? maxLength;
  final Widget _child;

  final bool bilingual;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                label: label,
                isRequired: isRequired,
              ),
              if (bilingual)
                Consumer(builder: (context, ref, child) {
                  final currentLanguage =
                      ref.watch(toggleLanguageEditController);
                  return ToggleButton2(
                    left: '日本語',
                    right: '〇〇語',
                    isSelected: currentLanguage,
                    onPressed: (index) {
                      if (!currentLanguage[index]) {
                        ref
                            .read(toggleLanguageEditController.notifier)
                            .onToggle(index: index);
                      }
                    },
                  );
                }),
            ],
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.maxFinite,
          child: _child,
        ),
      ],
    );
  }
}
