import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter_base_master/app/res/R.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../gif_image.dart';


class ListViewHead extends RefreshIndicator {
  ListViewHead() : super(height: 80.0, refreshStyle: RefreshStyle.Follow);
  @override
  State<StatefulWidget> createState() {
    return ListViewHeadState();
  }

}

class ListViewHeadState extends RefreshIndicatorState<ListViewHead>
    with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    // init frame is 2
    _gifController = GifController(
      vsync: this,
      value: 1,
    );
    super.initState();
  }

  @override
  void onModeChange(RefreshStatus? mode) {
    if (mode == RefreshStatus.refreshing) {
      _gifController.repeat(
          min: 0, max: 29, period: Duration(milliseconds: 500));
    }
    super.onModeChange(mode);
  }

  @override
  Future<void> endRefresh() {
    _gifController.value = 30;
    return _gifController.animateTo(59, duration: Duration(milliseconds: 500));
  }

  @override
  void resetValue() {
    // reset not ok , the plugin need to update lowwer
    _gifController.value = 0;
    super.resetValue();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return GifImage(
      backgroundColor: Colors.white,
      image: AssetImage(R.drawable().head),
      controller: _gifController,
      height: 80.0,
      fit: BoxFit.fitHeight,
      width:double.infinity,
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}
