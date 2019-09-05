import 'package:flutter/material.dart';

class Utils {
  static showToast(BuildContext context, String msg){
    _Toast.toast(context, msg);
  }

  static showLog(String msg){
    _Log.show(msg);
  }

  static transformJson2Map(String jsonString){
    _Json2Map.show(jsonString);
  }
}

class _Toast {
  static OverlayEntry _overlayEntry; //toast靠它加到屏幕上
  static bool _showing = false; //toast是否正在showing
  static DateTime _startedTime; //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static String _msg;

  static double _height = 0.0;

  static void toast(BuildContext context, String msg) async {
    assert(msg != null);
    _msg = msg;
    _height = MediaQuery.of(context).size.height * 3 / 4;
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Positioned(
            //top值，可以改变这个值来改变toast在屏幕中的位置
            top: _height,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0),
                  child: AnimatedOpacity(
                    opacity: _showing ? 1.0 : 0.0, //目标透明度
                    duration: _showing ? Duration(milliseconds: 100) : Duration(milliseconds: 400),
                    child: _buildToastWidget(),
                  ),
                )),
          ));
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
    _startedTime = DateTime.now();

    await Future.delayed(Duration(milliseconds: 2000)); //等待两秒

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.markNeedsBuild();
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Center(
      child: Card(
        elevation: 0.0,
        color: Colors.black26,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: _height/4-20,
            ),
            child:
            RichText(
              text: TextSpan(
                  text: _msg,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                  )
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )
          ),
        ),
      ),
    );
  }
}

class _Log{
  static String msg;

  static void show(String msg){
    print("信息：$msg");
  }

}

class _Json2Map{

  static void show(String jsonString){

  }
}

