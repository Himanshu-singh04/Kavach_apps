import 'package:citisers/database/userDatabase/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import 'MongoDbUserModel.dart';

Future<String> insertUserData(
    {required String name, required String email}) async {
  var _id = M.ObjectId(); // this will be used for a unique id
  final data = MongoDbUserModel(
    id: _id,
    name: name,
    email: email,
  );

  var result = await MongoDatabase.insert(data);
  return result;
}
