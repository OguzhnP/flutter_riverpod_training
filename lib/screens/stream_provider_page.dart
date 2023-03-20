import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture/providers.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Provider Page"),
      ),
      body: Center(
          child: watch.when(
        data: (data) {
          return Text(
            data.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.invalidate(suggestionFutureProvider);
          ref.refresh(streamValueProvider);
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
