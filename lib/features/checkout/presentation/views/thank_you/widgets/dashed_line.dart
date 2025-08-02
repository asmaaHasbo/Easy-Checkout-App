import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            20,
            (index) => Expanded(
              child: Container(
                width: 20.w,
                color: Colors.black.withValues(alpha: 0.5),
                margin: EdgeInsets.symmetric(horizontal: 2.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
