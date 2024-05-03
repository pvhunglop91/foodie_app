import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar/foodie_app_bar.dart';
import 'package:food_app/components/app_box_shadow.dart';
import 'package:food_app/pages/payment/address_page.dart';
import 'package:food_app/pages/payment/payment_method_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => Navigator.pop(context),
        title: 'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0)
            .copyWith(top: 40.0, bottom: 20.0),
        child: Column(
          children: [
            _paymentItem('Choose Address',
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const AddressPage()),
                      ),
                    )),
            const SizedBox(height: 20.0),
            _paymentItem(
              'Choose Method',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const PaymentMethodPage()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//method widget - ko performance  = class widget
//de ngoai {} thi ko can susghec
  Widget _paymentItem(String text, {Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20)
            .copyWith(left: 20, right: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text)),
            // const Expanded(child: SizedBox()),
            // Spacer(),
            const Icon(
              Icons.navigate_next,
              size: 25.0,
            )
          ],
        ),
      ),
    );
  }
}
