import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/data/source/cart_data_source.dart';

abstract class ICartRepository {
  Future<List<Cart>> getCartItems();
}

class CartRepository extends ICartRepository {
  @override
  Future<List<Cart>> getCartItems() async {
    var cartResponse = await CartDataSource().getCartItems();
    return cartResponse;
  }
}
