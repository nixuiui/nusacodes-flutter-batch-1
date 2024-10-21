import 'package:flutter_nusacodes/data_resources/database/product_db.dart';
import 'package:flutter_nusacodes/data_resources/local_storage/auth_storage.dart';
import 'package:flutter_nusacodes/data_resources/network/authentication_repository.dart';
import 'package:flutter_nusacodes/data_resources/network/sales_repository.dart';
import 'package:flutter_nusacodes/utils/databases/app_database.dart';
import 'package:flutter_nusacodes/utils/network_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> singleton() async {

  Get.put(AppDatabase());
  Get.put(NetworkService());

  final pref = await SharedPreferences.getInstance();
  Get.put(pref);
  
  Get.put(AuthStorage(Get.find()));

  Get.put(ProductDb(Get.find()));
  
  Get.put(AuthenticationRepository(Get.find(), Get.find()));
  Get.put(SalesRepository(Get.find()));

}