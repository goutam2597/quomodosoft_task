import 'package:flutter/material.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({super.key});

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  late String _greeting;

  @override
  void initState() {
    super.initState();
    _greeting = _getGreetingMessage();
  }

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    return 'Good Evening!';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _greeting,
      style: const TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}
