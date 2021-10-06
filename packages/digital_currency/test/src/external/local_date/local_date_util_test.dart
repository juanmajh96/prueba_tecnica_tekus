import 'package:digital_currency/src/external/local_date/local_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocalDateUtil _localDateUtil;
  setUpAll(() {
    _localDateUtil = LocalDateUtilImpl();
  });

  group('util DateTime', () {
    test('get DateTime now', () {
      expect(_localDateUtil.getDataTimeNow(), isA<DateTime>());
    });

    test('convert dateTime in string with this format 2021-10-05', () {
      final _result = _localDateUtil.formattedDate(
        _localDateUtil.getDataTimeNow(),
      );

      expect(_result, isA<String>());
      expect(_result.length, 10);
    });

    test('subtract one day to datetime', () {
      final _dateTime = DateTime(
        2021,
        10,
      );
      final _beforeDateTime = DateTime(
        2021,
        09,
        30,
      );

      final _result = _localDateUtil.subtractOneDayFromDate(_dateTime);

      expect(_result, equals(_beforeDateTime));
    });
  });
}
