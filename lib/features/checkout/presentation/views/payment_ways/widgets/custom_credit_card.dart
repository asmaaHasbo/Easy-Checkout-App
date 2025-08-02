import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String cardHolderName = '';
  String cvvCode = '';
  String expiryDate = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          expiryDate: expiryDate,
          onCreditCardWidgetChange: (value) {},
          showBackView: showBackView,
          isHolderNameVisible: true,
        ),

        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          autovalidateMode: widget.autovalidateMode ,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            expiryDate = creditCardModel.expiryDate;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        ),

        // SizedBox(height: 100.0),
        // SizedBox(height: 100.0),
        // SizedBox(height: 100.0),
        // SizedBox(height: 100.0),
        // SizedBox(height: 100.0),
        // SizedBox(height: 100.0),
      ],
    );
  }
}
