import 'package:sree_balagi_gold/features/notification/data/model/notification_model.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';

abstract class INotificationFacade {
  FutureResult<List<NotificationModel>> fetchNotification() async {
    throw UnimplementedError('fetchNotification() Not implemented');
  }

  void clearData() {
    throw UnimplementedError('clearData() Not implemented');
  }
}
