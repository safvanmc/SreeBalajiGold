import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sree_balagi_gold/features/notification/data/i_notification_facade.dart';
import 'package:sree_balagi_gold/features/notification/data/model/notification_model.dart';
import 'package:sree_balagi_gold/general/widgets/custom_toast.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationProvider(
    this._iNotificationFacade,
  );
  final INotificationFacade _iNotificationFacade;
  bool _isProgress = false;
  bool isLoading = true;
  bool isMoreDataLoading = true;
  List<NotificationModel> notificationList = [];
  bool isRefresh = true;
  void initData({
    required BuildContext context,
    required ScrollController scrollController,
  }) {
    log('don');
    if (notificationList.isEmpty || isRefresh) {
      log('clear');
      clearData();
      _fetchData(context);
      isRefresh = false;
    }

    scrollController.addListener(
      () {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final delta = MediaQuery.of(context).size.height * 0.11;
        if ((maxScroll - currentScroll) <= delta &&
            _isProgress == false &&
            isMoreDataLoading == true) {
          _fetchData(context);
        }
      },
    );
  }

  isRefreshorNot(bool value) {
    isRefresh = true;
    log('okok');
    notifyListeners();
  }

  Future<void> _fetchData(BuildContext context) async {
    if (_isProgress) return;
    _isProgress = true;
    if (notificationList.isEmpty) {
      isLoading = true;
      notifyListeners();
    }
    final result = await _iNotificationFacade.fetchNotification();
    result.fold(
      (l) {
        l.maybeMap(
          orElse: () {},
          noData: (noData) {
            isLoading = false;
            isMoreDataLoading = false;
            log(noData.msg);
          },
          serverFailure: (err) {
            isLoading = false;

            CToast.error(
              msg: err.msg,
            );
          },
        );
      },
      (list) {
        isLoading = false;
        notificationList = [...notificationList, ...list];
        // // CHECK IF REEL VIDEO LIST IS EMPTY OR LESS THAN 10
        if (notificationList.length < 10 || notificationList.isEmpty) {
          isMoreDataLoading = false;
        }
      },
    );
    _isProgress = false;
    notifyListeners();
  }

  void clearData() {
    notificationList = [];
    _iNotificationFacade.clearData();
    isMoreDataLoading = true;
  }
}
