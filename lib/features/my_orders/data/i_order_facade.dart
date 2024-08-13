import 'package:sree_balagi_gold/features/my_orders/data/model/my_order_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class IOrderFacade {
  FutureResult<List<OrderModel>> getOrders({required String userId}) {
    throw UnimplementedError('getOrders() not implimented');
  }

  void clearData() {}
}
