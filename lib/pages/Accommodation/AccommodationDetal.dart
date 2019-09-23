import 'package:flutter/material.dart';
import '../Restaurant/Evaluate.dart';
import '../../services/ScreenAdaper.dart';
import '../../components/SliverAppBarDelegate.dart';
import '../../common/Color.dart';
import './bottomSheet/Reserve.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

class AccommodationDetal extends StatefulWidget {
    AccommodationDetal({Key key}) : super(key: key);
    _AccommodationDetalState createState() => _AccommodationDetalState();

}

class DefaultCombineDayWidgeta extends BaseCombineDayWidget {
    DefaultCombineDayWidgeta(DateModel dateModel) : super(dateModel);

    @override
    Widget getNormalWidget(DateModel dateModel) {
        return Container(
            width: ScreenAdaper.width(107),
            height: ScreenAdaper.width(115),
            alignment: Alignment.center,
            child: Text("${dateModel.day}")
        );
    }

    @override
    Widget getSelectedWidget(DateModel dateModel) {
        return Text("${dateModel.day}");
    }
}

Widget defaultCustomDayWidget(DateModel dateModel) {
    return DefaultCombineDayWidgeta(
        dateModel,
    );
}
class _AccommodationDetalState extends State<AccommodationDetal> with SingleTickerProviderStateMixin{
    ScrollController _scrollViewController;
    TabController _tabController;

    @override
    void initState() {
        super.initState();
        _scrollViewController = ScrollController(initialScrollOffset: 0.0);
        _tabController = TabController(vsync: this, length: 3);
    }

    @override
    void dispose() {
        super.dispose();
        _scrollViewController.dispose();
        _tabController.dispose();
    }
    
    void showModalBottomSheetHandler () {
        showModalBottomSheet(
            context: context,
            shape:  RoundedRectangleBorder(
				borderRadius: BorderRadius.only(
					topLeft: Radius.circular(ScreenAdaper.width(10)),
					topRight: Radius.circular(ScreenAdaper.width(10)),
				)
			),
            builder: (BuildContext context){
                return Container(
                    color: Colors.white,
                    child: Reserve()
                );
            }
        );
    }
    
    void showModalCalendaHandler () {
        // var a = new Set();

        // showModalBottomSheet(
        //     context: context,
        //     shape:  RoundedRectangleBorder(
		// 		borderRadius: BorderRadius.only(
		// 			topLeft: Radius.circular(ScreenAdaper.width(10)),
		// 			topRight: Radius.circular(ScreenAdaper.width(10)),
		// 		)
		// 	),
        //     builder: (BuildContext context){
        //         return Container(
        //             color: Colors.white,
        //             child: CalendarViewWidget(
        //                 calendarController: CalendarController(
        //                     dayWidgetBuilder: defaultCustomDayWidget,
        //                     selectedDateTimeList: a
        //                 ),
        //             )
        //         );
        //     }
        // );
    }

    // label 标签
    Widget _label () {
        return Container(
            padding: EdgeInsets.fromLTRB(
                ScreenAdaper.width(10),
                ScreenAdaper.height(5),
                ScreenAdaper.width(10),
                ScreenAdaper.height(5)
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0XFFdac4a3), width: 1.0),
                color: Color(0XFFf8f5e8)
            ),
            child: Text("10元优惠券", style: TextStyle(
                color: ColorClass.fontRed,
                fontSize: ScreenAdaper.fontSize(24)
            )),
        );
    }

    Widget _information () {
        return Container(
            padding: EdgeInsets.all(ScreenAdaper.width(30)),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Text("边屯酒家", style: TextStyle(
                                color: ColorClass.titleColor,
                                fontSize: ScreenAdaper.fontSize(42, allowFontScaling: true)
                            )),
                            Text("营业时间：11:00-2:30", style: TextStyle(
                                color: ColorClass.titleColor,
                                fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                            ))
                        ]
                    ),
                    SizedBox(height: ScreenAdaper.height(40)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Icon(
                                IconData(0Xe61d, fontFamily: "iconfont"),
                                color: ColorClass.common,
                                size: ScreenAdaper.fontSize(30,  allowFontScaling: true)
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdaper.width(20)
                                    ),
                                    child: Row(
                                        children: <Widget>[
                                            Expanded(
                                                flex: 1,
                                                child: Text("贵州省黔西南布依族苗族自治州兴义市湖南街30附近", style: TextStyle(
                                                    fontSize: ScreenAdaper.fontSize(28, allowFontScaling: true),
                                                    color: ColorClass.fontColor
                                                )),
                                            ),
                                            SizedBox(
                                                width: ScreenAdaper.width(75)
                                            ),
                                            Icon(
                                                IconData(0Xe639, fontFamily: "iconfont"),
                                                color: ColorClass.common,
                                                size: ScreenAdaper.fontSize(40,  allowFontScaling: true)
                                            )
                                        ]
                                    ),
                                ),
                            )
                        ]
                    ),
                    SizedBox(height: ScreenAdaper.height(35)),
                    Wrap(
                        spacing: ScreenAdaper.width(10),
                        runSpacing: ScreenAdaper.height(10),
                        children: <Widget>[
                            this._label(),
                            this._label()
                        ],
                    )
                ]
            ),
        );
    }

    Widget _dateWidget () {
        return Container(
            margin: EdgeInsets.only(
                top: ScreenAdaper.height(20)
            ),
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(
                ScreenAdaper.width(30),
                ScreenAdaper.height(40),
                ScreenAdaper.width(30),
                ScreenAdaper.height(40)
            ),
            child: GestureDetector(
                onTap: () {
                    showModalCalendaHandler();
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Row(
                            children: <Widget>[
                                Text("8月3日", style: TextStyle(
                                    color: ColorClass.date,
                                    fontSize: ScreenAdaper.fontSize(34, allowFontScaling: true)
                                )),
                                SizedBox(width: ScreenAdaper.width(20)),
                                Text("今日入住", style: TextStyle(
                                    color: ColorClass.fontColor,
                                    fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                                )),
                                SizedBox(width: ScreenAdaper.width(30)),
                                Container(
                                    width: ScreenAdaper.width(40),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Color(0XFFd9d9d9),
                                            width: 1
                                        ))
                                    ),
                                ),
                                SizedBox(width: ScreenAdaper.width(30)),
                                Text("8月3日", style: TextStyle(
                                    color: ColorClass.date,
                                    fontSize: ScreenAdaper.fontSize(34, allowFontScaling: true)
                                )),
                                SizedBox(width: ScreenAdaper.width(20)),
                                Text("周五离店", style: TextStyle(
                                    color: ColorClass.fontColor,
                                    fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                                ))
                            ]
                        ),
                        Row(
                            children: <Widget>[
                                Text("共1晚", style: TextStyle(
                                    color: ColorClass.fontColor,
                                    fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                                )),
                                SizedBox(
                                    width: ScreenAdaper.width(20),
                                ),
                                Icon(
                                    IconData(0Xe61e, fontFamily: "iconfont"),
                                    color: Color(0XFFaaaaaa),
                                    size: ScreenAdaper.fontSize(24,  allowFontScaling: true)
                                )
                            ]
                        )
                    ]
                ),
            )
        ); 
    }

    Widget _rowItem () {
        return Row(
            children: <Widget>[
                Text("面积", style: TextStyle(
                    color: ColorClass.fontColor,
                    fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                )),
                SizedBox(width: ScreenAdaper.width(20)),
                Text("25㎡", style: TextStyle(
                    color: ColorClass.titleColor,
                    fontSize: ScreenAdaper.fontSize(24, allowFontScaling: true)
                ))
            ]
        );
    }
    // 服务
    Widget _service ({bool isShowBorder = true}) {
        return Container(
            padding: EdgeInsets.only(
                left: ScreenAdaper.width(30),
                right: ScreenAdaper.width(30)
            ),
            child: Container(
                padding: EdgeInsets.only(
                    top: ScreenAdaper.width(30),
                    bottom: ScreenAdaper.width(30)
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: isShowBorder ? BorderSide(
                            color: Color(0XFFd9d9d9),
                            width: 1
                        ) : BorderSide.none
                    )
                ),
                child: Row(
                    children: <Widget>[
                        Container(
                            width: ScreenAdaper.width(150),
                            height: ScreenAdaper.height(187),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                    "https://dpic.tiankong.com/pa/7s/QJ8189390931.jpg?x-oss-process=style/670ws",
                                    fit: BoxFit.cover,
                                ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
                                height: ScreenAdaper.height(187),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                                Text("高级大床房", style: TextStyle(
                                                    fontSize: ScreenAdaper.fontSize(30, allowFontScaling: true),
                                                    color: ColorClass.fontColor
                                                )),
                                                Text("¥179", style: TextStyle(
                                                    fontSize: ScreenAdaper.fontSize(22, allowFontScaling: true),
                                                    color: ColorClass.fontRed
                                                ))
                                            ],
                                        ),
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                )
                                            ],
                                        ),
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                )
                                            ],
                                        ),
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: this._rowItem(),
                                                )
                                            ],
                                        )
                                    ]
                                )
                            )
                        )
                    ]
                )
            )
        );
    }

    // appBar
    Widget _sliverBuilder () {
        return SliverAppBar(
            title: Text("标题", style: TextStyle(
                color: Colors.black,
            )),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            expandedHeight: ScreenAdaper.height(300),
            floating: false,
            brightness: Brightness.light,
            pinned: true,
            snap: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    "https://dpic.tiankong.com/pa/7s/QJ8189390931.jpg?x-oss-process=style/670ws",
                        fit: BoxFit.fill
                ),
            )
        );
    }
    
    // 评价button 
    Widget __evaluateButton () {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Container(
                    width: ScreenAdaper.width(460),
                    height: ScreenAdaper.width(75),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorClass.common,
                            width: 1
                        ),
                        borderRadius: BorderRadius.circular(ScreenAdaper.width(10))
                    ),
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: RaisedButton(
                                    elevation: 0,
                                    color: Color(0XFF22b0a1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(ScreenAdaper.width(10)),
                                            bottomLeft: Radius.circular(ScreenAdaper.width(10))
                                        )
                                    ),
                                    onPressed: () {},
                                    child: Text("全部", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenAdaper.fontSize(30)
                                    )),
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: RaisedButton(
                                    elevation: 0,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(ScreenAdaper.width(10)),
                                            bottomRight: Radius.circular(ScreenAdaper.width(10))
                                        ),
                                        
                                    ),
                                    onPressed: () {},
                                    child: Text("有图", style: TextStyle(
                                        color: ColorClass.common,
                                        fontSize: ScreenAdaper.fontSize(30)
                                    )),
                                )
                            )
                        ]
                    )
                ),
                GestureDetector(
                    onTap: () {
                        Navigator.pushNamed(context, "/releaseEvaluate");
                    },
                    child: Container(
                        width: ScreenAdaper.width(160),
                        height: ScreenAdaper.width(75),
                        decoration: BoxDecoration(
                            color: Color(0XFFc1a786),
                            border: Border.all(
                                color: Color(0XFFc1a786),
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(ScreenAdaper.width(10))
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Icon(
                                    IconData(0xe640, fontFamily: 'iconfont'),
                                    color: Colors.white,
                                    size: ScreenAdaper.fontSize(37),
                                ),
                                SizedBox(width: ScreenAdaper.width(10)),
                                Text("评价", style: TextStyle(
                                    fontSize: ScreenAdaper.fontSize(30),
                                    color: Colors.white
                                ))
                            ],
                        ),
                    )
                )
            ]
        );
    }

    // 商家
    Widget _business (String name, {bool isBorder = true, bool isIcon = false, String subTitle = '', Icon icon, }) {
        return Container(
            padding: EdgeInsets.only(
                left: ScreenAdaper.width(30),
                right: ScreenAdaper.width(30)
            ),
            child: Container(
                padding: EdgeInsets.only(
                    top: ScreenAdaper.height(30),
                    bottom: ScreenAdaper.height(30)
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: isBorder ? BorderSide(
                            color: Color(0XFFd9d9d9),
                            width: 1
                        ) : BorderSide.none
                    )
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(name, style: TextStyle(
                            color: ColorClass.titleColor,
                            fontSize: ScreenAdaper.fontSize(28)
                        )),
                        SizedBox(width: ScreenAdaper.width(100)),
                        Expanded(
                            flex: 1,
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: !isIcon ? Text(subTitle, style: TextStyle(
                                    color: ColorClass.fontColor,
                                    fontSize: ScreenAdaper.fontSize(24)
                                ), textAlign: TextAlign.end) : icon,
                            ),
                        )

                    ],
                )
            ),
        );
    }

    Widget _evaluate () {
        return Container(
            padding: EdgeInsets.only(
                top: ScreenAdaper.width(30)
            ),
            child: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            left: ScreenAdaper.width(30),
                            right: ScreenAdaper.width(30)
                        ),
                        child: this.__evaluateButton(),
                    ),
                    new Wrap(
                        children: <Widget>[
                            Evaluate(),
                            Evaluate(),
                            Evaluate(),
                            Evaluate(),
                            Evaluate(),
                            Evaluate()
                        ],
                    )
                ]
            )
        );
    }
    
    Widget build(BuildContext context) {
        return Scaffold(
            body: CustomScrollView(
                slivers: <Widget>[
                    this._sliverBuilder(),
                    SliverToBoxAdapter(
                        child: Column(
                            children: <Widget>[
                                this._information(),
                                this._dateWidget(),
                            ]
                        ),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(
                            height: ScreenAdaper.height(20),
                        ),
                    ),
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverAppBarDelegate(
                            maxHeight: 60,
                            minHeight: 60,
                            child: Container(
                                height: ScreenAdaper.height(90),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0XFFd9d9d9),
                                            width: 1
                                        )
                                    )
                                ),
                                child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorWeight: ScreenAdaper.height(6),
                                    indicatorColor: Color(0XFF22b0a1),
                                    controller: this._tabController,
                                    tabs: <Widget>[
                                        Tab(child: Text("服务", style: TextStyle(
                                            color: Colors.black, fontSize: ScreenAdaper.fontSize(34)
                                        ))),
                                        Tab(child: Text("评价", style: TextStyle(
                                            color: Color(0XFF666666),
                                            fontSize: ScreenAdaper.fontSize(34)
                                        ))),
                                        Tab(child: Text("商家", style: TextStyle(
                                            color: Color(0XFF666666),
                                            fontSize: ScreenAdaper.fontSize(34)
                                        )))
                                    ]
                                ),
                            )
                        )
                    ),
                    SliverFillRemaining(
                        child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                                Wrap(
                                    children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                                showModalBottomSheetHandler();
                                            },
                                            child: _service(),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                                showModalBottomSheetHandler();
                                            },
                                            child: _service(),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                                showModalBottomSheetHandler();
                                            },
                                            child: _service(),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                                showModalBottomSheetHandler();
                                            },
                                            child: _service(isShowBorder: false)
                                        )
                                    ]
                                ),
                                Wrap(
                                    children: <Widget>[
                                        this._evaluate()
                                    ]
                                ),
                                Wrap(
                                    children: <Widget>[
                                        this._business("商家名称", subTitle: "人间有味"),
                                        this._business("商家分类", subTitle: "贵州省黔西南布依族苗族自治州兴义市湖南街30附近123123123"),
                                        this._business("商家地址", subTitle: "人间有味"),
                                        this._business("商家资质", subTitle: "人间有味", isBorder: false),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: ScreenAdaper.height(20)
                                            ),
                                            child: this._business(
                                                "商家资质",
                                                subTitle: "人间有味",
                                                isBorder: false,
                                                isIcon: true,
                                                icon: Icon(IconData(
                                                    0xe61e,
                                                    fontFamily: "iconfont"
                                                ), color: Color(0xFFaaaaaa), size: ScreenAdaper.fontSize(30),)
                                            )
                                        )
                                    ]
                                )
                            ],
                        ),
                    )
                ]
            ),
        );
    }
}