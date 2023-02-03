import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {

  String id;
  bool isAvailable;

  SeatItem({this.isAvailable = true, required this.id});

  @override
  Widget build(BuildContext context) {

    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    color() {
      if (!isAvailable) {
        return seatUnavailable;
      } else {
        if (isSelected) {
          return seatSelected;
        } else {
          return seatAvailable;
        }
      }
    }

    border() {
      if (!isAvailable) {
        return seatUnavailable;
      } else {
        if (isSelected) {
          return seatSelected;
        } else {
          return seatSelected;
        }
      }
    }

    String text() {
      if (!isAvailable) {
        return "";
      } else {
        if (isSelected) {
          return "YOU";
        } else {
          return "";
        }
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: color(),
          borderRadius: BorderRadius.circular(defaultRadius),
          border: Border.all(
            color: border(),
            width: 2.5
          )
        ),
        child: Center(child: Text(
          text(),
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold
          ),
        )),
      ),
    );
  }
}