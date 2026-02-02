import 'package:evently_app/app_theme.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
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
            color: AppTheme.backgroundLight,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Text(
            DateFormat('d MMM').format(event.dateTime),
          style: textTheme.titleMedium!.copyWith(
            fontWeight: .w600,
            color: primaryColor
          ),
          ),
        ),
        Positioned(
          left: 8,
          width: screenSize.width-48,//16+16+8+8=48
          bottom: 8,
          child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.backgroundLight,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Expanded(child: Text(
                  event.title,
                style: textTheme.titleMedium!.copyWith(
                  color: AppTheme.black
                ),
                ),
                ),
                SizedBox(height: 8,),
                Icon(Icons.favorite_outline,color: primaryColor,)
              ],
            ),
          ),
        )
      ],
    );
  }
}