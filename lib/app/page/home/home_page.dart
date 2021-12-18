
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/state/base_state_get_view.dart';
import 'home_controller.dart';

class HomePage extends BaseStateView<HomeController>{
  @override
  void initState() {
   controller.showLoading();
  }

  @override
  Widget successWidget(HomeController controller) {
    return Scaffold(
      body: Center(
        child: Text(controller.updateBean!.downloadUrl)
      ),
    );
  }

}