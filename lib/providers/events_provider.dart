import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  //data
  List<EventModel> allevents = [];
  List<EventModel> displayedEvents = [];
  List<EventModel> favoriteEvents = [];
  //funs
  Future<void> getEvents() async {
    allevents = await FirebaseService.getEvents();
    displayedEvents = allevents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      displayedEvents = allevents;
    } else {
      displayedEvents = allevents
          .where((event) => event.category == category)
          .toList();
    }
    notifyListeners();
  }

  void filterFavouriteEvents(List<String> favouriteEventsIds) {
   favoriteEvents = allevents
        .where(((event) => favouriteEventsIds.contains(event.id)))
        .toList();
        notifyListeners();
  }
}
