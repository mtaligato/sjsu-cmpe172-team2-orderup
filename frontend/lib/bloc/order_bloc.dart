import 'package:food_ordering/model/cart_item.dart';
import 'package:food_ordering/model/menu_item.dart';
import 'package:food_ordering/model/order.dart';
import 'package:food_ordering/repository/menu_repository.dart';
import 'package:food_ordering/repository/order_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:food_ordering/provider/firebase_auth_provider.dart';

class OrderBloc {
  static OrderBloc instance = OrderBloc._();

  OrderBloc._();

  BehaviorSubject<List<Order>> _orderFetcher = BehaviorSubject<List<Order>>();

  // void fetchOrders() {
  //   OrderRepository.fetchOrders();
  // }

  dispose() {
    _orderFetcher.close();
  }
}
