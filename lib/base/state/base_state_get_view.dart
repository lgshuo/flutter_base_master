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
      builder: (buildController) {
        switch (buildController.loadState.value) {
          case BaseStateController.LOADING:
            return LoadingPage();
          case BaseStateController.SUCCESS:
            return successWidget(buildController, context);
          case BaseStateController.EMPTY:
            return EmptyPage();
          case BaseStateController.ERROR:
            return ErrorPage(buildController);
        }
        return Text("未知状态");
      },
    );
  }

  T? initController() => controller;
}
