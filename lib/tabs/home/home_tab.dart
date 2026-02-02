import 'package:evently_app/firebase_service.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/tabs/home/home_header.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventModel> events = [];
  @override
  Widget build(BuildContext context) {
    if(events.isEmpty){
      getEvents();//to avoid infinite loop
    }
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(events[index]),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: events.length,
          ),
        ),
      ],
    );
  }

  Future<void> getEvents() async {
    events = await FirebaseService.getEvents();
    setState(() {});
  }
}
