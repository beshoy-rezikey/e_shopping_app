import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future shopToastMessage({required String Message,required ToastState state}) {

  return Fluttertoast.showToast(

      msg: Message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastStateColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

Future failToast({required String ? Message}) {
  return Fluttertoast.showToast(
      msg: Message!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
enum  ToastState {success,error , warning}


Color chooseToastStateColor (ToastState state)
{
  Color color;

  switch (state){
    case ToastState.success :
  color = Colors.green;
  break;
    case ToastState.error :
      color = Colors.red;
      break;
    case ToastState.warning :
      color = Colors.yellow;
      break;
  }

  return color ;
}

