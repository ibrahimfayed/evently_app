import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{
  UserModel? currentUser;

  void updateCurrentUser(UserModel? user){
        currentUser = user;
        notifyListeners();
  }
  
  bool checkIsFavouriteEvent(String eventId){
    return currentUser!.favouriteEventsIds.contains(eventId);
  }
  void addEventToFavourites(String eventId){
    FirebaseService.addEventToFavourites(eventId);
    currentUser!.favouriteEventsIds.add(eventId);
    notifyListeners();
  }

  void removeEventFromFavourites(String eventId){
    FirebaseService.removeEventFromFavourites(eventId);
    currentUser!.favouriteEventsIds.remove(eventId);
    notifyListeners();
  }
  
}