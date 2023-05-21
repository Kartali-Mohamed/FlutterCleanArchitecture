import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../helpers/helper.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 3,
      child: Center(
          child: SingleChildScrollView(
        child: Text(
          message,
          style: TextStyle(fontSize: 25.sp),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}
