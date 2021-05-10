import 'package:flutter/material.dart';
import 'package:food_ordering/ui/orders_page.dart';

import 'menu_edit_page.dart';

class OwnerOptionsPage extends StatefulWidget {
  @override
  _OwnerOptionsPageState createState() => _OwnerOptionsPageState();
}

class _OwnerOptionsPageState extends State<OwnerOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text('Edit Menu'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => MenuEditPage()));
            },
          ),
          ListTile(
            title: Text('View Orders'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => OrdersPage()));
            },
          ),
        ],
      ),
    );
  }
}
