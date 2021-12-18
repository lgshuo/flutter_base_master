import 'package:get/get.dart';

abstract class BaseStateController extends GetxController {
  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  var loadState = 0.obs;

  ///加载成功
  showSuccess(){
    loadState.value = 1;
  }
  ///加载空界面
  showEmpty(){
    loadState.value = 2;
  }
  ///加载失败
  showError(){
    loadState.value = 3;
  }
  ///加载中
  showLoading(){
    loadState.value = 0;
    loadData();
  }
  void loadData();
}
