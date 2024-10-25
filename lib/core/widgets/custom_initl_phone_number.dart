import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class CustomIntlPhoneNumber extends StatefulWidget {
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

  @override
  CustomIntlPhoneNumberState createState() => CustomIntlPhoneNumberState();
}

class CustomIntlPhoneNumberState extends State<CustomIntlPhoneNumber> {
  OutlineInputBorder outlineInputNone(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.colorScheme.onSecondary),
      borderRadius: BorderRadius.circular(32),
    );
  }

  OutlineInputBorder outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.colorScheme.primary),
      borderRadius: BorderRadius.circular(32),
    );
  }

  OutlineInputBorder outlineInputError(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Get.theme.colorScheme.onError),
      borderRadius: BorderRadius.circular(32),
    );
  }

  void onFullNumberChanged(String number) {
    // استخدام WidgetsBinding لتأجيل setState حتى بعد اكتمال التخطيط الحالي
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          widget.onFullNumber(number);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.controller,
      initialCountryCode: "TR",
      disableLengthCheck: true,
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Get.theme.colorScheme.primary,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: outlineInputNone(context),
        focusedBorder: outlineInputBorder(context),
        errorBorder: outlineInputError(context),
        focusedErrorBorder: outlineInputBorder(context),
        disabledBorder: outlineInputNone(context),
        border: outlineInputNone(context),
        errorMaxLines: 3,
        fillColor: Get.theme.colorScheme.surface,
      ),
      style: AppTextStyles()
          .medium14()
          .copyWith(color: Get.theme.colorScheme.secondary),
      validator: (phone) {
        RegExp regExp = RegExp(r'^\+?[0-9]{10,15}$');
        if (phone == null || phone.number.trim().isEmpty) {
          return "Phone number is required";
        } else if (!regExp.hasMatch(phone.number)) {
          return "Enter a valid phone number";
        }
        return null;
      },
      onChanged: (phone) {
        String fullNumber = '${phone.countryCode}${phone.number}';
        onFullNumberChanged(fullNumber);
        if (widget.isChanged) {
          widget.formKey.currentState!.validate();
        }
      },
    );
  }
}