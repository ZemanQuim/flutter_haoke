import 'package:flutter/material.dart';
import 'package:haoke/pages/home/tab_search/filter_bar/data.dart';
import 'package:haoke/scoped_model/room_filter.dart';
import 'package:haoke/utils/scoped_model_helper.dart';
import 'package:haoke/widgets/common_title.dart';

class FilterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList['roomTypeList'];
    orientedList = dataList['orientedList'];
    floorList = dataList['floorList'];

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            CommonTitle('户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('朝向'),
            FilterDrawerItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('楼层'),
            FilterDrawerItem(
              list: floorList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem({Key key, this.list, this.selectedIds, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((e) {
          var isActive = selectedIds.contains(e.id);
          return GestureDetector(
            onTap: () {
              if (onChange != null) {
                onChange(e.id);
              }
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(width: 1.0, color: Colors.green)),
              width: 100.0,
              height: 30.0,
              child: Center(
                child: Text(
                  e.name,
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
