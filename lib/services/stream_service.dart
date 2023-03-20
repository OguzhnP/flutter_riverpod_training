class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  }
}
