// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sree_balagi_gold/features/category_product_display/data/model/product_model.dart';

class CartModel {
  final List<String> productUrl;
  final String serialNumber;
  final num grossWeight;
  final num netWeight;
  final num pieces;
  // final num total;
  final List<ProdectMeterialModel> materials;
  final String? id;
  final String? mainCategoryId;
  final String? subCategoryId;
  final Timestamp? createdAt;
  final String? remark;
  int? qty;
  CartModel({
    required this.productUrl,
    required this.serialNumber,
    required this.grossWeight,
    required this.netWeight,
    required this.pieces,
    required this.materials,
    // required this.total,
    this.id,
    this.mainCategoryId,
    this.subCategoryId,
    this.createdAt,
    this.remark,
    required this.qty,
  });

  CartModel copyWith({
    List<String>? productUrl,
    String? serialNumber,
    num? grossWeight,
    num? netWeight,
    num? pieces,
    // num? total,
    List<ProdectMeterialModel>? materials,
    String? id,
    String? mainCategoryId,
    String? subCategoryId,
    Timestamp? createdAt,
    String? remark,
    int? qty,
  }) {
    return CartModel(
      productUrl: productUrl ?? this.productUrl,
      serialNumber: serialNumber ?? this.serialNumber,
      grossWeight: grossWeight ?? this.grossWeight,
      netWeight: netWeight ?? this.netWeight,
      // total: total ?? this.total,
      pieces: pieces ?? this.pieces,
      materials: materials ?? this.materials,
      id: id ?? this.id,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      createdAt: createdAt ?? this.createdAt,
      remark: remark ?? this.remark,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productUrl': productUrl,
      'serialNumber': serialNumber,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'pieces': pieces,
      // 'total': total,
      'materials': materials.map((x) => x.toMap()).toList(),
      'id': id,
      'mainCategoryId': mainCategoryId,
      'subCategoryId': subCategoryId,
      'createdAt': FieldValue.serverTimestamp(),
      'remark': remark,
      'qty': qty,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productUrl: List<String>.from(map['productUrl']),
      // total: map['total'] as num,
      serialNumber: map['serialNumber'] as String,
      grossWeight: map['grossWeight'] as num,
      netWeight: map['netWeight'] as num,
      pieces: map['pieces'] as num,
      materials: (map['materials'] as List<dynamic>)
          .map(
            (e) => ProdectMeterialModel.fromMap(e),
          )
          .toList(),
      id: map['id'] as String,
      mainCategoryId: map['mainCategoryId'] as String,
      subCategoryId: map['subCategoryId'] as String,
      createdAt: map['createdAt'] as Timestamp,
      remark: map['remark'] != null ? map['remark'] as String : null,
      qty: map['qty'] as int?,
    );
  }
}
