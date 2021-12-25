import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'package:get/get.dart';
import 'home_item_controller.dart';

class HomeItemPage extends BaseRefreshListViewPage<HomeItemController> {
  String title;
  HomeItemPage(this.title);


  @override
  Widget itemView(BuildContext context, int index) {
    return Card(child: Text(controller.datas[index].describes));
  }

  @override
  void onItemClick(BuildContext context, int index) {
    ToastUtils.show(controller.datas[index].describes);
  }

  @override
  HomeItemController initController() {
   return Get.put<HomeItemController>(HomeItemController(),tag:title);
  }

  @override
  Function(GetXState<HomeItemController> state)? initState(){
   var controller = Get.find<HomeItemController>(tag:title);
   controller.setTitle(this.title);
   controller.showLoading();
  }

  @override
  void onInit() {
  }
}