import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class ExpenseScreen extends StatelessWidget {
  final String name;
  final String description;
  final String amount;
  final Color statusColor;
  final String? icon;
  final bool isGroup;

  const ExpenseScreen({
    super.key,
    required this.name,
    required this.statusColor,
    required this.amount,
    this.icon,
    required this.description,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double fontSize = size.height * 0.0225;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        title: Center(
          child: Text(
            "SPLITWISE",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: fontSize * 1.05,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      backgroundColor: AppColorScheme.primary,
      body: Column(
        children: [
          _buildUserInfo(context, size),
          const Expanded(
            child: ListViewWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context,Size size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(60)),
        color: AppColorScheme.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, size.height * 0.005, 0, size.height * 0.015),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColorScheme.primary,
              child: _buildAvatarContent(),
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: size.height * 0.0225,
                  color: AppColorScheme.primary,
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: size.height * 0.0225 * 0.75,
                        color: AppColorScheme.primary,
                      ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹ ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: size.height * 0.0225 * 1.25,
                              color: AppColorScheme.primary,
                            ),
                      ),
                      Text(
                        amount,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: size.height * 0.0225 * 1.25 * 1.5,
                              color: AppColorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, size.height * 0.01, 0, size.height * 0.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(context , (description == "owes you")? "Request" : "Settle Up"),
                _buildActionButton(context ,isGroup ? "Balances" : "Send Reminder"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarContent() {
    if (isGroup) {
      return Image.asset("lib/assets/icons/$icon");
    } else {
      return Text(
        name[0],
        style: TextStyle(
          fontSize: 40,
          color: statusColor,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  Widget _buildActionButton(BuildContext context, String text) {
    final Size size = MediaQuery.of(context).size;
    double fontSize = size.height * 0.0225;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.4,
      height: size.height * 0.05,
      child: TextButton(
        onPressed: () {
          context.push(
            '/home/expense/${isGroup}/${name}/${amount}/settle_up',
            extra: {
              'isGroup' : false,
              'name' : name,
              "amount" : amount,
              "status" : description
            });
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: WidgetStateProperty.all(AppColorScheme.darkGreen),
          foregroundColor: WidgetStateProperty.all(AppColorScheme.primary),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize * 0.8,
                color: AppColorScheme.primary,
              ),
        ),
      ),
    );
  }
}

//List View Widget --------------------------------------------------
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildListItem(context, index),
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final Size size = MediaQuery.of(context).size;

    List<String> expenseAmount = ["500", "900", "600", "700"];
    List<String> expense = ["Car", "Hotel", "Food", "Car"];
    List<String> expenseDescription = ["Added by Subodh Kalhe", "Added by Sudahkar S.", "Added by Deshmukh Furani", "Added by Pratham"];
    List<String> expenseIcon = ["car.png", "city.png", "food.png", "city.png"];

    double listItemHeight = size.height * 0.125;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 230, 230, 230), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: BoxConstraints(
        minHeight: listItemHeight,
      ),
      child: ListTile(
        onTap: () {
          print("tap");
        },
        minTileHeight: listItemHeight,
        leading: _buildLeadingContent(context, expense, expenseDescription, expenseIcon, index),
        trailing: _buildTrailingContent(context, expenseAmount ,index),
      ),
    );
  }

Widget _buildLeadingContent(
  BuildContext context,
  List<String> expense,
  List<String> description,
  List<String> expenseIcon,
  int index,
) {
  final Size size = MediaQuery.of(context).size;

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: size.height * 0.025,
        child: Image.asset('lib/assets/icons/${expenseIcon[index]}'),
      ),
      Text(
        expense[index],
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize(context, 0.015), 
            ),
      ),
      Text(
        description[index],
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: fontSize(context, 0.01), 
            ),
      ),
    ],
  );
}
Widget _buildTrailingContent(BuildContext context, List<String> expenseAmount, int index) {
  final Size size = MediaQuery.of(context).size;
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: size.width * 0.35,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "November 3, 2019",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize(context, 0.012), 
              ),
        ),
        Text("You owe",
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize(context, 0.012), 
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "₹ ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: fontSize(context, 0.018), 
                  ),
            ),
            Text(
              expenseAmount[index],
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: fontSize(context, 0.022), 
                  ),
            ),
          ],
        ),
      ],
    ),
  );
}

  double fontSize(BuildContext context, double d) {
    final Size size = MediaQuery.of(context).size;
    return size.height * d;
  }
}
