// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String phoneNumber;
  final String? name;
  final List<String>? nameKeyword;
  final String? shopName;
  final List<String>? shopNameKeyword;
  final String? shopAddress;
  final String? photoUrl;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final String? fcmToken;
  final bool? isBlocked;
  final int accountStatusIndex;
  final String? rejectReason;
  final int? availableProductCount;
  final int? remarksCount;
  final Timestamp? lastEntryTime;
  final String? blockReason;
  final List<String>? favorites;
  final List<Map<String, dynamic>>? cart;
  UserModel({
    this.id,
    required this.phoneNumber,
    this.name,
    this.nameKeyword,
    this.shopName,
    this.shopNameKeyword,
    this.shopAddress,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.fcmToken,
    this.isBlocked,
    this.accountStatusIndex = 0,
    this.rejectReason,
    this.availableProductCount,
    this.remarksCount,
    this.lastEntryTime,
    this.blockReason,
    this.favorites,
    this.cart,
  });

  Map<String, dynamic> toMapCreateUser() {
    return <String, dynamic>{
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'nameKeyword': nameKeyword,
      'shopName': shopName,
      'shopNameKeyword': shopNameKeyword,
      'shopAddress': shopAddress,
      'photoUrl': photoUrl,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'fcmToken': fcmToken,
      'isBlocked': isBlocked,
      'accountStatusIndex': accountStatusIndex,
      'rejectReason': rejectReason ?? '',
      'availableProductCount': availableProductCount ?? 0,
      'remarksCount': remarksCount ?? 0,
      'lastEntryTime': lastEntryTime ?? FieldValue.serverTimestamp(),
      'blockReason': blockReason,
      'favorites': [],
      'cart': {},
    };
  }

  Map<String, dynamic> updateMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'shopName': shopName,
      'shopAddress': shopAddress,
      'photoUrl': photoUrl,
      'nameKeyword': nameKeyword,
      'shopNameKeyword': shopNameKeyword,
      'updatedAt': updatedAt,
    };
  }

  Map<String, dynamic> ordertoMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'shopName': shopName,
      'shopAddress': shopAddress,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    List<Map<String, dynamic>> cart = [];
    final cartMap = map['cart'] as Map<String, dynamic>?;
    if (cartMap != null) {
      // log(cartMap.runtimeType.toString());
      cartMap.forEach(
        (key, value) {
          cart.add({
            key: value,
          });
        },
      );

      cart.sort((a, b) {
        int aDate =
            (a.values.first['createdAt'] as Timestamp).microsecondsSinceEpoch;
        int bDate =
            (b.values.first['createdAt'] as Timestamp).microsecondsSinceEpoch;
        return aDate.compareTo(bDate);
      });
    }

    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      phoneNumber: map['phoneNumber'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      shopAddress:
          map['shopAddress'] != null ? map['shopAddress'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      createdAt:
          map['createdAt'] != null ? map['createdAt'] as Timestamp : null,
      updatedAt:
          map['updatedAt'] != null ? map['updatedAt'] as Timestamp : null,
      fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
      isBlocked: map['isBlocked'] as bool?,
      accountStatusIndex: map['accountStatusIndex'] as int? ?? 0,
      rejectReason:
          map['rejectReason'] != null ? map['rejectReason'] as String : null,
      shopName: map['shopName'] != null ? map['shopName'] as String : null,
      nameKeyword: map['nameKeyword'] != null
          ? List<String>.from(map['nameKeyword'] as List<dynamic>)
          : null,
      shopNameKeyword: map['shopNameKeyword'] != null
          ? List<String>.from(map['shopNameKeyword'] as List<dynamic>)
          : null,
      availableProductCount: map['availableProductCount'] as int?,
      remarksCount: map['remarksCount'] as int?,
      lastEntryTime: map['lastEntryTime'] != null
          ? map['lastEntryTime'] as Timestamp
          : null,
      blockReason:
          map['blockReason'] != null ? map['blockReason'] as String : null,
      favorites: map['favorites'] != null  
          ? List<String>.from(map['favorites'] as List<dynamic>)
          : [],
      cart: cart,
    );
  }

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? name,
    List<String>? nameKeyword,
    String? shopName,
    List<String>? shopNameKeyword,
    String? shopAddress,
    String? photoUrl,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    String? fcmToken,
    bool? isBlocked,
    int? accountStatusIndex,
    String? rejectReason,
    int? availableProductCount,
    int? remarksCount,
    Timestamp? lastEntryTime,
    String? blockReason,
    List<String>? favorites,
    List<Map<String, dynamic>>? cart,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      nameKeyword: nameKeyword ?? this.nameKeyword,
      shopName: shopName ?? this.shopName,
      shopNameKeyword: shopNameKeyword ?? this.shopNameKeyword,
      shopAddress: shopAddress ?? this.shopAddress,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fcmToken: fcmToken ?? this.fcmToken,
      isBlocked: isBlocked ?? this.isBlocked,
      accountStatusIndex: accountStatusIndex ?? this.accountStatusIndex,
      rejectReason: rejectReason ?? this.rejectReason,
      availableProductCount:
          availableProductCount ?? this.availableProductCount,
      remarksCount: remarksCount ?? this.remarksCount,
      lastEntryTime: lastEntryTime ?? this.lastEntryTime,
      blockReason: blockReason ?? this.blockReason,
      favorites: favorites ?? this.favorites,
      cart: cart ?? this.cart,
    );
  }
}
