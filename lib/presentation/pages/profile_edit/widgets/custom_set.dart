import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/components/components.dart';
import 'package:training_app/presentation/pages/profile_edit/widgets/label.dart';

//dont have toggle language
class CustomSet extends StatelessWidget {
  CustomSet({
    Key? key,
    required this.label,
    this.isRequired,
    this.controller,
    this.hint,
    this.maxLength,
    Widget? child,
    // this.bilingual = true,
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

  // final bool bilingual;

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
