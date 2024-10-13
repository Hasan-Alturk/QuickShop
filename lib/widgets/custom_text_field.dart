import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.validator,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon = false,
    //  this.focusNode, // Optional FocusNode can be passed

    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final String? prefixIcon;
  final bool suffixIcon;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  OutlineInputBorder outlineInputNone() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grayColor),
      borderRadius: BorderRadius.circular(32),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(32),
    );
  }

  OutlineInputBorder outlineInputError() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.redColor),
      borderRadius: BorderRadius.circular(32),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          obscureText: obscureText,
          cursorColor: AppColors.primaryColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: outlineInputNone(),
            focusedBorder: outlineInputBorder(),
            errorBorder: outlineInputError(),
            focusedErrorBorder: outlineInputBorder(),
            disabledBorder: outlineInputNone(),
            border: outlineInputNone(),
            errorMaxLines: 3,
            fillColor: AppColors.nonActiveColor,
            hintText: widget.hint,
            hintStyle: AppTextStyles()
                .medium14(context)
                .copyWith(color: AppColors.secondryTextColor),
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grayColor,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      fit: BoxFit.none,
                    ),
                  )
                : null,
          ),
          style: AppTextStyles()
              .medium14(context)
              .copyWith(color: AppColors.darkColor),
        ),
      ],
    );
  }
}
