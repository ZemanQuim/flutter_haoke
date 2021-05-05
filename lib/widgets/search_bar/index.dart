import 'package:flutter/material.dart';
import 'package:haoke/widgets/common_Image.dart';

class SearchBar extends StatefulWidget {
  final bool showLoaction; //展示位置按钮
  final Function goBackCallback; //回退按钮函数
  final String inputValue; // 搜索框输入值
  final String defaultInputValue; // 搜索框默认值
  final Function onCancel; //取消按钮
  final bool showMap; //展示地图按钮
  final Function onSearch; //用户点击搜索框触发
  final ValueChanged<String> onSearchSubmit; // 用户输入搜索词后，点击键盘的搜索键触发

  const SearchBar(
      {Key key,
      this.showLoaction,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController _controller;
  FocusNode _focus;
  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (widget.showLoaction != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.room,
                      color: Colors.green,
                      size: 16.0,
                    ),
                    Text(
                      '北京',
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: widget.goBackCallback,
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),
          Expanded(
            child: Container(
              height: 34.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(17.0)),
              margin: const EdgeInsets.only(right: 10.0),
              child: TextField(
                //input输入框
                focusNode: _focus,
                onTap: () {
                  if (null == widget.onSearchSubmit) {
                    _focus.unfocus();
                  }
                  widget.onSearch();
                }, //搜索事件
                onSubmitted: widget.onSearchSubmit, //input 的提交事件
                textInputAction: TextInputAction.search, //激活键盘时 确定变成搜索
                onChanged: (value) {
                  _searchWord = value; //输入框value
                },
                controller: _controller,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                    hintText: '请输入搜索词',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                    contentPadding: EdgeInsets.only(top: 1.0, left: -10.0),
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _onClean();
                      },
                      child: Icon(
                        Icons.clear,
                        size: 18.0,
                        color:
                            _searchWord != '' ? Colors.grey : Colors.grey[200],
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                      child: Icon(
                        Icons.search,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
          ),
          if (widget.onCancel != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: widget.onCancel,
                child: Text(
                  '取消',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              ),
            ),
          if (widget.showMap != null)
            CommonImage('static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
