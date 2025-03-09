import 'package:flutter/material.dart';

class Constants {
  
  
  static const dommain = 'https://academy.incrat.com';
  static const baseUrl = '$dommain/api/development/';
  static const apiKey = 'Incrat@247';
  static const scheme = 'academyapp';
  
  static final RouteObserver<ModalRoute<void>> singleCourseRouteObserver = RouteObserver<ModalRoute<void>>();
  static final RouteObserver<ModalRoute<void>> contentRouteObserver = RouteObserver<ModalRoute<void>>();

}
