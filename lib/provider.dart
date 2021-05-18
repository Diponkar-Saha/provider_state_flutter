import 'package:flutter/cupertino.dart';

class CheckProvider extends ChangeNotifier{

  String _message='You have not given any input';
  bool _isEligibility=false;
  
  String get message => _message;
  bool get isEligibility => _isEligibility;
  
  void checkEligibility(int age){
    if(age>=18){
      eligible();
    }else{
      noteligible();
    }
    
  }

  void eligible() {
    _isEligibility=true;
    _message="you are eligible";
    notifyListeners();
  }

  void noteligible() {
    _isEligibility=false;
    _message="you are not eligible";
    notifyListeners();
  }
}