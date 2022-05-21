import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DestroyBoxButton extends StatelessWidget {
  final Color color;

  const DestroyBoxButton({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(32),
          shadowColor: null,
          elevation: 0,
          side: const BorderSide(color: Colors.black)),
      child: null,
    );
  }
}
