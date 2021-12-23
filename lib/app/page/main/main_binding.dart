import 'package:flutter_base_master/app/page/home_item/home_item_controller.dart';
import 'package:flutter_base_master/app/page/home_item2/home_item_controller.dart';
import 'package:flutter_base_master/app/page/home_item3/home_item_controller.dart';
import 'package:flutter_base_master/app/page/home_item4/home_item_controller.dart';
import 'package:flutter_base_master/app/page/home_item5/home_item_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeItemController>(
          () => HomeItemController()
    );
    Get.lazyPut<HomeItemController2>(
            () => HomeItemController2()
    );
    Get.lazyPut<HomeItemController3>(
            () => HomeItemController3()
    );
    Get.lazyPut<HomeItemController4>(
            () => HomeItemController4()
    );
    Get.lazyPut<HomeItemController5>(
            () => HomeItemController5()
    );
  }
}
