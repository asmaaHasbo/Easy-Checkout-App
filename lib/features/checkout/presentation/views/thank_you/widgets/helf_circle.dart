 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Positioned buildHelfCircle(BuildContext context, {rightSpace, lefScpace}) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.2,
      left: lefScpace,
      right: rightSpace,
      child: Icon(Icons.circle, color: Colors.white, size: 40.w),
    );
  }
