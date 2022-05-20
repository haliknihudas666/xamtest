import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:images_picker/images_picker.dart';

final diaryProvider = ChangeNotifierProvider<DiaryProvider>((ref) {
  return DiaryProvider();
});

class DiaryProvider extends ChangeNotifier {
  String? comment;
  DateTime? dateTime;
  String? area;
  String? category;
  String? tags;
  String? event;

  final List<Media> _image = [];
  bool _addPhoto = false;
  bool _isLink = false;

  List<Media> get image => _image;
  bool get isAddPhoto => _addPhoto;
  bool get isLink => _isLink;

  void toggleLink() {
    _isLink = !_isLink;
    notifyListeners();
  }

  void toggleAddPhoto() {
    _addPhoto = !_addPhoto;
    notifyListeners();
  }

  void addImage(Media image) {
    _image.add(image);
    notifyListeners();
  }

  void deleteImage(Media image) {
    _image.remove(image);
    notifyListeners();
  }
}
