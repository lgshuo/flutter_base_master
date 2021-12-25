import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/data/home_list_data.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'package:flutter_base_master/base/widget/refresh_list_view_widget.dart';
import 'package:get/get.dart';

import 'home_item_controller.dart';

class HomeItemPage extends StatefulWidget {
  String? tag;

  HomeItemPage(this.tag);

  @override
  State<StatefulWidget> createState() {
    return HomeItemPageState();
  }
}

class HomeItemPageState extends State<HomeItemPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return RefreshListViewWidget<HomeItemController, MainListData>(
        tag: widget.tag,
        init: Get.put<HomeItemController>(HomeItemController(),
            tag: widget.tag),
        initState: (_) {
          var controller = Get.find<HomeItemController>(tag: widget.tag);
          controller.setTitle(widget.tag);
          controller.showLoading();
        },
        itemView: (context,index,data){
          return Card(child: Text(data.describes));
        },
        onItemClick: (context,index,data){
          ToastUtils.show(data.describes);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
