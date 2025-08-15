class IntentPaymentSheetRequestModel {
  final String clientSecret;
  final String ephmeralKey;
  final String customerId;

  IntentPaymentSheetRequestModel({
    required this.ephmeralKey,
    required this.customerId,
    required this.clientSecret,
  });

  // toJson() {
  //   return {'': ephmeralKey, 'customer': customerId};
  // }
}
