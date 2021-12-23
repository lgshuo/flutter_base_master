import 'dart:developer';

import 'package:flutter_base_master/app/data/home_list_data.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/widget/list_view/base_refresh_list_view_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeItemController5 extends BaseRefreshListViewController<MainListData> {
  @override
  void loadData() {
    String userUuid = Uri.encodeComponent("5C:C3:07:74:73:4C");
    var params = ParamUtils()
        .add("userUuid", userUuid)
        .add("page", page)
        .add("infoColumnCode", "2ea805d8-9073-11ea-ad3d-00163e0a0789")
        .add("userCode", "")
        .params;
    Request.post<dynamic>(RequestApi.mainListData, params, success: (data) {
      data.forEach((element) {
        datas.add(MainListData.fromJson(element));
      });
      if (isFirst) {
        isFirst = false;
        showSuccess();
      } else {
        refreshCompleted();
        loadCompleted();
      }
    } /*,fail: (code,message){
      showError();
    }*/
        );
  }
}
