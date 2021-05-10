import 'package:flutter/material.dart';
import 'package:food_ordering/model/order.dart';
import 'package:food_ordering/repository/order_repository.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: OrderRepository.orderStream(),
        builder: (_, AsyncSnapshot<List<Order>> orderSnapshot) {
          if (orderSnapshot.hasData) {
            return ListView(children: [
              SizedBox(
                height: 24,
              ),
              ...buildChildren(orderSnapshot.data),
            ]);
          }

          return Container();
        },
      ),
    );
  }

  List<Widget> buildChildren(List<Order> orders) {
    final children = <Widget>[];

    final style = TextStyle(fontSize: 16);

    for (var order in orders) {
      final date = DateTime.fromMillisecondsSinceEpoch(order.timestamp);
      children.addAll([
        // ListTile(
        //   title: Text('${order.name}'),
        //   subtitle: Text('${order.items.map((e) => e.name).reduce((value, element) => value + '\n' + element)}'),
        //   onTap: () {
        //     order.status = OrderStatus.preparing;
        //     OrderRepository.updateStatus(order);
        //   },
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    order.uuid.toString(),
                    style: style,
                  ),
                  Spacer(),
                  Text(
                    '${date.month}-${date.day}-${date.year} ${date.hour}:${date.minute}',
                    style: style,
                  ),
                ],
              ),
              Text(
                'Name: ' + order.name,
                style: style,
              ),
              Text(
                'Phone Number' + order.phoneNumber,
                style: style,
              ),
              Text(
                'Items: ',
                style: style,
              ),
              ...order.items.map(
                (e) => Text(
                  e.name,
                  style: style,
                ),
              ),
              Row(
                children: [Spacer(), buildButton(order)],
              )
            ],
          ),
        ),
        Divider(),
      ]);
    }

    children.add(SizedBox(
      height: 64,
    ));

    return children;
  }

  Widget buildButton(Order order) {
    switch (order.status) {
      case OrderStatus.placed:
        return ElevatedButton(
            onPressed: () {
              order.status = OrderStatus.preparing;
              OrderRepository.updateStatus(order);
            },
            child: Text('Prepare'));
      case OrderStatus.preparing:
        return ElevatedButton(
            onPressed: () {
              order.status = OrderStatus.waiting;
              OrderRepository.updateStatus(order);
            },
            child: Text('Done'));
      case OrderStatus.waiting:
        return Container();
      default:
        return Container();
    }
  }
}
