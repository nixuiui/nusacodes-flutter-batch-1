import 'package:get/get.dart';

class CounterController extends GetxController {

  final counter = 0.obs;

  CounterController(int initialCounter) {
    counter.value = initialCounter;
  }

  void increment() {
    counter.value = counter.value+1;
  }

}