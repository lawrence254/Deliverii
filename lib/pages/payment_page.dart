import 'package:delifood/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_page.dart';

class PaymentPage extends StatefulWidget{
  const PaymentPage({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode='';
  bool isCvvFocused=false;

  void userTappedPay(){
    if(formKey.currentState!.validate()){
      showDialog(context: context,
      builder:(context)=>AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Card Holder Name: $cardHolderName'),
              Text('Card Number: $cardNumber'),
              Text('Card CVV: $cvvCode'),
              Text('Card Expiry: $expiryDate')
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("Cancel")),
          TextButton(onPressed: (){
            Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryPage()));
                    }, child: const Text("Yes")),
        ],
      ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0){}
          ),

          CreditCardForm(cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data){
                setState(() {
                  cardNumber=data.cardNumber;
                  expiryDate=data.expiryDate;
                  cardHolderName=data.cardHolderName;
                  cvvCode=data.cvvCode;
                });
              },
              formKey: formKey
          ),
          const Spacer(),

          CustomButton(onTap: userTappedPay, label: "Complete Payment"),
          const SizedBox(height: 25,)
        ],
      ),
    );
  }
}