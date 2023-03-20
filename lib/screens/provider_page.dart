import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture/providers.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(valueProvider);
    return Scaffold(
        appBar: const CupertinoNavigationBar(
          middle: Text("Provider Page"),
        ),
        body: Center(
          child: Text(
            "Provider value is : $watch",
            style: const TextStyle(fontSize: 22),
          ),
        ));
  }
}
