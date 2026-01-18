import 'package:evently_app/widgets/defult_text_form_field.dart';
import 'package:evently_app/widgets/event_item.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefultTextFormField(
            hintText: 'Search for event',
            suffixIconImageName: 'search',
            onChanged: (quary) {},
          ),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => EventItem(),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
