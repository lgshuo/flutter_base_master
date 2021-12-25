import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/base/state/page/empty_page.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:flutter_base_master/base/state/page/loading_page.dart';
import 'package:get/get.dart';

import 'base_state_controller.dart';


abstract class BaseStateView<T extends BaseStateController> extends GetView<T> {

  Widget successWidget(T controller, BuildContext context);

  void onInit();
  Function(GetXState<T> state)? initState(){
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      init: initController(),
      initState:initState()!=null?initState():(_){
        onInit();
      },
      builder: (_) {
        var controller = initController();
        if (controller==null) {
          controller = this.controller;
        }
        switch (controller.loadState.value) {
          case BaseStateController.LOADING:
            return LoadingPage();
          case BaseStateController.SUCCESS:
            return successWidget(controller, context);
          case BaseStateController.EMPTY:
            return EmptyPage();
          case BaseStateController.ERROR:
            return ErrorPage(controller);
        }
        return Text("未知状态");
      },
    );
  }

  T? initController() => controller;
}
