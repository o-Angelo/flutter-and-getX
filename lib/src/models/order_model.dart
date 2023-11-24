import 'package:quitanda/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  String status;
  String copyAndPaste;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  double total;

  OrderModel({
    required this.id,
    required this.status,
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.total,
  });
}
