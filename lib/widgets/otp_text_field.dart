import 'package:flutter/material.dart';
import 'package:quick_shop/core/constants/app_colors.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class OtpTextField extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  const OtpTextField({
    super.key,
    required this.length,
    required this.onCompleted,
    required this.onChanged,
  });

  @override
  OtpTextFieldState createState() => OtpTextFieldState();
}

class OtpTextFieldState extends State<OtpTextField> {
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  String otp = "";

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.length, (_) => TextEditingController());
    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  void _handleInput(String value, int index) {
    setState(() {
      otp = controllers.map((c) => c.text).join('');
      widget.onChanged(otp);
    });

    if (value.isNotEmpty && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            style: AppTextStyles().blackBold24(context).copyWith(
                  color: AppColors.primaryColor,
                ),
            maxLength: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: AppColors.grayColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide:
                    const BorderSide(color: AppColors.primaryLightColor),
              ),
              fillColor: AppColors.nonActiveColor,
              filled: true,
            ),
            onChanged: (value) => _handleInput(value, index),
          ),
        );
      }),
    );
  }
}
