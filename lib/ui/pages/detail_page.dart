import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/item_check.dart';
import 'package:airplane/ui/widgets/item_photo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {

  DestinationModel destination;
  DetailPage(this.destination);

  @override
  Widget build(BuildContext context) {

    Widget bgImage() {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(destination.imageUrl)
        )
      ),
    );
  }

  Widget boxShadow() {
    return Container(
      margin: EdgeInsets.only(
        top: 236
      ),
      width: double.infinity,
      height: 214,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kWhiteColor.withOpacity(0),
            Color(0xff000000).withOpacity(0.25),
            Color(0xff000000).withOpacity(0.45),
            Color(0xff000000).withOpacity(0.65),
            Color(0xff000000).withOpacity(0.95),
          ]
        )
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: 108,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ic_emblem.png')
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 256
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold
                        ),
                      ),
                      Text(
                        destination.city,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 2
                      ),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/ic_star.png')
                        )
                      ),
                    ),
                    Text(
                      destination.rating.toString(),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30
            ),
            width: double.infinity,
            height: 460,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  blurRadius: 2,
                  offset : Offset(0,2)
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                  "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali. Berada di jalur jalan provinsi yang menghubungkan Denpasar.",
                  style: blackTextStyle.copyWith(
                    height: 2,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Photos",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold
                  ),
                ),
                SizedBox(height: 6,),
                Row(
                  children: [
                    ItemPhoto(
                      imageUrl: "assets/image_photo1.png",
                    ),
                    ItemPhoto(
                      imageUrl: "assets/image_photo2.png",
                    ),
                    ItemPhoto(
                      imageUrl: "assets/image_photo3.png",
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "Interests",
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    ItemCheck(
                      text: "Kids Park",
                    ),
                    ItemCheck(
                      text: "Honor Bridge",
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    ItemCheck(
                      text: "City Museum",
                    ),
                    ItemCheck(
                      text: "Central Mall",
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: 31
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(destination.price),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "per orang",
                        style: greyTextStyle.copyWith(
                          fontWeight: light
                        ),
                      )
                    ],
                  ),
                ),
                CustomButton(title: "Book Now", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeatPage(destination)));
                }, width: 170,)
              ],
            ),
          )
        ],
      ),
    );
  }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            bgImage(),
            boxShadow(),
            content()
          ],
        ),
      ),
    );
  }
}