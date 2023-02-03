import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/settings_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  Widget customBottomNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 30),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuItemCustom(
              menuIcon: "assets/ic_home.png",
              index: 0,
            ),
            MenuItemCustom(
              menuIcon: "assets/ic_book.png",
              index: 1,
            ),
            MenuItemCustom(
              menuIcon: "assets/ic_card.png",
              index: 2,
            ),
            MenuItemCustom(
              menuIcon: "assets/ic_settings.png",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return TransactionPage();
      case 2:
        return WalletPage();
      case 3:
        return SettingsPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}
