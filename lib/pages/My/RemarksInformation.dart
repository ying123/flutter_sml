import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/AppBarWidget.dart';
import '../../services/ScreenAdaper.dart';
import '../../common/Color.dart';
import '../../model/store/invoice/InvoiceInfo.dart';


class RemarksInformation extends StatefulWidget {
  RemarksInformation({Key key}) : super(key: key);

  _RemarksInformationState createState() => _RemarksInformationState();
}

class _RemarksInformationState extends State<RemarksInformation> {
    static String _inputText = '';
    TextEditingController _remarksInformationController = new TextEditingController
    .fromValue(
      TextEditingValue(
                text: _inputText
            )
    );
    InvoiceInfo _invoiceModel;
    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      _invoiceModel = Provider.of<InvoiceInfo>(context);
      // this._remarksInformationController.text = _invoiceModel.remarks!=null?_invoiceModel.remarks:'';
    }
    @override
    Widget build(BuildContext context) {
        ScreenAdaper.init(context);
        return Scaffold(
            appBar: AppBarWidget().buildAppBar("备注信息"),
            body: Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdaper.width(30),
                    ScreenAdaper.height(20),
                    ScreenAdaper.width(30),
                    0
                ),
                child: Column(
                    children: <Widget>[
                        TextField(
                            maxLines: 8,
                            decoration: InputDecoration(
                                hintText: "请输入您的备注信息",
                                hintStyle: TextStyle(
                                    color: Color(0XFFaaaaaa),
                                    fontSize: ScreenAdaper.fontSize(26),
                                ),
                                filled: true,
                                fillColor: Color(0XFFf5f5f5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(ScreenAdaper.width(10)),
                                    borderSide: BorderSide.none
                                )
                            ),
                            controller: _remarksInformationController,
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: ScreenAdaper.height(50)
                            ),
                            height: ScreenAdaper.height(88),
                            width: double.infinity,
                            child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(ScreenAdaper.width(10))
                                ),
                                onPressed: () {
                                  this._invoiceModel.initInvoiceInfo(
                                    province: this._invoiceModel.province,
                                    city: this._invoiceModel.city,
                                    county: this._invoiceModel.county,
                                    address: this._invoiceModel.address,
                                    phone: this._invoiceModel.phone,
                                    receiverUser: this._invoiceModel.receiverUser,
                                    amount: this._invoiceModel.amount,
                                    orderSn: this._invoiceModel.orderSn,
                                    remarks: this._remarksInformationController.text,
                                    receiptCode: this._invoiceModel.receiptCode,
                                    receiptHeader: this._invoiceModel.receiptHeader
                                  );

                                  Navigator.pop(context, '/invoiceInformation');
                                },
                                child: Text("提交", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenAdaper.fontSize(40)
                                )),
                                color: ColorClass.common,
                            ),
                        )
                    ]
                )
            )
        );
    }
}
