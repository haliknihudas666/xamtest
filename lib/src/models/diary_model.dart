class DiaryModel {
  DiaryModel.error(this.error);
  DiaryModel.message(this.message);
  DiaryModel({
    this.comment,
    this.eventName,
    this.isLink,
    this.date,
    this.area,
    this.category,
    this.tags,
    this.photos,
    this.isAddToDiary,
  });
  String? message;
  String? comment;
  String? eventName;
  bool? isLink;
  String? error;
  String? date;
  String? area;
  String? category;
  String? tags;
  List<String>? photos;
  bool? isAddToDiary;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = 'Nicolei';
    data['photos'] = photos.toString();
    data['isAddToDiary'] = isAddToDiary.toString();
    data['date'] = date.toString();
    data['area'] = area;
    data['category'] = category;
    data['tags'] = tags;
    data['comment'] = comment;
    data['eventName'] = eventName;
    data['isLink'] = isLink.toString();
    return data;
  }
}
