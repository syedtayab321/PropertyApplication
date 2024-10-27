import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString location = 'Jakarta'.obs;
  RxList<String> categories = ['House', 'Apartment', 'Hotel', 'Villa'].obs;
  RxString selectedCategory = 'House'.obs;
}