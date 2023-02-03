import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_success_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/item_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  TransactionModel transaction;

  CheckoutPage(this.transaction);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            EdgeInsets.only(top: 50, left: defaultMargin, right: defaultMargin),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image_checkout.png'))),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Poris",
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        "Tangerang",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TLC",
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        "Ciliwung",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget details() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        height: 427,
        margin:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(transaction.destination.imageUrl))),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/ic_star.png'))),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Booking Details",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ItemCheck(text: "Traveler"),
                Text(
                  transaction.amountOfTraveler.toString() + " Person",
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "Seat"),
                Text(
                  transaction.selectedSeats,
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "Insurance"),
                Text(
                  transaction.insurace ? "YES" : "NO",
                  style: greenTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "Refundable"),
                Text(
                  transaction.refundable ? "YES" : "NO",
                  style: redTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "VAT"),
                Text(
                  "45%",
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "Price"),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transaction.price),
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ItemCheck(text: "Grand Total"),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                      .format(transaction.grandTotal),
                  style: purpleTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.only(
                  top: 30, left: defaultMargin, right: defaultMargin),
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: kBlackColor.withOpacity(0.2),
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image_wallet.png'))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/ic_plane.png'))),
                              ),
                              Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(state.user.balance),
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Current Balance",
                            style: greyTextStyle.copyWith(fontWeight: light),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      );
    }

    Widget checkoutBtn() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context, "/success", (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error)
              )
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(
                top: 30, left: defaultMargin, right: defaultMargin),
            child: CustomButton(
              onPress: () {
                context.read<SeatCubit>().resetSeat();
                context.read<TransactionCubit>().createTransaction(transaction);
              },
              title: "Pay Now",
            ),
          );
        },
      );
    }

    Widget terms() {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            "Terms and Conditions",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          details(),
          paymentDetails(),
          checkoutBtn(),
          terms()
        ],
      ),
    );
  }
}
