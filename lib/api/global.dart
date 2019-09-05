import 'package:flutter/material.dart';


/// 全局常量
const String imgUrl = "http://k.zol-img.com.cn/sjbbs/7692/a7691515_s.jpg";
const String msg = "测试信息内容";

/// 通用函数
void showAlertDialog(BuildContext context, String title, String content, VoidCallback cancel, VoidCallback ok) {
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: <Widget>[
          new FlatButton(child: new Text("取消"), onPressed: (){
            //print("内部点击（取消，公共操作）");
            //Navigator.of(context).pop();
            cancel();
          }),
          new FlatButton(child: new Text("确认"), onPressed: (){
            //print("内部点击（确认，公共操作）");
            //Navigator.of(context).pop();
            ok();
          }),
        ]),
  );
}
void dismissDialog(BuildContext context){
  Navigator.of(context).pop();
}

///例子
/*
showAlertDialog(
  context,
  "提示",
  "内容",
  () {
    dismissDialog(context);
  },
  () {
    dismissDialog(context);
  },
);
 */