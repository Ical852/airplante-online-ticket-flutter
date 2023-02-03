import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSuccessPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    Widget image() {
      return Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_calendar.png')
          )
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 80
        ),
        child: Column(
          children: [
            Text(
              "Well Booked 😍",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget btnMyBooking() {
      return Container(
        margin: EdgeInsets.only(
          top : 50
        ),
        child: CustomButton(width: 220 ,title: "My Bookings", onPress: (){
          context.read<PageCubit>().setPage(1);
          Navigator.pushNamed(context, "/main");
        }),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(),
            title(),
            btnMyBooking()
          ],
        ),
      ),
    );
  }
}