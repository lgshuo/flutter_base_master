
import 'package:flutter_base_master/app/data/update_bean.dart';
import 'package:flutter_base_master/base/http/request/base_request.dart';
import 'package:flutter_base_master/base/http/request/param_utils.dart';
import 'package:flutter_base_master/base/http/request/request_api.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';


class HomeController extends BaseStateController {
  UpdateBean? updateBean;
  @override
  void loadData() {
    var params = ParamUtils().add("payPlatform", "1").params;
    Request.post(RequestApi.updata, params,success: (data){
      updateBean = UpdateBean.fromJson(data);
      if (updateBean!=null) {
        showSuccess();
      }else{
        showError();
      }
    },fail: (code,message){
      showError();
    });
  }
}
