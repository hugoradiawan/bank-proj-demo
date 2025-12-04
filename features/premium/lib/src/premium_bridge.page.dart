import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, StatelessWidget, Text, Widget;

class PremiumBridgePage extends StatelessWidget {
  const PremiumBridgePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Premium Bridge')),
    body: const Center(child: Text('This is the Premium Bridge Page')),
  );
}
