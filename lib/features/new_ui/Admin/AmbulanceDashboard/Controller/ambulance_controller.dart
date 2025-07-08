import 'package:get/get.dart';

class AmbulanceController extends GetxController {
  RxString selectedStatus = 'Available'.obs;

  void setStatus(String status) {
    selectedStatus.value = status;
  }
}
