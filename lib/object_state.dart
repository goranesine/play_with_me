import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class ObjectState with ChangeNotifier {
double _width ;
double _height;
ObjectState(this._width,this._height);
double get width => _width;
double get height => _height;
}

