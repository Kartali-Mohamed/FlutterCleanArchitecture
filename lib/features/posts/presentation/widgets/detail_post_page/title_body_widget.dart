import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleBodyWidget extends StatelessWidget {
  final String text;
  final bool isTitle;
  const TitleBodyWidget({Key? key, required this.text, required this.isTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isTitle ? 19.sp : 15.sp,
          fontWeight: isTitle ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
