import 'package:evently_app/app_theme.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/settings_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    EventsProvider eventsProvider = Provider.of<EventsProvider>(
      context,
      listen: false,
    );
    bool isFavourite = userProvider.checkIsFavouriteEvent(event.id);
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    Color primaryColor = Theme.of(context).primaryColor;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            'assets/images/${event.category.imageName}.png',
            height: screenSize.height * 0.23,
            width: double.infinity,
            fit: .fill,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: settingsProvider.isDark
                  ? AppTheme.backgroundDark
                  : AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: settingsProvider.isDark
                    ? AppTheme.borderDark
                    : AppTheme.offWhite,
              ),
          ),
          child: Text(
            DateFormat('d MMM').format(event.dateTime),
            style: textTheme.titleMedium!.copyWith(
              fontWeight: .w600,
              color: primaryColor,
            ),
          ),
        ),
        Positioned(
          left: 8,
          width: screenSize.width - 48, //16+16+8+8=48
          bottom: 8,
          child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.backgroundDark
                  : AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: settingsProvider.isDark
                    ? AppTheme.borderDark
                    : AppTheme.offWhite,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: textTheme.titleMedium!.copyWith(
                      color: settingsProvider.isDark
                          ? AppTheme.white
                          : AppTheme.black,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    if (isFavourite) {
                      userProvider.removeEventFromFavourites(event.id);
                      eventsProvider.filterFavouriteEvents(
                        userProvider.currentUser!.favouriteEventsIds,
                      );
                    } else {
                      userProvider.addEventToFavourites(event.id);
                    }
                  },
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_outline,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
