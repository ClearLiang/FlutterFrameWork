import 'package:flutter/material.dart';

/// 自定义切换动画

class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
            Widget child,
          ) {
            // 左右滑动
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              )),
              child: child,
            );

            // 旋转+缩放
            /*return RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              )),
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation1,
                  curve: Curves.fastOutSlowIn,
                )),
                child: child,
              ),
            );*/

            // 淡入淡出
            /*return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              )),
              child: child,
            );*/

            // 缩放
            /*return ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              )),
              child: child,
            );*/
          },
        );
}
