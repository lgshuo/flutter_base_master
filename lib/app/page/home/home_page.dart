
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'home_controller.dart';

class HomePage extends BaseStateView<HomeController>{
  @override
  void initState() {
   controller.showLoading();
  }

  @override
  Widget successWidget(HomeController controller) {
    return Text("这是加载成功的界面");
  }

}