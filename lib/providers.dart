import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_architecture/screens/data/cart_notifier.dart';
import 'package:mvvm_architecture/screens/data/cart_state_notifier.dart';
import 'package:mvvm_architecture/services/api_service.dart';
import 'package:mvvm_architecture/services/stream_service.dart';

final valueProvider = Provider((ref) => 3);

final valueStateProvider = StateProvider((ref) => 3);

final apiServiceProvider = Provider((ref) => ApiService());
final suggestionFutureProvider = FutureProvider.autoDispose((ref) async {
  final apiservice = ref.watch(apiServiceProvider);
  return apiservice.getSuggestion();
});

final streamServiceProvider = Provider((ref) => StreamService());
final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

final cartNotifierProvider = ChangeNotifierProvider((ref) => CartNotifier());
final cartStateNotifierProvider =
    StateNotifierProvider((ref) => CartStateNotifier());
