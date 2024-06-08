import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitwise/app/views/themes/theme.dart';

class GroupItems extends StatelessWidget {
  final List<String> name;
  final List<String> status;
  final List<String> amount;
  final List<String> iconImages;

  const GroupItems({
    Key? key,
    required this.name,
    required this.status,
    required this.amount,
    required this.iconImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double listTileHeight = size.height * 0.105;
    double avatarRadius = size.height * 0.04;
    double titleFontSize = size.height * 0.02;
    double subtitleFontSize = size.height * 0.015;
    double amountFontSize = size.height * 0.035;

    Color getStatusColor(String status) {
      return status.contains("You Owe")? AppColorScheme.red : AppColorScheme.green;
    }

    return ListView.builder(
      itemCount: name.length,
      itemBuilder: (BuildContext context, int index) {
        final Color statusColor = getStatusColor(status[index]);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 230, 230, 230), width : 2),
              borderRadius: BorderRadius.circular(12)
            ),
            constraints: BoxConstraints(
              minHeight: listTileHeight,
            ),
            child: ListTile(
              onTap: (){
                context.push(Uri(
                  path: '/home/expense/${true}/${name[index]}/${amount[index]}',
                  queryParameters: {
                    'description':status[index],
                    'statusColor': statusColor.value.toString(),
                    'icon': iconImages[index],
                  },
                ).toString()
                );
              },
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,8,4),
                child: Text(
                  name[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0,4,8,8),
                child: Text(
                  status[index],
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: subtitleFontSize,
                  ),
                ),
              ),
              leading: Container(
                width: avatarRadius * 2,
                height: avatarRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: statusColor,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: AppColorScheme.primary,
                  child: Image.asset("lib/assets/icons/${iconImages[index]}")
                ),
              ),
              trailing: SizedBox(
                width: size.width * 0.22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("₹ ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: amountFontSize * 0.65
                    ),),
                    Text(
                      amount[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: amountFontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
