import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sml/common/HttpUtil.dart';
import 'package:flutter_sml/model/api/user/UserModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/AppBarWidget.dart';
import '../../services/ScreenAdaper.dart';
import '../../common/Color.dart';
import 'package:image_picker/image_picker.dart';


class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);
  _AuthenticationState createState() => _AuthenticationState();
}
  
class _AuthenticationState extends State<Authentication>{

  // 使用TextEditingController来获取内容
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardController = TextEditingController();
  String _name = "";
  String _card = "";
  File  _positiveImage;
  File  _negativeImage;

  @override
  void initState() { 
    super.initState();
    // 设置监听
    _nameController.addListener((){
      _name = _nameController.text;
    });
    _cardController.addListener((){
      _card = _cardController.text;
    });
  }

   @override
    void dispose() {
      if (_nameController != null) {
        _nameController.dispose();
      }
    if(_cardController != null){
      _cardController.dispose();
    }
      super.dispose();
    }

  Widget _inputText (String labelName, String hintText, TextEditingController textEditingController) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenAdaper.width(30),
        right: ScreenAdaper.width(30)
      ),
      height: ScreenAdaper.height(86),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorClass.borderColor,
              width: 1
            )
          )
        ),
        child: Row(
          children: <Widget>[
            Text(labelName, style: TextStyle(
              color: ColorClass.titleColor,
              fontSize: ScreenAdaper.fontSize(28)
            )),
            Expanded(
              flex: 1,
              child: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Color(0XFFaaaaaa),
                    fontSize: ScreenAdaper.fontSize(24)
                  ),
                ),
                controller: textEditingController,
                onChanged: (str){
                  _name = _nameController.text;
                  _card = _cardController.text;
                },
              )
            )
          ]
        )
      )
    );
  }

  Widget _uploadImage (String labelName, File image, {bool isBordor = true}) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenAdaper.width(30),
        right: ScreenAdaper.width(30)
      ),
      height: ScreenAdaper.height(86),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: isBordor ? BorderSide(
              color: ColorClass.borderColor,
              width: 1
            ) : BorderSide.none
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(labelName, style: TextStyle(
              color: ColorClass.titleColor,
              fontSize: ScreenAdaper.fontSize(28)
            )),
            Row(
              children: <Widget>[
                 Container(
                  width: ScreenAdaper.fontSize(50),
                  height: ScreenAdaper.fontSize(40),
                  child: image == null ? Text("") : Image.file(image, fit: BoxFit.cover)
                ),
                IconButton(
                  icon: Icon(IconData(
                    0Xe63d,
                    fontFamily: "iconfont"
                  )),
                  color: ColorClass.iconColor,
                  iconSize: ScreenAdaper.fontSize(34),
                  onPressed: (){
                    this._checkPopMenu(isBordor);
                  },
                )
              ],
            ),
          ]
        )
      )
    );
  }

  // 弹出弹窗（相机或者相册）
  void _checkPopMenu(bool isBordor) async {
    if (isBordor) {
       // 身份证正面
      final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100.0, 230.0, 0.0, 0.0),
        items: <PopupMenuItem<String>>[
          new PopupMenuItem<String>( 
            value: 'value01', child: new Text('相机')
          ),
          new PopupMenuItem<String>(
            value: 'value02', child: new Text('图库')
          ),
        ] 
      );
      if(result == null){
        return;  
      }
      if(result.isNotEmpty){
        if(result.trim() == "value01"){
          _getCameraImage(isBordor);
        }else{
          _getGallery(isBordor);
        }
      }
    } else {
      // 身份证反面
      final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100.0, 280.0, 0.0, 0.0),
        items: <PopupMenuItem<String>>[
          new PopupMenuItem<String>( value: 'value01', child: new Text('相机')),
          new PopupMenuItem<String>( value: 'value02', child: new Text('图库')),
        ] 
      );
      if(result == null){
        return;  
      }
      if(result.isNotEmpty){
        if(result.trim() == "value01"){
          _getCameraImage(isBordor);
        }else{
          _getGallery(isBordor);
        }
      }
    }
  }

  // 使用相机拍照
  void _getCameraImage(bool isBordor) async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (isBordor) {
        // 正面
         _positiveImage = image;
      } else {
        // 反面
         _negativeImage = image;
      }
    });
  }

  // 使用本地照片
  void _getGallery(bool isBordor) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (isBordor) {
        // 正面
         _positiveImage = image;
      } else {
        // 反面
         _negativeImage = image;
      }
    });
  }

  // 保存实名认证数据
  void _save() async {
    if (_name.isEmpty){
      showOnClickSaveToast("请输入姓名");
      return;
    } else if (_card.isEmpty) {
      showOnClickSaveToast("请输入身份证");
      return;
    } else if (!verificationCard(_card)){
      showOnClickSaveToast("请输入正确的身份证");
      return;
    } else if (_positiveImage == null){
      showOnClickSaveToast("请上传身份证正面照");
      return;
    } else if (_negativeImage == null){
      showOnClickSaveToast("请上传身份证反面照");
      return;
    }
    Map response = await HttpUtil().post("/api/v1/ident", params: {
                "idcard": _card,
                "idcardBack": _positiveImage.path,
                "idcardFront": _negativeImage.path,
                "realName": _name,
                "userId": UserModel().data.userId
            });
            if (response["code"] == 200 ) {
                // UserModel userModel = new UserModel.fromJson(response);
                // Data data = userModel.data;
                // this.userModel.initUser(
                //     userId: data.userId,
                //     userName: data.userName,
                //     phone: data.phone,
                //     password: data.password,
                //     nickName: data.nickName,
                //     createTime: data.createTime
                // );
            } else {
                Fluttertoast.showToast(
                    msg: response["msg"],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIos: 1,
                    textColor: Colors.white,
                    fontSize: ScreenAdaper.fontSize(30)
                );
            }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBarWidget().buildAppBar("实名认证"),
      body: Container(
        child: Column(
          children: <Widget>[
            this._inputText("真实姓名", "请输入姓名", _nameController),
            this._inputText("身份证号", "请输入身份证号", _cardController),
            this._uploadImage("身份证正面", _positiveImage),
            this._uploadImage("身份证反面", _negativeImage, isBordor: false),
            Container(
              margin: EdgeInsets.only(
                top: ScreenAdaper.height(50)
              ),
              height: ScreenAdaper.height(88),
              width: double.infinity,
              padding: EdgeInsets.only(
                left: ScreenAdaper.width(30),
                right: ScreenAdaper.width(30)
              ),
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenAdaper.width(10))
                ),
                // 点击事件
                onPressed: () {
                  _save();
                },
                child: Text("提交",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenAdaper.fontSize(40)
                  ),
                ),
                color: ColorClass.common,
              ),
            )
          ]
        )
      )
    );
  }

  // 显示吐司
  void showOnClickSaveToast(String s) {
    Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      textColor: Colors.white,
      fontSize: ScreenAdaper.fontSize(30)
    );
  }

  // 判断手机号
  bool verificationCard(String card){
    if(checkCode(card)){
      return true;
    }
    return false;
  } 

  // 验证号码
  bool checkCode(String card){
    RegExp p = RegExp(r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$' + 
    '|' + r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$');
    bool matches = p.hasMatch(card);
    if(matches) {
      if(card.length == 18){
        // 将前17位加权因子保存在数组里
        List idCardList = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"];
          // 这是除以11后，可能产生的11位余数、验证码，也保存成数组
          List idCardYArray = ["1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"];  
        int idCardWiSum = 0;
        for(int i = 0; i < card.length; i++){
          int subStrIndex = int.parse(card.substring(i, i + 1));
          int idCardWiIndex = subStrIndex * idCardList[i];
          idCardWiSum += idCardWiIndex;
        }
        // 计算出校验码所在数组的位置
        int idCardMod = idCardWiSum % 11;
        // 得到最后一位号码
        String idCardLast = card.substring(17, 18);
        // 判断最后一位
        if(idCardMod == 2){
          if (idCardLast == "x" || idCardLast == "X") {
            return true;
          }
        }else{
          if(idCardLast != idCardYArray[idCardMod]){
            return false;
          }
        }
      }
    }
    return matches;
  }
  
}