// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoryModel {
  final String name;
  final String? id;
  final String? mainCategoryId;
  int? productItemCount;

  final String imageUrl;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final List<String>? keywords;
  SubCategoryModel({
    required this.name,
    this.keywords,
    this.id,
    this.productItemCount,
    this.mainCategoryId,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoryModel copyWith({
    String? name,
    String? imageUrl,
    List<String>? keywords,
    String? id,
    int? productItemCount,
    String? mainCategoryId,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return SubCategoryModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      keywords: keywords ?? this.keywords,
      id: id ?? this.id,
      productItemCount: productItemCount ?? this.productItemCount,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'keywords': keywords,
      'id': id,
      'productItemCount': productItemCount,
      'mainCategoryId': mainCategoryId,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> toMapEdit() {
    return <String, dynamic>{
      'name': name,
      'keywords': keywords,
      'imageUrl': imageUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
        name: map['name'] as String,
        imageUrl: map['imageUrl'] as String,
        id: map['id'] != null ? map['id'] as String : null,
        mainCategoryId: map['mainCategoryId'] != null
            ? map['mainCategoryId'] as String
            : null,
        createdAt: map['createdAt'] as Timestamp?,
        productItemCount: map['productItemCount'] as int?,
        updatedAt: map['updatedAt'] as Timestamp?,
        keywords: map['keywords'] != null && map['keywords'] is List
            ? List<String>.from(map['keywords'] as List)
            : null);
  }
}
