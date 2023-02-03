import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String id;
  String email;
  String name;
  String hobby;
  int balance;

  UserModel({
    required this.id, 
    required this.email, 
    required this.name, 
    this.hobby = "", 
    this.balance = 0});
  
  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}