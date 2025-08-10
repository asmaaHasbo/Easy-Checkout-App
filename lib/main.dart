import 'package:easy_checkout/features/checkout/presentation/views/my_cart/my_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.libreBaskervilleTextTheme()),
      home: Builder(
        builder: (context) {
          // تهيئة ScreenUtil
          ScreenUtil.init(
            context,
            designSize: const Size(375, 812), // حجم التصميم (عادةً من Figma)
            minTextAdapt: true, // تفعيل تكييف النصوص
            splitScreenMode: true, // دعم الشاشات المنقسمة
          );
          return MyCartScreen();
        },
      ),
    );
  }
}
