import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class SettleupScreen extends StatefulWidget {
  const SettleupScreen({
    super.key, 
    required this.name, 
    required this.amount, 
    required this.status, 
    required this.isGroup
    });

  final String name;
  final String amount;
  final String status;
  final bool isGroup;

  @override
  _SettleupScreenState createState() => _SettleupScreenState();
}

class _SettleupScreenState extends State<SettleupScreen> {
  final Color _customGrey = const Color.fromARGB(255, 230, 228, 228);
  int? _selectedRadioIndex; 

  bool ifYouOwe(){
    if (widget.status == "owes you"){
      _selectedRadioIndex = 1;
      return false;
    } else {
      return true;
    }
  }

  bool isRadioButtonSelected(){
    if (_selectedRadioIndex == null){
      return false;
    } else {
      return true;
    }
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               _buildUserInfo(context, widget.name, widget.amount, widget.status),

              ifYouOwe()? 
                _buildRadioListTile(context, 0, "paytm" , "Pay Via PayTM") 
                : SizedBox(height: size.height * 0.09,),

              ifYouOwe()? 
                _buildRadioListTile(context, 1, "gpay" , "Pay Via Google Pay") 
                : SizedBox(height: size.height * 0.09,),

              ifYouOwe()? 
                _buildRadioListTile(context, 2, "debit_credit" , "Pay Via Debit/Credit Card") 
                : SizedBox(height: size.height * 0.09,),

              ifYouOwe()? 
                _buildRadioListTile(context, 3, "payother" , "Record via Other Payment Method") 
                : SizedBox(height: size.height * 0.09,),

               SizedBox(height: size.height * 0.1,),
               
               _buildTextButton(context, ifYouOwe()? "Settle Up" : "Send Request")
             ],
           )
          ],
        ),
      ),
    );
  }

  Widget _buildRadioListTile(BuildContext context, int index, String icon, String payDescription){
    final Size size = MediaQuery.of(context).size;
    double listTileHeight = size.height * 0.09;
    double listTileWidth = size.width * 0.8;
    double subtitleFontSize = size.height * 0.015;

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Container(
        height: listTileHeight,
        width: listTileWidth,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 204, 204, 204), width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: RadioListTile(
            value: index, 
            groupValue: _selectedRadioIndex, 
            onChanged: (int? currentIndex){
                setState(() {
                  _selectedRadioIndex = currentIndex!;
                });
                print(_selectedRadioIndex);
            },
            activeColor: AppColorScheme.secondary,
            title: SizedBox(
              width: size.width * 0.1,
              height: size.height * 0.025,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [           
                  Image.asset("lib/assets/icons/${icon}.png"),
                ],
              )),
            subtitle: Text(
              payDescription,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: subtitleFontSize,
              ),
            ),
            ),
        ),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context, String text){
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.078125,
      child: TextButton(
        onPressed: (){
           if (ifYouOwe()) {
             return (
            isRadioButtonSelected()?
              context.push(
                '/home/expense/${widget.isGroup}/${widget.name}/${widget.amount}/settle_up/done',
                extra: widget.name)
               : print('Select a button'));
           } else {
             return ;
           }
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isRadioButtonSelected()? AppColorScheme.secondary : AppColorScheme.primary
            ),
          foregroundColor: WidgetStatePropertyAll(
            isRadioButtonSelected()? AppColorScheme.primary : _customGrey
            ),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 24)),
        ), 
        child: Text(text),
        ),
    );
        
  }

  Widget _buildUserInfo(BuildContext context, String name, String amount, String status){
    final Size size = MediaQuery.of(context).size;
    double titleFontSize = size.height * 0.02;
    double chooseFontSize = size.height * 0.017;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //status
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ifYouOwe()? "$status $name " : "$name $status ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: titleFontSize
                ),
              ), 
              Text(
                "₹$amount",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: titleFontSize,
                  color: ifYouOwe()? AppColorScheme.red : AppColorScheme.green
                ),
              ),
            ],
          ),
        ),
        //avatars
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatar("Meha Bakliwal",  
                !ifYouOwe()? AppColorScheme.red : AppColorScheme.secondary
                ),

            Icon( ifYouOwe()? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
            color: _customGrey,
            size: size.width * 0.15,
            opticalSize: 10,
            ),
            
            _buildAvatar(
              name, 
              ifYouOwe()? AppColorScheme.red : AppColorScheme.secondary
              )
          ],
        ),
        //chooseText
        ifYouOwe()? Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Choose a payment method",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: chooseFontSize,
            ),
          ),
        ) : SizedBox(height: size.height * 0.05,)      
      ],
    );
  }

  Widget _buildAvatar(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CircleAvatar(
              radius: 35,
              backgroundColor: _customGrey,
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 40,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              )
        
            ),
    );
  }
}
