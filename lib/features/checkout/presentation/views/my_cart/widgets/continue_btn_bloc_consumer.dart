import 'dart:developer';

import 'package:easy_checkout/core/shared/custom_elevated_btn.dart';
import 'package:easy_checkout/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:easy_checkout/features/checkout/presentation/views/thank_you/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class ContinueBtnBlocConsumer extends StatelessWidget {
  const ContinueBtnBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ThankYouView()),
          );
        }

        if (state is CheckoutFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomElevatedBtn(
          isLoading: state is CheckoutLoading ? true : false,
          btnName: 'Continue',
          onPress: () {
            // PaymentIntentRequestModel paymentIntentRequestModel =
            //     PaymentIntentRequestModel(
            //       amount: '2000',
            //       currency: 'usd',
            //       customerId: 'cus_SriaNU35kczbzX',
            //       // Example customer ID
            //     );
            // BlocProvider.of<CheckoutCubit>(
            //   context,
            // ).makePayment(paymentIntentRequestModel);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (BuildContext context) => PaypalCheckoutView(
                      sandboxMode: true,
                      clientId: "YOUR CLIENT ID",
                      secretKey: "YOUR SECRET KEY",
                      //---------- بيانات الاوردر بالتفصيل transactions حط في ال
                      transactions: const [
                        {
                          "amount": {
                            "total": '100',
                            "currency": "USD",
                            "details": {
                              "subtotal": '80',
                              "shipping": '20',
                              "shipping_discount": 0,
                            },
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "Apple",
                                "quantity": 4,
                                "price": '10',
                                "currency": "USD",
                              },
                              {
                                "name": "Pineapple",
                                "quantity": 5,
                                "price": '12',
                                "currency": "USD",
                              },
                            ],

                            // Optional
                            //   "shipping_address": {
                            //     "recipient_name": "Tharwat samy",
                            //     "line1": "tharwat",
                            //     "line2": "",
                            //     "city": "tharwat",
                            //     "country_code": "EG",
                            //     "postal_code": "25025",
                            //     "phone": "+00000000",
                            //     "state": "ALex"
                            //  },
                          },
                        },
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        log("onSuccess: $params");
                        Navigator.pop(context);
                      },
                      onError: (error) {
                        log("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                        Navigator.pop(context);
                      },
                    ),
              ),
            );
          },
        );
      },
    );
  }
}
