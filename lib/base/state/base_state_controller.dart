import 'package:get/get.dart';

abstract class BaseStateController extends SuperController {
  static const  int LOADING = 0;
  static const  int SUCCESS = 1;
  static const  int EMPTY = 2;
  static const  int ERROR = 3;

  ///加载状态  0加载中 1加载成功 2加载数据为空 3加载失败
  var loadState = 0.obs;

  ///加载成功
  showSuccess(){
    loadState.value = SUCCESS;
  }
  ///加载空界面
  showEmpty(){
    loadState.value = EMPTY;
  }
  ///加载失败
  showError(){
    loadState.value = ERROR;
  }
  ///加载中
  showLoading(){
    loadState.value = LOADING;
    loadData();
  }
  void loadData();

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
