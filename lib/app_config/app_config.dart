import 'package:flutter/material.dart';
class AppConfig {
  static BuildContext? _context;
  static late double _height;
  static late double _width;
  static late double _heightPadding;
  static late double _widthPadding;

  static void init(BuildContext context) {
    _context = context;
    MediaQueryData _queryData = MediaQuery.of(_context!);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding =
        _height - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double rH(double v) {
    return _height * v;
  }

  double rW(double v) {
    return _width * v;
  }

  double rHP(double v) {
    return _heightPadding * v;
  }

  double rWP(double v) {
    return _widthPadding * v;
  }
}