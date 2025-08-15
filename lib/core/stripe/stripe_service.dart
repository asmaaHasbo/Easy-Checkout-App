import 'package:easy_checkout/core/api/api_keys.dart';
import 'package:easy_checkout/core/api/api_service.dart';
import 'package:easy_checkout/features/checkout/data/stripe_models/ephemralkey_model/ephemralkey_model.dart';
import 'package:easy_checkout/features/checkout/data/stripe_models/init_payment_sheet_resquest_model.dart';
import 'package:easy_checkout/features/checkout/data/stripe_models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/data/stripe_models/payment_intent_response_model/payment_intent_response_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  //----------------- Create Payment Intent -----------------
  // This method creates a payment intent using the Stripe API.
  // It takes a PaymentIntentRequestModel as input and returns a PaymentIntentResponseModel.
  // It uses the ApiService to make a POST request to the Stripe API endpoint for payment

  Future<PaymentIntentResponseModel> createPaymentIntent(
    PaymentIntentRequestModel paymentIntentRequestModel,
  ) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentRequestModel.toJson(),
      token: ApiKeys.secretkey,
    );

    var paymentIntentResponseModel = PaymentIntentResponseModel.fromJson(
      response.data,
    );

    return paymentIntentResponseModel;
  }

  //-------------------- integratePaymentSheet ---------------
  // It uses the Flutter Stripe package to set up the payment sheet parameters.
  Future integratePaymentSheet({
    required IntentPaymentSheetRequestModel intentPaymentSheetRequestModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: intentPaymentSheetRequestModel.clientSecret,
        customerId: intentPaymentSheetRequestModel.customerId,
        customerEphemeralKeySecret:
            intentPaymentSheetRequestModel.ephmeralKeySecret,
        merchantDisplayName: 'Asmaa elsaeed',
      ),
    );
  }

  //-------------------- presentPaymentSheet -----------------
  // This method display the payment sheet to the user.

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentRequestModel paymentIntentRequestModel,
  }) async {
    var paymentIntentResponseModel = await createPaymentIntent(
      paymentIntentRequestModel,
    );

    var ephemralkeyModel = await createEphemralKey(
      customerId: paymentIntentRequestModel.customerId,
    );

    var intentPaymentSheetRequestModel = IntentPaymentSheetRequestModel(
      clientSecret: paymentIntentResponseModel.clientSecret!,
      ephmeralKeySecret: ephemralkeyModel.secret!,
      customerId: paymentIntentRequestModel.customerId,
    );

    await integratePaymentSheet(
      intentPaymentSheetRequestModel: intentPaymentSheetRequestModel,
    );

    await displayPaymentSheet();
  }

  Future<EphemralkeyModel> createEphemralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      token: ApiKeys.secretkey,
      headres: {
        'Authorization': 'Bearer ${ApiKeys.secretkey}',
        'Stripe-Version': '2025-07-30.basil',
      },
    );

    var ephemralkeyModel = EphemralkeyModel.fromJson(response.data);

    return ephemralkeyModel;
  }
}
