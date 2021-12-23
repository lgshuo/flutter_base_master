import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'home_item_controller.dart';

class HomeItemPage4 extends BaseRefreshListViewPage<HomeItemController4> {

  @override
  void onInit() {
    controller.loadData();
  }

  @override
  Widget itemView(BuildContext context, int index) {
    return Card(child: Text(controller.datas[index].describes));
  }

  @override
  void onItemClick(BuildContext context, int index) {
    ToastUtils.show(controller.datas[index].describes);
  }
}