// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String bannerUrl;
  final Timestamp? createdAt;
  final String? id;
  BannerModel({
    required this.bannerUrl,
    this.createdAt,
    this.id,
  });

  BannerModel copyWith({
    String? bannerUrl,
    String? id,
    Timestamp? createdAt,
  }) {
    return BannerModel(
      bannerUrl: bannerUrl ?? this.bannerUrl,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': bannerUrl,
      'id': id,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      bannerUrl: map['url'] as String,
      id: map['id'] as String,
      createdAt: map['createdAt'] as Timestamp,
    );
  }
}