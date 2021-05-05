import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haoke/widgets/common_floating_active_button.dart';
import 'package:haoke/widgets/common_form_item.dart';
import 'package:haoke/widgets/common_image_picker.dart';
import 'package:haoke/widgets/common_radio_form_item.dart';
import 'package:haoke/widgets/common_select_form_item.dart';
import 'package:haoke/widgets/common_title.dart';
import 'package:haoke/widgets/room_appliance.dart';

class RoomAdd extends StatefulWidget {
  @override
  _RoomAddState createState() => _RoomAddState();
}

class _RoomAddState extends State<RoomAdd> {
  int rentType = 0; //租赁方式
  int decorationType = 0; //装修
  int roomType = 0; //户型
  int floor = 0; //楼层
  int oriented = 0; //朝向
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布房源'),
      ),
      body: ListView(
        children: [
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.of(context).pushNamed('search');
                  },
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '请选择小区',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '面积',
            hintText: '请输入房屋面积',
            suffixText: '平方',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
              label: '租赁方式',
              options: ['合租', '整租'],
              value: rentType,
              onChange: (index) {
                setState(() {
                  rentType = index;
                });
              }),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: [
              '一室',
              '二室',
              '三室',
              '四室',
            ],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: [
              '高楼层',
              '中楼层',
              '低楼层',
            ],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val;
              });
            },
            options: [
              '东',
              '南',
              '西',
              '北',
            ],
          ),
          CommonRadioFormItem(
              label: '装修',
              options: ['精装', '简装'],
              value: decorationType,
              onChange: (index) {
                setState(() {
                  decorationType = index;
                });
              }),
          CommonTitle('房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          CommonTitle('房源标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: '请输入标题（例如：整组，小区名 2室 2000元）',
                border: InputBorder.none,
              ),
            ),
          ),
          CommonTitle('房源配置'),
          RoomAppliance(onChange: (data){},),
          CommonTitle('房源描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              maxLines: 5,
              controller: descController,
              decoration: InputDecoration(
                hintText: '请输入房屋描述信息',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
    );
  }
}
