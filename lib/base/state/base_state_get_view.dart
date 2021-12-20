import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/base/state/page/empty_page.dart';
import 'package:flutter_base_master/base/state/page/error_page.dart';
import 'package:flutter_base_master/base/state/page/loading_page.dart';
import 'package:get/get.dart';

import 'base_state_controller.dart';


abstract class BaseStateView<T extends BaseStateController>
    extends StatefulWidget  {
  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  BaseState createState() {
    return BaseState();
  }


  Widget successWidget(T controller,BuildContext context);
  void initState();
}
class BaseState<T extends BaseStateController> extends State<BaseStateView<T>>{
  @override
  void initState() {
    widget.initState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      init: widget.controller,
      builder: (controller) {
        switch(controller.loadState.value){
          case BaseStateController.LOADING:
            return LoadingPage();
          case BaseStateController.SUCCESS:
            return widget.successWidget(controller, context);
          case BaseStateController.EMPTY:
            return EmptyPage();
          case BaseStateController.ERROR:
            return ErrorPage(controller);
        }
        return Text("未知状态");
      },
    );
  }
}
