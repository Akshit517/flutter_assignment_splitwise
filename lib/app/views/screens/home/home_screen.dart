import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/screens/home/components/tab_bar_home.dart';
import 'package:splitwise/app/views/screens/home/components/user_avatar.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu_rounded)
            ),
        title: Center(
          child: Title(
            color: AppColorScheme.primary, 
            child: Text("SPLITWISE", 
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w400
              )
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_rounded)
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert_rounded)
          ),
        ],
      ),
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              const UserAvatar(),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColorScheme.primary
                  ),
                  height: height * 0.13,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BalanceCard(title: 'You are owed', amount: '1500'),
                      Container(width: 4, height: height * 0.1, color: const Color.fromARGB(255, 210, 210, 210),),
                      const BalanceCard(title: 'You owe', amount: '750'),
                      Container(width: 4, height: height * 0.1, color: const Color.fromARGB(255, 210, 210, 210)),
                      const BalanceCard(title: 'Total Balance', amount: '750'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const TabBarSplitwise(),    
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => context.pushNamed("Add Expense"),
      foregroundColor: AppColorScheme.primary,
      backgroundColor: AppColorScheme.secondary,
      shape: const CircleBorder(),
      child: const Icon(Icons.add_rounded,
      size: 34,),
      ),
    backgroundColor: AppColorScheme.secondary,
    );
  }
}

class BalanceCard extends StatelessWidget {
  final String title;
  final String amount;

  const BalanceCard({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    //font sizes
    double fontSize = height * 0.0175;
    double rupeeFontSize = fontSize * 1.25;
    double amountFontSize = rupeeFontSize * 1.5;


    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: fontSize
            )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("₹ ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: rupeeFontSize
                      ),),
                Text(
                  amount,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: amountFontSize
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
