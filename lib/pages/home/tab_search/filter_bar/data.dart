class FilterBarResult {
  final String areaId;
  final String priceId;
  final String rentTypeId;
  final List<String> moreIds;

  FilterBarResult({this.areaId, this.priceId, this.rentTypeId, this.moreIds});
}

//通用类型
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('区域1', '11'),
  GeneralType('区域2', '12'),
];
List<GeneralType> priceList = [
  GeneralType('价格1', '21'),
  GeneralType('价格2', '22'),
];
List<GeneralType> rentTypeList = [
  GeneralType('出租类型1', '31'),
  GeneralType('出租类型2', '32'),
];
List<GeneralType> roomTypeList = [
  GeneralType('房屋类型1', '41'),
  GeneralType('房屋类型2', '42'),
];
List<GeneralType> orientedList = [
  GeneralType('方向1', '51'),
  GeneralType('方向2', '52'),
];
List<GeneralType> floorList = [
  GeneralType('楼层1', '61'),
  GeneralType('楼层2', '62'),
];
