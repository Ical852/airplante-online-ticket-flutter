import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transaction.length == 0) {
            return Center(child: Text("No Transaction Yet"),);
          } else {
            return ListView.builder(
              padding: EdgeInsets.only(bottom: 120, top: 30),
              itemCount: state.transaction.length,
              itemBuilder: (context, index) {
                return TransactionCard(state.transaction[index]);
              }
            );
          }
        }

        return Center(
          child: Text(
            "No Transaction Yet",
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        );
      },
    );
  }
}
