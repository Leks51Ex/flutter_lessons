import 'dart:developer';

class Benchmark {
  static Future<void> run({
    required String name,
    required Future<void> Function() action,
    int iterations = 10000,
  }) async {
    final times = <int>[];

    for (int i = 0; i < iterations; i++) {
      final sw = Stopwatch()..start();
      await action();
      sw.stop();
      times.add(sw.elapsedMicroseconds);
    }

    final avg = times.reduce((a, b) => a + b) / iterations;
    final max = times.reduce((a, b) => a > b ? a : b);
    final min = times.reduce((a, b) => a < b ? a : b);

    log('''
==========================
 BENCHMARK: $name
--------------------------
 Iterations: $iterations
 Avg time:   ${avg.toStringAsFixed(2)} μs
 Min time:   $min μs
 Max time:   $max μs
==========================
''');
  }
}
