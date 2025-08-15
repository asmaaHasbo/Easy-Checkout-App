import 'package:easy_checkout/core/api/api_keys.dart';
import 'package:easy_checkout/core/api/api_service.dart';
import 'package:easy_checkout/features/checkout/data/models/ephemralkey_model/ephemralkey_model.dart';
import 'package:easy_checkout/features/checkout/data/models/init_payment_sheet_resquest_model.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_request_model.dart';
import 'package:easy_checkout/features/checkout/data/models/payment_intent_response_model/payment_intent_response_model.dart';
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
        customerEphemeralKeySecret: intentPaymentSheetRequestModel.ephmeralKey,
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


    var paymentIntentResponseModel = awai createPaymentIntent(
      paymentIntentRequestModel,
    );


    var ephemralkeyModel = await createCustomer(
      customerId: paymentIntentRequestModel.customerId,
    );

    var intentPaymentSheetRequestModel =
        IntentPaymentSheetRequestModel(
      clientSecret: paymentIntentResponseModel.clientSecret ?? '',
      ephmeralKey: ephemralkeyModel.secret ?? '' ,
      customerId: paymentIntentRequestModel.customerId ,
    );



    await integratePaymentSheet(
     intentPaymentSheetRequestModel: intentPaymentSheetRequestModel
    );

    
    await displayPaymentSheet();
  }

  Future<EphemralkeyModel> createCustomer({required String customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: {'customer': customerId},
      token: ApiKeys.secretkey,
      headres: {
        'Authorization': 'Bearer $ApiKeys.secretkey',
        'Stripe-Version': '2025-07-30.basil',
      },
    );

    var ephemralkeyModel = EphemralkeyModel.fromJson(response.data);

    return ephemralkeyModel;
  }
}
