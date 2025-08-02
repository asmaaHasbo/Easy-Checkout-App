// ignore_for_file: avoid_print

import 'package:easy_checkout/core/shared/custom_elevated_btn.dart';
import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:easy_checkout/features/checkout/presentation/views/payment_ways/widgets/custom_credit_card.dart';
import 'package:easy_checkout/features/checkout/presentation/views/payment_ways/widgets/payments_ways_list_view.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentWays extends StatefulWidget {
  const PaymentWays({super.key});

  @override
  State<PaymentWays> createState() => _PaymentWaysState();
}

class _PaymentWaysState extends State<PaymentWays> {
  final isActive = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // This is used to control the validation mode of the form
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: Center(
            child: Text('Payment Details', style: AppStyles.font25W500Black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PaymentsWaysListView(),
              CustomCreditCard(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomElevatedBtn(
                  onPress: () {
                    if (!formKey.currentState!.validate()) {
                      print('Form is not valid');
                      formKey.currentState!.save();
                      return;
                    } else {
                      // If the form is not valid, we can save the state to show validation errors
                      // This will trigger the validation and show errors if any

                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThankYouView(),
                      ),
                    );
                  },
                  btnName: 'Pay',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
