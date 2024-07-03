// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class MainCategoryModel {
  final String name;
  final String? id;
  final String imageUrl;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final List<String>? keywords;
  MainCategoryModel({
    required this.name,
    this.keywords,
    this.id,
    required this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  MainCategoryModel copyWith({
    String? name,
    String? imageUrl,
    List<String>? keywords,
    String? id,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return MainCategoryModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      keywords: keywords ?? this.keywords,
      id: id ?? this.id,
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

  factory MainCategoryModel.fromMap(Map<String, dynamic> map) {
    return MainCategoryModel(
        name: map['name'] as String,
        imageUrl: map['imageUrl'] as String,
        id: map['id'] != null ? map['id'] as String : null,
        createdAt: map['createdAt'] as Timestamp?,
        updatedAt: map['updatedAt'] as Timestamp?,
        keywords: map['keywords'] != null && map['keywords'] is List
            ? List<String>.from(map['keywords'] as List)
            : null);
  }
}
