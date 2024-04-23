import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar/foodie_app_bar.dart';
import 'package:food_app/components/app_box_shadow.dart';
import 'package:food_app/components/button/app_elevated_button.dart';
import 'package:food_app/gen/assets.gen.dart';
import 'package:food_app/models/payment_method_model.dart';

import '../cart/cart_page.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(title: 'Payment Method'),
      body: Stack(
        children: [
          Positioned.fill(
            left: 0,
            right: 0,
            top: 0,
            bottom: 150,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(top: 40.0, bottom: 20.0),
                itemBuilder: (context, index) {
                  return _paymentMethodItem(
                      onPressed: () {
                        for (var element in paymentMethods) {
                          element.isSelected = false;
                        }
                        paymentMethods[index].isSelected = true;
                        setState(() {});
                      },
                      paymentMethod: paymentMethods[index]);
                },
                separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                itemCount: paymentMethods.length),
          ),
          Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 60.0,
              child: AppElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const CartPage()),
                        (Route<dynamic> route) => false,
                      ),
                  text: 'Next'))
        ],
      ),
    );
  }

  Widget _paymentMethodItem(
      {Function()? onPressed, required PaymentMethodModel paymentMethod}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0)
            .copyWith(left: 20.0, right: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                paymentMethod.name ?? '-:-',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
            Image.asset(
              (paymentMethod.isSelected == true
                      ? Assets.images.radioButtonOn
                      : Assets.images.radioButtonOff)
                  .path,
              width: 18.0,
            )
          ],
        ),
      ),
    );
  }
}
