import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image_getstarted.png')
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 50
                  ),
                  width: 292,
                  child: Text(
                    "Explore new world with us and let yourself get an amazing experiences",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                    textAlign: TextAlign.center,               
                  ),
                ),
                CustomButton(
                  title: "Get Started",
                  onPress: (){
                    Navigator.pushNamed(context, "/sign-up");
                  },
                  width: 220,
                ),
                SizedBox(height: 80,)
              ],
            ),
          )
        ],
      ),
    );
  }
}