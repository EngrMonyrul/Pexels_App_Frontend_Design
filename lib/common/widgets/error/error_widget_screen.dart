import 'package:flutter/material.dart';

class ErrorWidgetScreen extends StatelessWidget {
  const ErrorWidgetScreen({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Route Found Name $name"),
      ),
    );
  }
}
