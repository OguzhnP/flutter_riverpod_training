import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:mvvm_architecture/providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(suggestionFutureProvider);
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Provider Page"),
      ),
      body: Container(
        padding: 20.onlyTopP,
        alignment: Alignment.topCenter,
        child: watch.when(
          data: (data) {
            return ListTile(
              title: Text(data.activity),
              subtitle: Text(data.type),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.invalidate(suggestionFutureProvider);
          ref.refresh(suggestionFutureProvider.future);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          CupertinoIcons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
