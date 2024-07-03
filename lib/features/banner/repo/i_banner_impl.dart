import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/features/banner/data/i_banner_facade.dart';
import 'package:sree_balagi_gold/features/banner/data/model/banner_model.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';
import 'package:sree_balagi_gold/general/core/typedef.dart';
import 'package:sree_balagi_gold/general/utils/firebase_collection.dart';

@LazySingleton(as: IBannerFacade)
class IBannerImpl implements IBannerFacade {
  IBannerImpl(this.firestore);
  final FirebaseFirestore firestore;

  @override
  StreamResult<List<BannerModel>> fetchBanner() async* {
    final controller =
        StreamController<Either<MainFailure, List<BannerModel>>>();

    try {
      final result =
          firestore.collection(FirebaseCollection.banners).snapshots();
      result.listen(
        (event) {
          controller.add(
            right(
              event.docs
                  .map(
                    (e) => BannerModel.fromMap(e.data()),
                  )
                  .toList(),
            ),
          );
        },
      );
    } on Exception catch (e) {
      controller.add(
        left(
          MainFailure.serverFailure(
            msg: e.toString(),
          ),
        ),
      );
    }
    yield* controller.stream;
  }
}
