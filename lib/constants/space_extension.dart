import 'package:flutter/cupertino.dart';

extension OnInt on int{
  SizedBox get horizental => SizedBox(width: toDouble(),);
  SizedBox get veritcal => SizedBox(height: toDouble(),);
}