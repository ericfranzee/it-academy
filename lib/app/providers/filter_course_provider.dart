import 'package:flutter/material.dart';
import 'package:incrat/app/models/filter_model.dart';

class FilterCourseProvider extends ChangeNotifier{

  List<FilterModel> filters = [];
  List<int> filterSelected = [];

  bool upcoming=false;
  bool free=false;
  bool discount=false;
  bool downloadable=false;
  bool bundleCourse=false;
  bool rewardCourse=false;

  String sort = '';


  clearFilter(){
    filterSelected.clear();

    upcoming=false;
    free=false;  
    discount=false;
    downloadable=false;
    bundleCourse=false;
    rewardCourse=false;

    sort = '';
  }
}