class IntentPaymentSheetRequestModel {
  final String clientSecret;
  final String ephmeralKeySecret;
  final String customerId;

  IntentPaymentSheetRequestModel({
    required this.ephmeralKeySecret,
    required this.customerId,
    required this.clientSecret,
  });
}
