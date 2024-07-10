// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';

class MyOrderModel {
  final ProductModel product;
  final String? id;
  final String? remark;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final UserModel user;

  final int orderStatus;
  //0=pending
  //1=accept
  //2=deliverd
  //3=reject
  MyOrderModel({
    required this.product,
    this.id,
    this.remark,
    this.createdAt,
    this.updatedAt,
    required this.user,
    required this.orderStatus,
  });

  MyOrderModel copyWith({
    ProductModel? product,
    String? id,
    String? remark,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    UserModel? user,
    int? orderStatus,
  }) {
    return MyOrderModel(
      product: product ?? this.product,
      id: id ?? this.id,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      user: user ?? this.user,
      orderStatus: orderStatus ?? this.orderStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.ordertoMap(),
      'id': id,
      'remark': remark,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'user': user.ordertoMap(),
      'orderStatus': orderStatus,
    };
  }

  factory MyOrderModel.fromMap(Map<String, dynamic> map) {
    return MyOrderModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      id: map['id'] as String?,
      remark: map['remark'] as String?,
      createdAt: map['createdAt'] as Timestamp?,
      updatedAt: map['updatedAt'] as Timestamp?,
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      orderStatus: map['orderStatus'] as int,
    );
  }
}
