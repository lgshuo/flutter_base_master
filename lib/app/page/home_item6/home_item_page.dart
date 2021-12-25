import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home_item/home_item_page.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_footer.dart';
import 'package:flutter_base_master/base/widget/list_view/list_view_head.dart';
import 'package:flutter_base_master/base/widget/list_view/refresh_list_view_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_item_controller.dart';

class HomeItemPage6 extends StatelessWidget {
  String tag;

  HomeItemPage6(this.tag);

//   @override
//   State<StatefulWidget> createState() {
//     return HomeItemPage6State();
//   }
// }
//
// class HomeItemPage6State extends State<HomeItemPage6>
//     with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return GetX<HomeItemController6>(
      init: Get.put<HomeItemController6>(
          HomeItemController6(), tag: this.tag),
      initState: (_) {
        var controller = Get.find<HomeItemController6>(tag: this.tag);
        controller.setTitle(this.tag);
        controller.showLoading();
      },
      builder: (_) {
        return SmartRefresher(
            controller: Get.find<HomeItemController6>(tag: this.tag).refreshController,
            enablePullUp: true,
            physics: BouncingScrollPhysics(),
            header: ListViewHead(),
            footer: ListViewFooter(),
            onRefresh: () {
              Get.find<HomeItemController6>(tag: this.tag).refresh();
            },
            onLoading: () {
              Get.find<HomeItemController6>(tag: this.tag).loadMore();
            },
            child: ListView.builder(
              itemBuilder: (context, index) =>
                     Card(child:Text(Get.find<HomeItemController6>(tag: this.tag).datas[index].describes)),

              itemCount: Get.find<HomeItemController6>(tag: this.tag).datas.length,
            )

        );
      },
    );
  }


  @override
  bool get wantKeepAlive => true;
}