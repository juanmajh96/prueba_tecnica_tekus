/// Utils from manager date , subtract date and conver string
abstract class LocalDateUtil {
  /// Subtract one day of date
  DateTime subtractOneDayFromDate(DateTime dateTime);

  /// Get date time now
  DateTime getDataTimeNow();

  /// Convert date in String
  String formattedDate(DateTime dateTime);
}

/// Implementation for interface [LocalDateUtil]
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
