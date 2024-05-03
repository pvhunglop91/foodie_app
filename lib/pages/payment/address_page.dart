import 'package:flutter/material.dart';
import '../../components/app_bar/foodie_app_bar.dart';
import '../../components/button/app_elevated_button.dart';
import '../../models/address_model.dart';
import '../cart/cart_page.dart';
import 'widget/address_item.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => Navigator.of(context).pop(),
        title: 'Choose Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 24.0, bottom: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressItem(
                      onTap: () {
                        for (var element in addresses) {
                          element.isSelected = false;
                        }
                        address.isSelected = true;
                        setState(() {});
                      },
                      address: address);
                },
                separatorBuilder: (context, index) => index % 2 == 0
                    ? const SizedBox(height: 20.0)
                    : Container(
                        height: 1.2,
                        color: Colors.grey,
                      ),
                itemCount: addresses.length,
              ),
              const SizedBox(height: 46.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppElevatedButton.smallOutline(
                    icon: Icon(Icons.add),
                    text: 'Add new Address',
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  // const Expanded(flex: 2, child: SizedBox())
                ],
              ),
              const SizedBox(height: 72.0),
              AppElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const CartPage()),
                        (Route<dynamic> route) => false,
                      ),
                  text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
