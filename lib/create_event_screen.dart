import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/tabs/home/tab_item.dart';
import 'package:evently_app/widgets/arrow_back.dart';
import 'package:evently_app/widgets/default_elevated_button.dart';
import 'package:evently_app/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = '/create-event';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentIndex = 0;
  CategoryModel selectedCategory =
      CategoryModel.categories[0]; //CategoryModel.categories.first
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('d/M/yyyy');

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: ArrowBack(), title: Text('Add event')),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(
                'assets/images/${selectedCategory.imageName}.png',
                height: MediaQuery.sizeOf(context).height * 0.23,

                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DefaultTabController(
              length: CategoryModel.categories.length,
              child: TabBar(
                isScrollable: true,
                tabs: CategoryModel.categories
                    .map(
                      (category) => TabItem(
                        isSelected:
                            currentIndex ==
                            CategoryModel.categories.indexOf(category),
                        label: category.name,
                        icon: category.icon,
                      ),
                    )
                    .toList(),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(right: 8),
                tabAlignment: .start,
                padding: EdgeInsets.only(left: 16),
                onTap: (index) {
                  currentIndex = index;
                  selectedCategory = CategoryModel.categories[currentIndex];
                  setState(() {});
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Title', style: textTheme.titleMedium),
                  SizedBox(height: 8),
                  DefaultTextFormField(
                    hintText: 'Event Title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cannot be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text('Description', style: textTheme.titleMedium),
                  SizedBox(height: 8),
                  DefaultTextFormField(
                    maxLines: 4,
                    hintText: 'Event Description....',
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description cannot be empty';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          'assets/icons/date.svg',
                          height: 24,
                          width: 24,
                          fit: .scaleDown,
                        ),
                      ),
                      Text('Event Date', style: textTheme.titleMedium),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialDate: selectedDate,
                            initialEntryMode: .calendarOnly,
                          );
                          if (date != null) {
                            selectedDate = date;
                            setState(() {});
                          }
                          print(selectedDate);
                        },
                        child: Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : dateFormat.format(selectedDate!),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          'assets/icons/time.svg',
                          height: 24,
                          width: 24,
                          fit: .scaleDown,
                        ),
                      ),
                      Text('Event Time', style: textTheme.titleMedium),
                      Spacer(),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime:
                                selectedTime ??
                                TimeOfDay.now(), //نفس اللي تحتها بالظبط بس مختصرة
                            // initialTime: selectedTime != null
                            //     ? selectedTime!
                            //     : TimeOfDay.now(),
                          );
                          if (time != null) {
                            selectedTime = time;
                            setState(() {});
                          }
                        },
                        child: Text(
                          selectedTime?.format(context).toString() ??
                              'Choose time',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  DefaultElevatedButton(
                    label: 'Add event',
                    onPressed: createEvent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
          DateTime dateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            selectedTime!.hour,
            selectedTime!.minute
          );
          EventModel event = EventModel(
            category: selectedCategory,
            title: titleController.text,
            description: descriptionController.text,
            dateTime: dateTime);
            event.toJson();
        }
        
  }
}
