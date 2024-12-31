import 'package:tag_gallery/common/constant/sort_constant.dart';

class SortData {
  SortType sortType;
  SortOrder sortOrder;

  SortData({this.sortType = SortType.date, this.sortOrder = SortOrder.desc});

  SortData copyWith({SortType? sortType, SortOrder? sortOrder}) {
    return SortData(
      sortType: sortType ?? this.sortType,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
