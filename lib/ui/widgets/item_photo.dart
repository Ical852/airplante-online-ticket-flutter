import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class ItemPhoto extends StatelessWidget {

  String imageUrl;

  ItemPhoto({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16
      ),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
          image: AssetImage(imageUrl)
        )
      ),
    );
  }
}