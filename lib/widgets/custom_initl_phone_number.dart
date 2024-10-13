import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomIntlPhoneNumber extends StatelessWidget {
  const CustomIntlPhoneNumber({
    super.key,
    required this.controller,
    required this.formKey,
    required this.isChanged,
    required this.onFullNumber,
  });

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final bool isChanged;

  final Function(String) onFullNumber;

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
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: "TR",
      //  languageCode: 'en',
      disableLengthCheck: true,
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: AppColors.lightColor,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primaryColor,
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
      ),
      style: AppTextStyles()
          .medium14(context)
          .copyWith(color: AppColors.darkColor),
      validator: (text) {
        RegExp regExp = RegExp(r'^\+?[0-9]{10,15}$');

        if (text == null || text.number.isEmpty) {
          return "Phone number is required";
        } else if (!regExp.hasMatch(text.number)) {
          return "Enter a valid phone number";
        }
        return null;
      },
      onChanged: (phone) {
        String fullNumber = '${phone.countryCode}${phone.number}';
        onFullNumber(fullNumber);

        if (isChanged) {
          formKey.currentState!.validate();
        }
      },
    );
  }
}
