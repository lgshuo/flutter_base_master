import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home_item/home_item_controller.dart';
import 'package:flutter_base_master/app/page/home_item/home_item_page.dart';
import 'package:flutter_base_master/app/page/home_item2/home_item_page.dart';
import 'package:flutter_base_master/app/page/home_item3/home_item_page.dart';
import 'package:flutter_base_master/app/page/home_item4/home_item_page.dart';
import 'package:flutter_base_master/app/page/home_item5/home_item_page.dart';
import 'package:flutter_base_master/base/utils/sp_utils.dart';
import 'package:flutter_base_master/base/widget/tabbar%20_with_ivew.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  List<String> _listTitle = ['时事', '财经', '军事', '母婴', '健康'];
  List<Widget> pages = [HomeItemPage(),HomeItemPage2(),HomeItemPage3(),HomeItemPage4(),HomeItemPage5()];
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: TabBarWithView(widget._listTitle, widget.pages),);
  }
}