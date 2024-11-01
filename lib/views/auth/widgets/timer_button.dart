import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop/core/constants/app_text_styles.dart';

class TimerButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final int timeOutInSeconds;

  const TimerButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.timeOutInSeconds,
  });

  @override
  TimerButtonState createState() => TimerButtonState();
}

class TimerButtonState extends State<TimerButton> {
  late int _remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.timeOutInSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel(); // أوقف المؤقت الحالي
    _startTimer(); // ابدأ مؤقتًا جديدًا
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Get.theme.colorScheme.surface),
      onPressed: _remainingTime == 0
          ? () {
              widget.onPressed(); // نفذ دالة الضغط
              _resetTimer(); // أعد تعيين المؤقت
            }
          : null,
      child: Text(
        _remainingTime == 0 ? widget.label : ' $_remainingTime sec',
        style: AppTextStyles()
            .medium12()
            .copyWith(color: Get.theme.colorScheme.secondary),
      ),
    );
  }
}
