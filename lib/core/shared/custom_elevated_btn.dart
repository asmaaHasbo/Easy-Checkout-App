import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    required this.onPress,
    required this.btnName,
    this.isLoading = false,
  });
  final void Function() onPress;
  final String btnName;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff34A853),
        fixedSize: Size(350.w, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child:
          isLoading
              ? CircularProgressIndicator()
              : Text(
                btnName,
                style: AppStyles.font25W500Black.copyWith(fontSize: 22.sp),
              ),
    );
  }
}
