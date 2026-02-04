import 'package:evently_app/app_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void showSuccessMessage(String message)=>
  Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppTheme.gereen,
        textColor: AppTheme.white,
    );

  static void showErrorMessage([String? message])=>
  Fluttertoast.showToast(
        msg: message ?? 'Something Went Wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppTheme.red,
        textColor: AppTheme.white,
    );  
}