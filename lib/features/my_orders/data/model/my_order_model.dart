// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sree_balagi_gold/features/auth/data/model/user_model.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';

class OrderModel {
  final ProductModel product;
  final String? id;
  final String? remark;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  int? karigarStatus;
  UserModel user;
  String? karigarId;
  int orderStatus;
  // EmployeeModel? employee;
  num? purchaseAmount;
  String? transactionId;
  Timestamp? delivaryDate;
  bool isPurchase;
  bool isUser;
  num? makingCharge;
  String? karigarName;
  String? karigarPlace;
  String? karigarPhone;
  bool? isTransactionDone;

  //0=pending
  //1=accept
  //2=deliverd
  //3=reject
  OrderModel({
    required this.product,
    this.id,
    this.delivaryDate,
    required this.isPurchase,
    this.purchaseAmount,
    this.transactionId,
    required this.user,
    required this.isUser,
    this.remark,
    this.isTransactionDone,
    this.makingCharge,
    this.createdAt,
    this.updatedAt,
    this.karigarName,
    this.karigarId,
    this.karigarPhone,
    this.karigarPlace,
    this.karigarStatus,
    required this.orderStatus,
  });

  OrderModel copyWith({
    ProductModel? product,
    String? id,
    String? remark,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    UserModel? user,
    int? orderStatus,
    int? karigarStatus,
    num? makingCharge,
    String? karigarId,
    // KarigarModel? karigar,
    // EmployeeModel? employee,
    num? purchaseAmount,
    String? transactionId,
    Timestamp? delivaryDate,
    bool? isPurchase,
    bool? isUser,
    bool? isTransactionDone,
    String? karigarName,
    String? karigarPlace,
    String? karigarPhone,
  }) {
    return OrderModel(
      product: product ?? this.product,
      id: id ?? this.id,
      remark: remark ?? this.remark,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      makingCharge: makingCharge ?? this.makingCharge,
      user: user ?? this.user,
      orderStatus: orderStatus ?? this.orderStatus,
      karigarStatus: karigarStatus ?? this.karigarStatus,
      karigarId: karigarId ?? this.karigarId,
      karigarName: karigarName ?? this.karigarName,
      karigarPhone: karigarPhone ?? this.karigarPhone,
      karigarPlace: karigarPlace ?? this.karigarPlace,
      isPurchase: isPurchase ?? this.isPurchase,
      isTransactionDone: isTransactionDone ?? this.isTransactionDone,
      isUser: isUser ?? this.isUser,
      delivaryDate: delivaryDate ?? this.delivaryDate,
      // employee: employee ?? this.employee,
      purchaseAmount: purchaseAmount ?? this.purchaseAmount,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'product': product.ordertoMap(),
  //     'id': id,
  //     'remark': remark,
  //     'createdAt': FieldValue.serverTimestamp(),
  //     'updatedAt': FieldValue.serverTimestamp(),
  //     'user': user.ordertoMap(),
  //     'orderStatus': orderStatus,
  //   };
  // }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      id: map['id'] != null ? map['id'] as String : null,
      remark: map['remark'] != null ? map['remark'] as String : null,
      createdAt: map['createdAt'] as Timestamp,
      updatedAt: map['updatedAt'] as Timestamp,
      karigarStatus:
          map['karigarStatus'] != null ? map['karigarStatus'] as int : null,
      karigarId: map['karigarId'] != null ? map['karigarId'] as String : null,
      orderStatus: map['orderStatus'] as int,
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      purchaseAmount:
          map['purchaseAmount'] != null ? map['purchaseAmount'] as num : null,
      transactionId:
          map['transactionId'] != null ? map['transactionId'] as String : null,
      delivaryDate: map['delivaryDate'] as Timestamp?,
      isPurchase: map['isPurchase'] as bool,
      isUser: map['isUser'] as bool,
      makingCharge:
          map['makingCharge'] != null ? map['makingCharge'] as num : null,
      karigarName:
          map['karigarName'] != null ? map['karigarName'] as String : null,
      karigarPlace:
          map['karigarPlace'] != null ? map['karigarPlace'] as String : null,
      karigarPhone:
          map['karigarPhone'] != null ? map['karigarPhone'] as String : null,
      isTransactionDone: map['isTransactionDone'] != null
          ? map['isTransactionDone'] as bool
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.ordertoMap(),
      'id': id,
      'remark': remark,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'karigarStatus': karigarStatus,
      'karigarId': karigarId,
      'user': user.ordertoMap(),
      'orderStatus': orderStatus,
      'purchaseAmount': purchaseAmount,
      'transactionId': transactionId,
      'delivaryDate': delivaryDate,
      'isPurchase': isPurchase,
      'isUser': isUser,
      'makingCharge': makingCharge,
      'karigarName': karigarName,
      'karigarPlace': karigarPlace,
      'karigarPhone': karigarPhone,
      'isTransactionDone': isTransactionDone ?? false,
    };
  }
}
