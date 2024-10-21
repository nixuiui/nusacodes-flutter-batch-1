import 'package:flutter_nusacodes/databases/app_database.dart';
import 'package:flutter_nusacodes/local_storages/auth_storage.dart';
import 'package:flutter_nusacodes/repositories/authentication_repository.dart';
import 'package:flutter_nusacodes/repositories/sales_repository.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> singleton() async {

  Get.put(AppDatabase());
  Get.put(NetworkService());

  final pref = await SharedPreferences.getInstance();
  Get.put(pref);
  
  Get.put(AuthStorage(Get.find()));

  Get.put(AuthenticationRepository(Get.find(), Get.find()));
  Get.put(SalesRepository(Get.find()));

}