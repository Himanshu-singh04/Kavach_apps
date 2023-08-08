// To parse this JSON data, do
//
//     final mongoDbUserModel = mongoDbUserModelFromJson(jsonString);
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbUserModel mongoDbUserModelFromJson(String str) =>
    MongoDbUserModel.fromJson(json.decode(str));

String mongoDbUserModelToJson(MongoDbUserModel data) =>
    json.encode(data.toJson());

class MongoDbUserModel {
  MongoDbUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  ObjectId id;
  String? name;
  String? email;

  factory MongoDbUserModel.fromJson(Map<String, dynamic> json) =>
      MongoDbUserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}
