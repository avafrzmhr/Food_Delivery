import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/data/source/cart_data_source.dart';

abstract class ICartRepository {
  Future<List<Cart>> getCartItems();
  Future<Response> addToCart(int id);
}

class CartRepository extends ICartRepository {
  @override
  Future<List<Cart>> getCartItems() async {
    var cartResponse = await CartDataSource().getCartItems();
    return cartResponse;
  }

  Future<Response> addToCart(int id) async {
    var cartResponse = await CartDataSource().addToCart(id);
    return cartResponse;
  }
}
