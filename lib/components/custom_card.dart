import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget expandedChild;
  final List<Widget> actionButtonList;
  final Color cardColor;

  const CustomCard({
    Key? key,
    required this.expandedChild,
    required this.actionButtonList,
    required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: cardColor,
      child: Container(
        height: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: expandedChild,
              ),
            ),
            buildCustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actionButtonList,
            )
          ],
        ),
      ),
    );
  }

  Divider buildCustomDivider() {
    return Divider(
      color: Colors.grey[600],
      indent: 30,
      endIndent: 30,
    );
  }
}
