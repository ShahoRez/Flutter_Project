import 'package:flutter/cupertino.dart';

const defaultScrollPychics = BouncingScrollPhysics();

extension PriceLable on int {
  String get withPriceLable => '$this  تومان';
}
