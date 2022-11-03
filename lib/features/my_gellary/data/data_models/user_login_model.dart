import 'package:hive/hive.dart';
import 'package:promina_task/features/my_gellary/data/data_models/user_data_model.dart';
part 'user_login_model.g.dart';


@HiveType(typeId: 0)
class UserLoginModel extends HiveObject{
  @HiveField(0)
  UserDataModel? userDataModel;

  @HiveField(1)
  String? token;

  UserLoginModel({
    required this.userDataModel,required this.token
});
  
  UserLoginModel.fromJson(Map<String, dynamic> json){
    userDataModel = UserDataModel.fromJson(json['user']);
    token = json['token'];
  }
}


