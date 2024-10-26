import 'package:get/get.dart';

class ViewPasswordController extends GetxController{

  RxBool show=true.obs;

  void showPassword(){
    show.value=!show.value;
  }
}