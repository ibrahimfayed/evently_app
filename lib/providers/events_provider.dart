import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allevents = [];
  List<EventModel> displayedEvents = [];

  Future<void> getEvents() async {
    allevents = await FirebaseService.getEvents();
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
}
