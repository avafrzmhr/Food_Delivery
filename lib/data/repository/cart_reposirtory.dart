import 'package:dio/dio.dart';
import 'package:food_delivery/data/model/restaurant/cart_response.dart';
import 'package:food_delivery/data/model/restaurant/order_model.dart';
import 'package:food_delivery/data/source/cart_data_source.dart';

abstract class ICartRepository {
  Future<List<Cart>> getCartItems();
  Future<Response> addToCart(int id);
  Future<OrderModel> orderPage(int id);
  Future<Response> verifyPayment(int orderID, String cardNum, String cvv2,
      String dynamicPass, String verification);
  Future<OrderModel> putOrderAddress(
      int id, String address, double lat, double long, int orderID);
  Future<Response> payment(int orderID, String cardNum, String cvv2);
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

  @override
  Future<Response> payment(int orderID, String cardNum, String cvv2) async {
    var paymentResponse =
        await CartDataSource().payment(orderID, cardNum, cvv2);
    return paymentResponse;
  }

  @override
  Future<OrderModel> orderPage(int id) async {
    var response = await CartDataSource().orderPage(id);
    return response;
  }

  @override
  Future<OrderModel> putOrderAddress(
      int id, String address, double lat, double long, int orderID) async {
    var response =
        await CartDataSource().putOrderAddress(id, address, lat, long, orderID);
    return response;
  }

  @override
  Future<Response> verifyPayment(int orderID, String cardNum, String cvv2,
      String dynamicPass, String verification) async {
    var response = await CartDataSource()
        .verifyPayment(orderID, cardNum, cvv2, dynamicPass, verification);
    return response;
  }
}
