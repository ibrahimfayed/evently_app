import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/tabs/home/tab_item.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Welcome Back ✨', style: textTheme.titleSmall),
          SizedBox(height: 4),
          Text('John Safwat', style: textTheme.titleLarge),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: DefaultTabController(
              length: CategoryModel.categories.length + 1, //+1 بتاع All
              child: TabBar(
                isScrollable: true,
                tabAlignment: .start,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(right: 8),
                tabs: [
                  TabItem(
                    isSelected: currentIndex == 0,
                    label: 'All',
                    icon: Icons.category_outlined,
                  ),
                  ...CategoryModel.categories.map(
                    (category) => TabItem(
                      isSelected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(category) + 1,
                      icon: category.icon,
                      label: category.name,
                    ),
                  ),
                ],
                onTap: (index) {
                  if (currentIndex == index) {return;}//تحسين زيادة عشان لما يضغط علي نفس العنصر أكتر من مرة ميبنيش الشاشة كلها تاني علي الفاضي
                  currentIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
