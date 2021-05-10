import 'package:food_ordering/model/cart_item.dart';
import 'package:food_ordering/model/menu_item.dart';
import 'package:food_ordering/repository/menu_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:food_ordering/provider/firebase_auth_provider.dart';

class MenuBloc {
  static MenuBloc instance = MenuBloc._();

  MenuBloc._();

  BehaviorSubject<List<MenuItem>> _menuFetcher = BehaviorSubject<List<MenuItem>>();
  BehaviorSubject<List<CartItem>> _cartFetcher = BehaviorSubject<List<CartItem>>();

  Stream<List<MenuItem>> get menu => _menuFetcher.stream;

  Stream<List<CartItem>> get cart => _cartFetcher.stream;

  List<MenuItem> menuCache;
  List<CartItem> cartCache = [];

  void fetchMenu() {
    // MenuRepository.fetchMenuItems(AuthProvider.instance.currentUser?.uid ?? 'IfN1jGLGtPWbmleOBmNHevzR3S92').then((value) {
    //   _menuFetcher.sink.add(value);
    //   menuCache = value;
    // });

    MenuRepository.fetchMenu().then((value) {
      _menuFetcher.sink.add(value);
      menuCache = value;
    });
  }

  void editItem(MenuItem item, String name, double price) {
    final index = menuCache.indexOf(item);
    menuCache[index] = MenuItem(name, price, null, item.uid);
    MenuRepository.updateItem(menuCache[index]);
    _menuFetcher.sink.add(menuCache);
  }

  void addItem(MenuItem item) {
    menuCache.add(item);
    MenuRepository.uploadItem(item);
    //MenuRepository.uploadMenuItem(AuthProvider.instance.currentUser.uid, menuCache);
    _menuFetcher.sink.add(menuCache);
  }

  void deleteItem(MenuItem item) {
    menuCache.remove(item);
    MenuRepository.deleteItem(item);
    _menuFetcher.sink.add(menuCache);
  }

  addItemToCart(MenuItem menuItem) {
    var cartItem = CartItem.fromMenuItem(menuItem);
    cartCache.add(cartItem);
    _cartFetcher.sink.add(cartCache);
  }

  removeItemFromCart(CartItem cartItem) {
    cartCache.remove(cartItem);
    _cartFetcher.sink.add(cartCache);
  }

  void dispose() {
    _menuFetcher.close();
    _cartFetcher.close();
  }
}
