import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_task/app/utils/toast_utils.dart';

class NetworkService {
  static Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        var result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
         
          return true;
        }
      } on SocketException catch (_) {
        
        return false;
      }
    }
    else{
       ToastUtils.showToast(
            "Please Check the internet connection and try agein!", Colors.red);
    }
    return false;
  }
}


