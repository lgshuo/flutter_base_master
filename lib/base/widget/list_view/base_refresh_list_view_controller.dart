import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshListViewController<T> extends BaseStateController {
  RefreshController refreshController = RefreshController();
  var listLoad = 1.obs;
  var datas = <T>[].obs;
  bool isFirst = true;
  var page = 1;

  void loadMore() {
    page++;
    loadData();
  }


  void refresh() {
    page = 1;
    datas.clear();
    loadData();
  }

  void loadCompleted() {
    refreshController.loadComplete();
  }

  void refreshCompleted() {
    refreshController.refreshCompleted();
  }
}
