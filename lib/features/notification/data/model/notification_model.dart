// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? image;
  final String msg;
  final String? id;
  final Timestamp? createdAt;

  NotificationModel({
    this.image,
    required this.msg,
    this.id,
    this.createdAt,
  });
  NotificationModel copyWith({
    String? image,
    String? id,
    String? msg,
    Timestamp? timestamp,
  }) {
    return NotificationModel(
      image: image ?? this.image,
      msg: msg ?? this.msg,
      id: id ?? this.id,
      createdAt: timestamp ?? createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'msg': msg,
      'id': id,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      image: map['image'] as String?,
      msg: map['msg'] as String,
      id: map['id'] as String,
      createdAt: map['timestamp'] as Timestamp,
    );
  }
}
