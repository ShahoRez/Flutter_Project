import 'package:flutter/material.dart';
import 'package:nike_store_app/common/exeption.dart';

class AppErrorHandler extends StatelessWidget {
  final AppExeption exeption;
  final GestureTapCallback onPressed;
  const AppErrorHandler({
    Key? key,
    required this.exeption,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(exeption.message),
          ElevatedButton(onPressed: onPressed, child: const Text('تلاش دوباره'))
        ],
      ),
    );
  }
}
