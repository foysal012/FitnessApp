import 'package:fitnessapp/model/excercise_model.dart';
import '../../services/api_services.dart';

class HistoryRepository{
  ApiServices _apiServices = ApiServices();

  // Get History
  Future<ExerciseResponseModel> getHistoryData(String historyUrl) async{

    final response = await _apiServices.getApi(historyUrl);

    return ExerciseResponseModel.fromJson(response);
  }
}