import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class ItemCheck extends StatelessWidget {

  String text;

  ItemCheck({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 6
            ),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ic_check.png')
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}