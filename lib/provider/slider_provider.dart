import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier{
  double _opacityValue=1.0;
  double get opacityValue => _opacityValue;

  void setOpacity(val){
    _opacityValue=val;
    notifyListeners();
  }
}