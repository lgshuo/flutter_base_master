import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/app/page/home_item/home_item_page.dart';
import 'package:flutter_base_master/app/page/home_item6/home_item_page.dart';
import 'package:flutter_base_master/base/widget/tabbar%20_with_ivew.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // List<Widget> pages = [HomeItemPage(""),HomeItemPage2(),HomeItemPage3(),HomeItemPage4(),HomeItemPage5()];

  @override
  Widget build(BuildContext context) {
    List<String> _listTitle = ['时事', '财经', '军事', '母婴', '健康'];
    List<Widget> pages = _listTitle.map((title) =>new HomeItemPage(title)).toList();
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: TabBarWithView(_listTitle, pages),);
  }
}
