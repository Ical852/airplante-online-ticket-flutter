import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class TextInputCustom extends StatelessWidget {

  String label;
  String hintext;
  bool obscureText;
  TextEditingController controller;

  TextInputCustom({
    required this.label, 
    required this.hintext, 
    this.obscureText =false,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: blackTextStyle,
          ),
          SizedBox(height: 6,),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 17
              ),
              hintText: hintext,
              hintStyle: greyTextStyle.copyWith(
                fontSize: 16
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kPrimaryColor
                )
              )
            ),
          )
        ],
      ),
    );
  }
}