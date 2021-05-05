import 'package:scoped_model/scoped_model.dart';
import 'package:haoke/pages/home/tab_search/filter_bar/data.dart';

//model
class FilterBarModel extends Model {
  //可选择的列表
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

//已选择的项目
  Set<String> _selectedList = Set<String>();

//对可选的列表操作 读取
  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }

//对可选的列表的操作 设置
  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList'];
    _orientedList = data['orientedList'];
    _floorList = data['floorList'];
    notifyListeners();
  }

//对已选择的项目的操作 读取
  Set<String> get selectedList {
    return _selectedList;
  }

//对已选择的项目的操作 设置
  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }
}
