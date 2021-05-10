import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:food_ordering/model/menu_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuRepository {
  static Future<List<MenuItem>> fetchMenuItems(String uid) async {
    var menu = await FirebaseFirestore.instance.collection('menus').doc(uid).get();
    var menuItemsJson = menu.data()['items'] as List<dynamic>;
    var menuItems = menuItemsJson.map((e) => MenuItem.fromMap(e)).toList();
    return menuItems;
  }

  // static Future<List<MenuItem>> fetchMenuItemsByOwnerId(String uid) {
  //   var menuItemsJson = FirebaseFirestore.instance.collection('menus');
  // }

  static void uploadMenuItem(String uid, List<MenuItem> menuItems) {
    FirebaseFirestore.instance.collection('menus').doc(uid).set({
      'uid': uid,
      'items': FieldValue.arrayUnion(menuItems.map((e) => e.toMap()).toList()),
    });
  }

  static Future<List<MenuItem>> fetchMenu() {
    return http.get(Uri.http('localhost:8102', '/orderUp/menu'), headers: {"Access-Control-Allow-Origin": "*"}).then((value) {
      final itemsJson = jsonDecode(value.body) as List;

      final items = itemsJson.map((e) => MenuItem.fromMap(e)).toList();

      return items;
    });
  }

  static void updateItem(MenuItem item) {
    http.patch(Uri.http('localhost:8102', '/orderUp/menu/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'price': item.price,
          'name': item.name,
          'imageUrl': "",
          'uid': item.uid,
        }));
  }

  static void deleteItem(MenuItem item) {
    http.delete(Uri.http('localhost:8102', '/orderUp/menu/remove'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'price': item.price,
          'name': item.name,
          'imageUrl': "",
          'uid': item.uid,
        }));
  }

  static void uploadItem(MenuItem item) {
    http.post(Uri.http('localhost:8102', '/orderUp/menu/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'price': item.price,
          'name': item.name,
          'imageUrl': "",
          'uid': item.uid,
        }));
  }
}
