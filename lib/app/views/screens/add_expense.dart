import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen>{


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double fontSize = size.height * 0.0225;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColorScheme.secondary,),
          onPressed: () => context.pop(true),
        ),
        title: Text(
          "Add Expense",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: fontSize * 1.15,
                fontWeight: FontWeight.w400,
                color: AppColorScheme.secondary
              ),
        ),
        actions: [
          InkWell(
            onTap: (){
              print("tap");
            },
            child: Text(
              "SAVE",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: fontSize * 0.95,
                fontWeight: FontWeight.w400,
                color: AppColorScheme.secondary
                ),),
          ),
          const SizedBox(width: 10,)],
      ),
      backgroundColor: AppColorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.025,),
                Text(
                  "With You and ____________",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorScheme.tertiary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                  )
                ),
                SizedBox(height: size.height * 0.025,),
                
                Text(
                  "₹ ____________",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorScheme.tertiary,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                  )
                ),
                SizedBox(height: size.height * 0.15,),
                Center(
                  child: SizedBox(
                    width: size.width * 0.75,
                    height: size.height * 0.078125,
                    child: TextButton(
                      onPressed: (){
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(AppColorScheme.primary),
                        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 24)),
                  
                      ), 
                      child: const Text("Done"),
                      ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

 
}