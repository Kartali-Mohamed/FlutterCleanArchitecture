import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final bool multiLines;
  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.name,
      required this.multiLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
      child: TextFormField(
        controller: controller,
        validator: (val) => val!.isEmpty ? "$name can't be empty" : null,
        decoration: InputDecoration(hintText: name),
        maxLines: multiLines ? 6 : 1,
        minLines: multiLines ? 6 : 1,
      ),
    );
  }
}
