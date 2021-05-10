import 'package:uuid/uuid.dart';

class MenuItem {
  final String uid;
  final String name;
  final double price;
  final String imageUrl;

  MenuItem(this.name, this.price, this.imageUrl, String uid) : this.uid = uid ?? Uuid().v1();

  MenuItem.fromMap(Map map)
      : name = map['name'],
        price = map['price'],
        imageUrl = '',
        uid = map['uid'];

  Map toMap() => {
        'name': name,
        'price': price,
        'uid': uid,
      };
}
