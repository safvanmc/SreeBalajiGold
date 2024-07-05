// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sree_balagi_gold/features/auth/data/i_auth_facade.dart' as _i26;
import 'package:sree_balagi_gold/features/auth/repo/i_auth_impl.dart' as _i27;
import 'package:sree_balagi_gold/features/banner/data/i_banner_facade.dart'
    as _i24;
import 'package:sree_balagi_gold/features/banner/repo/i_banner_impl.dart'
    as _i25;
import 'package:sree_balagi_gold/features/cart/data/i_cart_facade.dart' as _i12;
import 'package:sree_balagi_gold/features/cart/repo/i_cart_impl.dart' as _i13;
import 'package:sree_balagi_gold/features/category_product_display/data/i_category_product_facade.dart'
    as _i16;
import 'package:sree_balagi_gold/features/category_product_display/repo/i_category_product_impl.dart'
    as _i17;
import 'package:sree_balagi_gold/features/favorite/data/i_favorite_facade.dart'
    as _i18;
import 'package:sree_balagi_gold/features/favorite/repo/i_favorite_impl.dart'
    as _i19;
import 'package:sree_balagi_gold/features/main_category/data/i_main_category_facade.dart'
    as _i14;
import 'package:sree_balagi_gold/features/main_category/repo/i_main_category_impl.dart'
    as _i15;
import 'package:sree_balagi_gold/features/notification/data/i_notification_facade.dart'
    as _i20;
import 'package:sree_balagi_gold/features/notification/repo/i_notification_impl.dart'
    as _i21;
import 'package:sree_balagi_gold/features/profile/data/i_profile_facade.dart'
    as _i10;
import 'package:sree_balagi_gold/features/profile/repo/i_profile_impl.dart'
    as _i11;
import 'package:sree_balagi_gold/features/sub_category/data/i_sub_category_facade.dart'
    as _i22;
import 'package:sree_balagi_gold/features/sub_category/repo/i_sub_category_impl.dart'
    as _i23;
import 'package:sree_balagi_gold/general/core/di/app_injectable_module.dart'
    as _i4;
import 'package:sree_balagi_gold/general/core/di/app_injection.dart' as _i28;
import 'package:sree_balagi_gold/general/core/di/firebase_injectable_module.dart'
    as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final appInjection = _$AppInjection();
  await gh.factoryAsync<_i3.FirebaseServeice>(
    () => firebaseInjectableModule.firebaseServeice,
    preResolve: true,
  );
  await gh.factoryAsync<_i4.PermissionServeice>(
    () => firebaseInjectableModule.permissionServeice,
    preResolve: true,
  );
  gh.lazySingleton<_i5.ImagePicker>(() => appInjection.imagePicker);
  gh.lazySingleton<_i6.FirebaseAuth>(() => firebaseInjectableModule.auth);
  gh.lazySingleton<_i7.FirebaseStorage>(() => firebaseInjectableModule.storage);
  gh.lazySingleton<_i8.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i9.FirebaseMessaging>(() => firebaseInjectableModule.fcm);
  gh.lazySingleton<_i10.IProfileFacade>(() => _i11.IProfileImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i12.ICartFacade>(
      () => _i13.ICartImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i14.IMainCategoryFacade>(
      () => _i15.IMainCategoryImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i16.ICategoryProductFacade>(
      () => _i17.ICategoryProductImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IFavoriteFacade>(() => _i19.IFavoriteImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i20.INotificationFacade>(
      () => _i21.INotificationImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i22.ISubCategoryFacade>(
      () => _i23.ISubCategoryImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i24.IBannerFacade>(
      () => _i25.IBannerImpl(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i26.IAuthFacade>(() => _i27.IAuthImpl(
        gh<_i6.FirebaseAuth>(),
        gh<_i8.FirebaseFirestore>(),
        gh<_i9.FirebaseMessaging>(),
      ));
  return getIt;
}

class _$FirebaseInjectableModule extends _i3.FirebaseInjectableModule {}

class _$AppInjection extends _i28.AppInjection {}
