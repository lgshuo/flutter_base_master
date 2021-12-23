import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'home_item_controller.dart';

class HomeItemPage5 extends BaseRefreshListViewPage<HomeItemController5> {

  @override
  void initState() {
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