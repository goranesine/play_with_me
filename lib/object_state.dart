import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ObjectState with ChangeNotifier {

List<Offset> _points = List();

List get points => _points;

void addOffset(Offset userInput){
_points.add(userInput);
notifyListeners();
}
}


