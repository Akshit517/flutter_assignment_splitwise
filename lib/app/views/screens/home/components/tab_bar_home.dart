import 'package:flutter/material.dart';
import 'package:splitwise/app/views/themes/theme.dart';

import 'list_activity.dart';
import 'list_friends.dart';
import 'list_groups.dart';

class TabBarSplitwise extends StatefulWidget {
  const TabBarSplitwise({Key? key}) : super(key: key);

  @override
  _TabBarSplitwiseState createState() => _TabBarSplitwiseState();
}

class _TabBarSplitwiseState extends State<TabBarSplitwise> with TickerProviderStateMixin {
  late final TabController _tabController;
  //friends
  static const List<String> name = ["Shobhit Bakliwal","Firasat Durrani", "Subodh Khale", "Pratham Garg"];
  static const List<String> amount = ["500","400", "700", "100"];
  static const List<String> status = ["You Owe","owes you","owes you", "You Owe"];
  //groups
  static const List<String> groupName = ["Trip To Ladakh","Movie Night", "Dinner at Canto", "Trip To Manimahesh"];
  static const List<String> groupStatus = ["You Owe Shubham","Shobhit Bakliwal owes you","Firasat Durrani owes you","You Owe Firasat"];
  static const List<String> groupIconImage = ["mountain.png","food.png","cinema.png", "mountain.png"];
  static const List<String> groupAmount = ["500","400", "700", "9000"];
  //activity
    static const List<String> title = [
      "You Added Fries",
      "Shobhit B. added to the group \"Movie Night\"", 
      "You added Shubham to the group \"Trip to Ladakh\"", 
      "You settled up with Sushil Kumar"
      ];
  static const List<String> description = ["Shobhit B. owes you","","","You paid ₹500"];
  static const List<String> activityIconImage = ["food.png","cinema.png","mountain.png", "car.png"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double tabBarHeight = screenSize.height * 0.094;
    final double tabBarViewHeight = screenSize.height * 0.45;

    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
          child: Container(
            height: tabBarHeight,
            width: screenSize.width,
            color: AppColorScheme.primary,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "FRIENDS"),
                Tab(text: "GROUPS"),
                Tab(text: "ACTIVITY"),
              ],
            ),
          ),
        ),
        Container(
          height: tabBarViewHeight,
          width: screenSize.width,
          color: AppColorScheme.primary,
          child: TabBarView(
            controller: _tabController,
            children: const [
              FriendItems(name: name, amount: amount, status: status,),
              GroupItems(name: groupName, amount: groupAmount, status: groupStatus, iconImages: groupIconImage),
              ActivityItems(title: title, description: description, iconImages: activityIconImage,),
            ],
          ),
        )
      ],
    );
  }
}
