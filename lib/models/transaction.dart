import 'package:airplane/models/destination.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  String id;
  DestinationModel destination;
  int amountOfTraveler;
  String selectedSeats;
  bool insurace;
  bool refundable;
  double vat;
  int price;
  int grandTotal;

  TransactionModel({
    this.id = '',
    required this.destination,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.insurace = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0
  });

  @override
  List<Object?> get props => [
    destination,
    amountOfTraveler,
    selectedSeats,
    insurace,
    refundable,
    vat,
    price,
    grandTotal
  ];

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      id: id,
      destination: DestinationModel.fromJson(json['destination']['id'], json['destination']),
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeats: json['selectedSeats'],
      insurace: json['insurace'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }
  
}