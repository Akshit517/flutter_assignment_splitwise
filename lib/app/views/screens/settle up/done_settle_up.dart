import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';

import 'package:lottie/lottie.dart';

class DoneSettleUp extends StatefulWidget {
  const DoneSettleUp({super.key, required this.name});

  final String name;

  @override
  State<DoneSettleUp> createState() => _DoneSettleUpState();
}

class _DoneSettleUpState extends State<DoneSettleUp>  with TickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose(){
    _controller.dispose();
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
          "Settle Up",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: fontSize * 1.15,
                fontWeight: FontWeight.w400,
                color: AppColorScheme.secondary
              ),
        ),
      ),
      backgroundColor: AppColorScheme.primary,
      body: Column(
        children: [
          _buildAnimation(size),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Hurray!!",
                    style:  Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColorScheme.tertiary,
                      fontWeight: FontWeight.w700,
                      fontSize: 34
                    ),),
                ),
                SizedBox(height: size.height * 0.05,),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "Your account with ",
                      style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorScheme.tertiary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),),
                      Text(
                      "${widget.name} ",
                      style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorScheme.tertiary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),),
                      Text(
                      " has been settled up",
                      style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorScheme.tertiary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),),
                  ],
                ),
                SizedBox(height: size.height * 0.15,),
                SizedBox(
                  width: size.width * 0.75,
                  height: size.height * 0.078125,
                  child: TextButton(
                    onPressed: (){
                      return context.go('/home');
                    },
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(AppColorScheme.primary),
                      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 24)),
                
                    ), 
                    child: const Text("Done"),
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAnimation(Size size) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Lottie.network(
          'https://lottie.host/21d23cb8-2f35-4518-8e18-9b0793f57a0a/e9OlmUPPpu.json',
          width: size.width * 0.4,
          height: size.width * 0.4,
          controller: _controller,
          onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
          }
        ),
      ),
    );
  }
}