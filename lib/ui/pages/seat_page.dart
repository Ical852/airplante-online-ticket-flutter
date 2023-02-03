import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination.dart';
import 'package:airplane/models/transaction.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SeatPage extends StatelessWidget {
  DestinationModel destination;

  SeatPage(this.destination);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: defaultMargin),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_available.png'))),
            ),
            Text(
              "Available",
              style: blackTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_selected.png'))),
            ),
            Text(
              "Selected",
              style: blackTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ic_unavailable.png'))),
            ),
            Text(
              "Unavailable",
              style: blackTextStyle,
            )
          ],
        ),
      );
    }

    Widget total(String seat) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Your Seat",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ),
                Text(
                  seat,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total",
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(seat.length),
                  style: purpleTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget seats() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
            margin: EdgeInsets.only(
                top: 30, left: defaultMargin, right: defaultMargin),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: kBlackColor.withOpacity(0.2),
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ],
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      child: Text(
                        "A",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "B",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "C",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "D",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A1',
                    ),
                    SeatItem(
                      id: 'B1',
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "1",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SeatItem(
                      id: 'C1',
                    ),
                    SeatItem(
                      id: 'D1',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "2",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SeatItem(
                      id: 'C2',
                    ),
                    SeatItem(
                      id: 'D2',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A3',
                    ),
                    SeatItem(
                      id: 'B3',
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "3",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SeatItem(
                      id: 'C3',
                    ),
                    SeatItem(
                      id: 'D3',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A4',
                    ),
                    SeatItem(
                      id: 'B4',
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "4",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SeatItem(
                      id: 'C4',
                    ),
                    SeatItem(
                      id: 'D4',
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A5',
                    ),
                    SeatItem(
                      id: 'B5',
                    ),
                    Container(
                      width: 48,
                      child: Text(
                        "5",
                        style: greyTextStyle.copyWith(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SeatItem(
                      id: 'C5',
                    ),
                    SeatItem(
                      id: 'D5',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                total(state.join(', '))
              ],
            ),
          );
        },
      );
    }

    Widget checkoutBtn() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, top: 20),
            child: CustomButton(
                title: "Continue to Checkout",
                onPress: () {

                  int price = destination.price * state.length;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        TransactionModel(
                          destination: destination,
                          amountOfTraveler: state.length,
                          selectedSeats: state.join(', '),
                          insurace: true,
                          refundable: false,
                          price: price,
                          grandTotal: price + (price * 0.45).toInt()
                        )
                      )
                    )
                  );
                }),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [header(), seatStatus(), seats(), checkoutBtn()],
      ),
    );
  }
}
