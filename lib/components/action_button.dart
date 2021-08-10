import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final IconData iconData;
  final Function()? onPressed;

  const ActionButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: this.widget.onPressed,
      icon: Icon(
        this.widget.iconData,
        color: Colors.grey[500],
        size: 22,
      ),
    );
  }
}
