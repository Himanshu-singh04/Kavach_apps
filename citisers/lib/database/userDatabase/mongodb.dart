import 'dart:developer';
import 'package:citisers/database/dbHelper/constants.dart';
import 'package:citisers/database/userDatabase/MongoDbUserModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;

  //function to connect to database
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbUserModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "User ${data.id} is Registered";
      } else {
        return "Something went wrong while inserting data";
      }
    } catch (e) {
      log(e.toString());
      return "Something went wrong while inserting data";
    }
  }
}
