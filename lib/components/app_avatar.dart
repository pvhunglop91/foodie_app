import 'dart:io';

import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.avatar,
    this.radius = 24.0,
    this.isActive = false,
  });

  final String? avatar; //duong dan anh
  final double radius;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //cach lam vien cho avt cach 2.
        Container(
          width: radius * 2.0,
          height: radius * 2.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: avatar == null
                  // ? Image.asset(Assets.images.avatarDefault.path).image //cach2
                  // ? Assets.images.avatarDefault.provider() //cach3
                  ? AssetImage(Assets.images.avatarDefault.path) //cach 1
                      as ImageProvider
                  // : AssetImage(avatar!),
                  : FileImage(File(avatar!)),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //cach lam vien` cho cai avt ben ngoai. c2

        // CircleAvatar(
        //   backgroundColor: Colors.red,
        //   radius: radius,
        //   child: CircleAvatar(
        //     backgroundImage: avatar == null
        //         ? AssetImage(Assets.images.avatarDefault.path)
        //         : AssetImage(avatar!),
        //     radius: radius - 1,
        //   ),
        // ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: avatar == null
              ? Container(
                  padding: const EdgeInsets.all(2.6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 16.8,
                    color: Colors.pink,
                  ),
                )
              : CircleAvatar(
                  backgroundColor:
                      isActive == true ? Colors.green : Colors.orange,
                  radius: radius / 4.0),
        )
      ],
    );
  }
}
