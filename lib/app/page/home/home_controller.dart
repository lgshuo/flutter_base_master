
import 'package:flutter_base_master/base/state/base_state_controller.dart';


class HomeController extends BaseStateController {
  @override
  void loadData() async{
    print("这是加载的数据");
    await Future.delayed(Duration(seconds: 2));
    showError();
  }
}
