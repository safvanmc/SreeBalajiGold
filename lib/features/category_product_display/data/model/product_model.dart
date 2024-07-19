// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final List<String> productUrl;
  final String serialNumber;
  final num grossWeight;
  final num netWeight;
  final num pieces;
  final List<ProdectMeterialModel> materials;
  final String? id;
  final String? mainCategoryId;
  final String? subCategoryId;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final List<String>? keywords;
  final List<String> users;

  ProductModel({
    required this.productUrl,
    required this.serialNumber,
    required this.grossWeight,
    required this.netWeight,
    required this.pieces,
    this.id,
    required this.materials,
    this.keywords,
    this.mainCategoryId,
    this.subCategoryId,
    this.createdAt,
    this.updatedAt,
    required this.users,
  });

  ProductModel copyWith({
    List<String>? productUrl,
    String? serialNumber,
    num? grossWeight,
    num? netWeight,
    num? pieces,
    List<ProdectMeterialModel>? materials,
    String? id,
    String? mainCategoryId,
    String? subCategoryId,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    List<String>? keywords,
    List<String>? users,
  }) {
    return ProductModel(
      productUrl: productUrl ?? this.productUrl,
      serialNumber: serialNumber ?? this.serialNumber,
      grossWeight: grossWeight ?? this.grossWeight,
      netWeight: netWeight ?? this.netWeight,
      pieces: pieces ?? this.pieces,
      materials: materials ?? this.materials,
      id: id ?? this.id,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      keywords: keywords ?? this.keywords,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productUrl': productUrl,
      'materials': materials
          .map(
            (e) => e.toMap(),
          )
          .toList(),
      'serialNumber': serialNumber,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'pieces': pieces,
      'id': id,
      'mainCategoryId': mainCategoryId,
      'subCategoryId': subCategoryId,
      'keywords': keywords,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMapEdit() {
    return <String, dynamic>{
      'serialNumber': serialNumber,
      'keywords': keywords,
      'productUrl': productUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> ordertoMap() {
    return <String, dynamic>{
      'productUrl': productUrl,
      'materials': materials
          .map(
            (e) => e.toMap(),
          )
          .toList(),
      'serialNumber': serialNumber,
      'mainCategoryId': mainCategoryId,
      'subCategoryId': subCategoryId,
      'grossWeight': grossWeight,
      'netWeight': netWeight,
      'pieces': pieces,
      'id': id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productUrl: List<String>.from(map['productUrl']),
      materials: (map['materials'] as List<dynamic>)
          .map(
            (e) => ProdectMeterialModel.fromMap(e),
          )
          .toList(),
      serialNumber: map['serialNumber'] as String,
      grossWeight: map['grossWeight'] as num,
      netWeight: map['netWeight'] as num,
      pieces: map['pieces'] as num,
      id: map['id'] as String,
      mainCategoryId: map['mainCategoryId'] as String,
      subCategoryId: map['subCategoryId'] as String,
      createdAt:
          map['createdAt'] != null ? map['createdAt'] as Timestamp : null,
      updatedAt:
          map['updatedAt'] != null ? map['updatedAt'] as Timestamp : null,
      keywords: map['keywords'] != null && map['keywords'] is List
          ? List<String>.from(map['keywords'] as List)
          : null,
      users: map['users'] != null
          ? List<String>.from(
              map['users'],
            )
          : [],
    );
  }
}

//
class ProdectMeterialModel {
  final String stoneType;
  final String stoneName;
  final num weight;
  final num materialPieces;
  final bool isKarat;
  ProdectMeterialModel({
    required this.stoneType,
    required this.stoneName,
    required this.weight,
    required this.materialPieces,
    required this.isKarat,
  });

  ProdectMeterialModel copyWith({
    String? stoneType,
    String? stoneName,
    num? weight,
    num? materialPieces,
    bool? isKarat,
  }) {
    return ProdectMeterialModel(
      stoneType: stoneType ?? this.stoneType,
      stoneName: stoneName ?? this.stoneName,
      weight: weight ?? this.weight,
      materialPieces: materialPieces ?? this.materialPieces,
      isKarat: isKarat ?? this.isKarat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stoneType': stoneType,
      'stoneName': stoneName,
      'weight': weight,
      'materialPieces': materialPieces,
      'isKarat': isKarat,
    };
  }

  factory ProdectMeterialModel.fromMap(Map<String, dynamic> map) {
    return ProdectMeterialModel(
      stoneType: map['stoneType'] as String,
      stoneName: map['stoneName'] as String,
      weight: map['weight'] as num,
      materialPieces: map['materialPieces'] as num,
      isKarat: map['isKarat'] as bool,
    );
  }
}
