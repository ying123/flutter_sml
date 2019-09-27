import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';
import '../../components/AppBarWidget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyCode extends StatelessWidget {
  final arguments;
  const MyCode({Key key,this.arguments}) : super(key: key);
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget().buildAppBar('我的二维码'),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: ScreenAdaper.height(50),left: ScreenAdaper.width(85),right: ScreenAdaper.width(85)),
                height: ScreenAdaper.height(668),
                width: ScreenAdaper.width(580),
                decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("images/code.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: ScreenAdaper.height(177),
                left: ScreenAdaper.width(202),
                child: Container(
                  width: ScreenAdaper.width(346),
                  height: ScreenAdaper.width(346),
                  child: QrImage(
                          data: arguments['codeData'],
                          size: 346.0,
                          foregroundColor:Color(0xff000000),
                  ),
                ),
              )
          ],
        )
        
        
        
        
        
        
      ),
    );
  }
}