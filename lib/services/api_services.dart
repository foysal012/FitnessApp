import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiServices{

  //Header without File
  static Map<String,String>headers ={
    'Content-Type':'application/json',
  };

  static Map<String,String> headerWithAuthorization({required String token}){
    return {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token",
    };
  }

  dynamic jsonData;

  // Get Api Services
  Future<dynamic> getApi(String url) async {
    try {
      debugPrint(url);
      final response = await http.get(Uri.parse(url));
      jsonData = returnResponse(response);
    } catch(e){
      debugPrint('$e');
    }
    return jsonData;
  }


  // Post Api Services
  Future<dynamic> postApi({required String url,required Map<String,String>headers, required dynamic data}) async {
    try {
      debugPrint(url);
      final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
      jsonData = returnResponse(response);
      // debugPrint('Output: ${jsonData}');
    } catch(e){
      debugPrint('$e');
    }

    return jsonData;
  }


  dynamic returnResponse(http.Response response, {bool isShow = true}) {
    switch (response.statusCode) {
      case 200:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 201:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 400:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 401:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 404:
        debugPrint('Not Found');
      case 500:
      //Fluttertoast.showToast(msg: 'Internal Server Error',backgroundColor: Colors.red);
        debugPrint('Server Error - [500]');

      default:
        debugPrint('Unknown Error Occurred - ${response.statusCode}');
    }
  }

  // Get File
  Future<File?> getFile({
    required String url,
    required dynamic data,
    required String fileName,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(url),
          headers: ApiServices.headers,
          body: jsonEncode(data)
      );

      debugPrint(url);
      debugPrint(data.toString());
      final bytes = response.bodyBytes;
      debugPrint('PDF file = ${bytes.length} bytes');

      if (bytes.length < 120) {
        debugPrint('No File Found = ${response.body}');
        return null;
      } else if(response.statusCode==201){
        debugPrint('${response.statusCode}');
        return null;
      } else {
        final filename = '${fileName}_${DateTime.now().millisecond}.pdf';
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/$filename');
        final pdfFile = await file.writeAsBytes(bytes, flush: true);
        return pdfFile;
      }
    } catch (e) {
      debugPrint('Repository PDF report: $e');
      return null;
    }
  }


  // Download File
  Future<File?> downloadFile({
    required String url,
    required dynamic data,
    required String fileName,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(url),
          headers: ApiServices.headers,
          body: jsonEncode(data)
      );

      debugPrint(url);
      final bytes = response.bodyBytes;
      debugPrint('PDF file = ${bytes.length} bytes');

      if (bytes.length < 120) {
        debugPrint('No File Found = ${response.body}');
        return null;
      }  else if(response.statusCode==201){
        debugPrint('${response.statusCode}');
        return null;
      }else {
        final downloadsPath = '/storage/emulated/0/Download';
        var downloadsDir = Directory(downloadsPath);

        if (!await downloadsDir.exists()) {
          // await downloadsDir.create(recursive: true);
          // downloadsDir = await getApplicationDocumentsDirectory();
          downloadsDir = await getTemporaryDirectory();
        }
        // debugPrint('Path: ${downloadsDir}');

        final filename = '${fileName}_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File('$downloadsPath/$filename');
        final pdfFile = await file.writeAsBytes(bytes);
        return pdfFile;
      }
    } catch (e) {
      debugPrint('Repository PDF report: $e');
      return null;
    }
  }
}