
import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 1)
class UserDataModel{
  @HiveField(0) int? id;
  @HiveField(1) String? name;
  @HiveField(2) String? email;
  @HiveField(3) String? emailVerifiedAt;
  @HiveField(4) String? createdAt;
  @HiveField(5) String? updatedAt;

  
  UserDataModel({
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.emailVerifiedAt,
    required this.name,
    required this.id,
});
  
  UserDataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}