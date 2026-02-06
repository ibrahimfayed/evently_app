import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late EventsProvider eventsProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserProvider userProvider = Provider.of<UserProvider>(
        context,
        listen: false,
      );
      eventsProvider.filterFavouriteEvents(
        userProvider.currentUser!.favouriteEventsIds,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Search for event',
            suffixIconImageName: 'search',
            onChanged: (quary) {},
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  EventItem(eventsProvider.favoriteEvents[index]),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: eventsProvider.favoriteEvents.length,
            ),
          ),
        ],
      ),
    );
  }
}
