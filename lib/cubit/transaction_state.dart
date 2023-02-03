part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailed extends TransactionState {
  String error;

  TransactionFailed(this.error);

  @override
  List<Object> get props => [error];
}

class TransactionSuccess extends TransactionState {
  List<TransactionModel> transaction;

  TransactionSuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}