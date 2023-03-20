import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:mvvm_architecture/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(valueStateProvider);
    ref.listen(
      valueStateProvider,
      (previous, next) {
        if (next == 10) {
          Grock.snackBar(
              title: "Congrats",
              description: "Value is $next",
              position: SnackbarPosition.bottom);
        }
      },
    );
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: IconButton(
            onPressed: () {
              ref.invalidate(valueStateProvider);
            },
            icon: const Icon(
              CupertinoIcons.refresh,
              size: 25,
            )),
        middle: const Text("Provider Page"),
      ),
      body: Center(
        child: Text(
          "State Provider value is : $watch",
          style: const TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
          onPressed: () {
            ref.read(valueStateProvider.notifier).state++;
          }),
    );
  }
}
