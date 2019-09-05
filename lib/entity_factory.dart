import 'package:flutter_demo_1/beans/json_string_entity.dart';
import 'package:flutter_demo_1/beans/movie_entity.dart';
import 'package:flutter_demo_1/beans/result_entity.dart';
import 'package:flutter_demo_1/beans/setting_entity.dart';
import 'package:flutter_demo_1/beans/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "JsonStringEntity") {
      return JsonStringEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieEntity") {
      return MovieEntity.fromJson(json) as T;
    } else if (T.toString() == "ResultEntity") {
      return ResultEntity.fromJson(json) as T;
    } else if (T.toString() == "SettingEntity") {
      return SettingEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}