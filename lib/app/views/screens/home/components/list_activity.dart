import 'package:flutter/material.dart';

class ActivityItems extends StatelessWidget {
  final List<String> title;
  final List<String> description;
  final List<String> iconImages;

  const ActivityItems({
    super.key,
    required this.title,
    required this.description,
    required this.iconImages
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double listTileHeight = size.height * 0.105;
    double avatarRadius = size.height * 0.04;
    double titleFontSize = size.height * 0.02;
    double subtitleFontSize = size.height * 0.015;

    return ListView.builder(
      itemCount: title.length,
      itemBuilder: (BuildContext context, int index) {
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
              },
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,8,4),
                child: Text(
                  title[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              subtitle: subtitleText(index, context, subtitleFontSize),
              leading: CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Color.fromARGB(255, 229, 229, 229),
                child: Image.asset("lib/assets/icons/${iconImages[index]}")
              ),
            ),
          ),
        );
      },
    );
  }

  Padding subtitleText(int index, BuildContext context, double subtitleFontSize) {
    if (description[index] != ""){
    return Padding(
              padding: const EdgeInsets.fromLTRB(0,4,8,8),
              child: Text(
                 description[index],
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: subtitleFontSize,
                ),
              ),
            );
  } else {
    return const Padding(padding: EdgeInsets.fromLTRB(0,4,8,8));
  }
  }

}
