import 'package:flutter/material.dart';
import '../../../components/app_box_shadow.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/address_model.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, this.onTap, required this.address});

  final Function()? onTap;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    address.titleFirst ?? '-:-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.brown, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    address.isSelected == true
                        ? Assets.images.radioButtonOn.path
                        : Assets.images.radioButtonOff.path,
                    width: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Text(
              address.titleSecond ?? '-:-',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 12.0),
            Text(
              address.description ?? '-:-',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
