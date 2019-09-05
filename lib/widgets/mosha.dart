import 'dart:ui';

import 'package:flutter/material.dart';

class Mosha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                "http://k.zol-img.com.cn/sjbbs/7692/a7691515_s.jpg"),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text("毛玻璃",style: Theme.of(context).textTheme.display3,),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
