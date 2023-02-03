import 'package:airplane/models/transaction.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/item_check.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {

  TransactionModel transaction;
  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
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
                        image: NetworkImage(transaction.destination.imageUrl))),
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
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
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
                "YES",
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
                "NO",
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
}