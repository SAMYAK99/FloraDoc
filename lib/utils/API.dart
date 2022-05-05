import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sih/utils/storage.dart';

import 'exceptions.dart';

class APIService {
  static String defaultHost = 'https://doctorflora.herokuapp.com/api/';

  // static String baseUrl = defaultHost + 'admin/';
  static String formUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSdhjfVESCS3KH_Jwz9FiRvAjK4yPPhNQD-dMFiB6sEt4Soejw/viewform?usp=sf_link';

  static String createPost = defaultHost + 'post/create';
  static String registerFarmer = defaultHost + 'farmer/register';
  static String loginFarmer = defaultHost + 'farmer/login';
  static String doctorsData = defaultHost + 'doctor';

  // Sending The Post Request to Server
  static postReq(url, param) async {
    Dio dio = new Dio();
    try {
      var response = await dio.post(url, data: param);
      // Map<String, dynamic> result = jsonDecode(response.data);
      Map<String, dynamic> result =
          new Map<String, dynamic>.from(response.data);
      // print(result);
      print(result);
      return result;
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Color(0xffffff),
          fontSize: 16.0);
    }
  }

  // Sending a Post Request with File
  static postReqWithFile(url, param) async {
    Options opt;
    if (StorageUtil.getIsLogin()) {
      opt = Options(headers: {
        'Token': StorageUtil.getUserToken(),
        'tokenKey': 'astrovistaar123'
      }, contentType: Headers.formUrlEncodedContentType);
    } else {
      opt = Options(
          headers: {'tokenKey': 'astrovistaar123'},
          contentType: Headers.formUrlEncodedContentType);
    }
    Dio dio = new Dio();

    try {
      var response =
          await dio.post(url, data: FormData.fromMap(param), options: opt);

      Map<String, dynamic> result = jsonDecode(response.data);
      return result;
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Map<String, dynamic> result = jsonDecode(e.data);
      return result;
    }
  }

  // Getting the response from Server
  static getReq(
    url,
  ) async {
    Dio dio = new Dio();
    try {
      var response = await dio.get(
        url,
      );
      Map<String, dynamic> result =
          new Map<String, dynamic>.from(response.data);
      return result;
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
