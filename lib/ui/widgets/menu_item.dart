import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemCustom extends StatelessWidget {

  String menuIcon;
  int index;

  MenuItemCustom({required this.menuIcon, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 5,),
          Image.asset(
            menuIcon,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index ? kPrimaryColor : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index ? kPrimaryColor : kWhiteColor
            ),
          )
        ],
      ),
    );
  }
}