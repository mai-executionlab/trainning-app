import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training_app/domain/entities/entity.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/controller.dart';
import 'package:training_app/presentation/pages/profile_edit/views/profile_edit/profile_edit_controller.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/label.dart';

//have toggle language
// ignore: must_be_immutable
class CustomToggleSet extends ConsumerWidget {
  const CustomToggleSet({
    Key? key,
    required this.label,
    this.isRequired,
    this.controller1,
    this.controller2,
    this.hint,
    this.maxLength,
    this.child,
    required this.toggleController,
    required this.value,
    // required this.curLanguage,
  }) : super(key: key);

  final String label;
  final bool? isRequired;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final String? hint;
  final int? maxLength;
  final Widget? child;

  final AutoDisposeStateNotifierProvider<ToggleButtonNotifier, List<bool>>
      toggleController;

  // List<Language?> curLanguage;
  final Map<String, dynamic>? value;
  @override
  Widget build(BuildContext context, ref) {
 
    final currentToggle = ref.watch(toggleController);

    ref.listen<Language?>(
      primaryLanguageProvider,
      (previous, next) {
        controller1?.text = value?[next?.code] ?? value?['ja'] ?? '';
      },
    );

    ref.listen<Language?>(
      secondaryLanguageProvider,
      (previous, next) {
        controller2?.text = value?[next?.code] ?? '';
      },
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Label(
              label: label,
              isRequired: isRequired,
            ),
            const SizedBox(width: 10),
            ToggleButton2(
              left: ref.watch(primaryLanguageProvider)?.name ?? '日本語',
              right: ref.watch(secondaryLanguageProvider)?.name ?? 'English',

              isSelected: currentToggle,
              onPressed: (index) {

                if (!currentToggle[index]) {

                  ref.read(toggleController.notifier).onToggle(index: index);
                }
                // print(newText);
                // print(value);
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.maxFinite,
          child: child ??
              InputText(
                controller: (currentToggle[0] ? controller1! : controller2!),
                hint: hint,
                length: maxLength,
              ),
        ),
      ],
    );
  }
}
