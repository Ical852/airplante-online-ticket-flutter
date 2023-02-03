import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/text_input_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    TextEditingController hobbyController = TextEditingController(text: "");

    Widget title() {
      return Container(
        margin:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Join us and get\nyour next journey",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget submitButton() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context, "/bonus", (route) => false);
          } else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error)
              )
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
              title: "Get Started",
              onPress: () {
                context.read<AuthCubit>().signUp(
                  email: emailController.text, 
                  password: passwordController.text, 
                  name: nameController.text,
                  hobby: hobbyController.text
                );
              });
        },
      );
    }

    Widget formInput() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 30),
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
          children: [
            TextInputCustom(
              label: "Full Name",
              hintext: "Your Full Name",
              controller: nameController,
            ),
            TextInputCustom(
              label: "Email Address",
              hintext: "Your Email Address",
              controller: emailController,
            ),
            TextInputCustom(
              label: "Password",
              hintext: "Your Password",
              obscureText: true,
              controller: passwordController,
            ),
            TextInputCustom(
              label: "Hobby",
              hintext: "Your Hobby",
              controller: hobbyController,
            ),
            submitButton()
          ],
        ),
      );
    }

    Widget signIngButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "/sign-in");
        },
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(
            "Habe an account? Sign In !",
            textAlign: TextAlign.center,
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
        children: [title(), formInput(), signIngButton()],
      ),
    );
  }
}
