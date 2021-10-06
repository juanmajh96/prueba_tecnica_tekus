///
abstract class LocalDateUtil {
  ///
  DateTime subtractOneDayFromDate(DateTime dateTime);

  ///
  DateTime getDataTimeNow();

  ///
  String formattedDate(DateTime dateTime);
}

///
class LocalDateUtilImpl implements LocalDateUtil {
  @override
  DateTime subtractOneDayFromDate(DateTime dateTime) {
    return dateTime.subtract(const Duration(days: 1));
  }

  @override
  DateTime getDataTimeNow() {
    return DateTime.now();
  }

  @override
  String formattedDate(DateTime dateTime) {
    return dateTime.toIso8601String().split('T').first;
  }
}
