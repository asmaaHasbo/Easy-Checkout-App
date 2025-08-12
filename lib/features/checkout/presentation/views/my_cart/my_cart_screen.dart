import 'package:easy_checkout/core/shared/custom_elevated_btn.dart';
import 'package:easy_checkout/core/themes/styles/app_styles.dart';
import 'package:easy_checkout/features/checkout/data/repos/checkout_repo_implmention.dart';
import 'package:easy_checkout/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:easy_checkout/features/checkout/presentation/views/my_cart/widgets/cart_price_info.dart';
import 'package:easy_checkout/features/checkout/presentation/views/my_cart/widgets/choose_payment_way_modal_sheet.dart';
import 'package:easy_checkout/features/checkout/presentation/views/my_cart/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text('My Cart', style: AppStyles.font25W500Black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/images/my_cart.png')),

              SizedBox(height: 24.h),
              CartPriceInfo(priceName: 'Order Subtotal', price: '\$19.99'),
              SizedBox(height: 5.h),

              CartPriceInfo(priceName: 'Discount', price: '\$19.99'),
              SizedBox(height: 5.h),

              CartPriceInfo(priceName: 'Shipping', price: '\$19.99'),

              Divider(
                color: Color(0xffC7C7C7),
                thickness: 2,
                indent: 16,
                endIndent: 16,
                height: 32.h,
              ),

              TotalPrice(price: '19.9'),

              SizedBox(height: 20.h),

              CustomElevatedBtn(
                onPress: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create:
                            (context) =>
                                CheckoutCubit(CheckoutRepoImplmention()),
                        child: ChoosePaymentWayModalSheet(),
                      );
                    },
                  );
                },
                btnName: 'Complete Payment',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
