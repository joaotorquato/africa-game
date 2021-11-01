import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Errors {
  static const String GENERIC_ERROR = 'error';

  static Map<String, String> errors = {
    GENERIC_ERROR: 'Erro genérico',
  };

  static String getError(String errorCode) {
    var message = errors[errorCode];
    if (message != null && message.isNotEmpty) {
      return message;
    }

    return 'Falha ao executar operação';
  }

  static void showSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        webBgColor: '#00ff00',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        webBgColor: '#ff0000',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 4,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String? fromError(DioError error) {
    try {
      var data = json.decode(error.response!.data);
      return data['internalCode'];
    } catch (e) {
      return errors[GENERIC_ERROR];
    }
  }
}
