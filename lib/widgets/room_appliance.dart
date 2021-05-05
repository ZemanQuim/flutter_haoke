import 'package:flutter/material.dart';
import 'package:haoke/config.dart';
import 'package:haoke/widgets/common_check_button.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe643, false),
  RoomApplianceItem('洗衣机', 0xe67d, false),
  RoomApplianceItem('空调', 0xe671, false),
  RoomApplianceItem('天然气', 0xe60e, false),
  RoomApplianceItem('冰箱', 0xe625, false),
  RoomApplianceItem('暖气', 0xe636, false),
  RoomApplianceItem('电视', 0xe680, false),
  RoomApplianceItem('热水器', 0xe6fc, false),
  RoomApplianceItem('宽带', 0xe614, false),
  RoomApplianceItem('沙发', 0xe606, false),
];

class RoomAppliance extends StatefulWidget {
  //组件参数
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({Key key, this.onChange}) : super(key: key);
  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 30.0,
        children: list
            .map((e) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      list = list
                          .map((item) => item == e
                              ? RoomApplianceItem(
                                  e.title, e.iconPoint, !e.isChecked)
                              : item)
                          .toList();
                    });
                    if (null != widget.onChange) {
                      widget.onChange(list);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Icon(
                          IconData(
                            e.iconPoint,
                            fontFamily: Config.CommonIcon,
                          ),
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(e.title),
                        ),
                        CommonCheckButton(e.isChecked)
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplicanceList extends StatelessWidget {
  final List<String> list;

  const RoomApplicanceList({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((element) => list.contains(element.title)).toList();
    if (showList.length == 0) {
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Text('暂无房屋配置信息'),
      );
    }
    return Container(
      child: Wrap(
        runSpacing: 30.0,
        children: showList
            .map((e) => Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(
                          e.iconPoint,
                          fontFamily: Config.CommonIcon,
                        ),
                        size: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(e.title),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
