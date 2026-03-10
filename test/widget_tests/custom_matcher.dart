import 'package:flutter_test/flutter_test.dart';

class FindsExactlyoneWidget extends Matcher {
  @override
  Description describe(Description description) {
    return description.add('Найден только один виджет');
  }

  @override
  bool matches(item, Map matchState) {
    // Проверяем, является ли item объектом Finder
    if (item is! Finder) {
      // Если нет, записываем ошибку в matchState и возвращаем false
      matchState['error'] = 'Ожидался Finder, но получено: ${item.runtimeType}';
      return false;
    }

    // Получаем количество найденных виджетов
    final count = item.evaluate().length;

    // Если найден ровно один виджет, возвращаем true
    if (count == 1) {
      return true;
    }

    // В противном случае сохраняем количество найденных
    // виджетов в matchState и возвращаем false
    matchState['count'] = count;
    return false;
  }

  @override
  Description describeMismatch(
    item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    if (matchState.containsKey('error')) {
      return mismatchDescription.add(matchState['error']);
    }
    return mismatchDescription.add('Найдено ${matchState['count']} виджетов');
  }
}
