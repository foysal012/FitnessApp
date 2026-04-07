import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/excercise_model.dart';
import '../../repository/history_repositoy.dart';
import '../../resources/app_url/app_url.dart';

class HomeScreenProvider with ChangeNotifier{

  List<Exercise> _allDataList = [];
  List<Exercise> get allData => _allDataList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final historyRepo = HistoryRepository();

  // Get Data
  Future<void> fetchData() async{
    _isLoading = true;
    try {
      final jsonResponse = await historyRepo.getHistoryData(AppUrl.getData);

      debugPrint('foysal1${jsonResponse}');
      debugPrint('foysal2${jsonResponse.exercises}');

      if (jsonResponse.exercises?.isNotEmpty == true) {
        _allDataList.addAll(jsonResponse.exercises??[]);
        debugPrint('Output: ${_allDataList.map((e) => e.thumbnail).toList()}');
      } else {
        _allDataList = [];
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      debugPrint('Problem is ${e.toString()}');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Refresh
  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    _allDataList.clear();
    fetchData();
    debugPrint('Refresh Screen');
    notifyListeners();
  }

}