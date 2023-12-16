import 'package:flutter_test/flutter_test.dart';
import 'package:jocaagura_domain/jocaagura_domain.dart';

void main() {
  group('DateUtils', () {
    test('Convertir cadena de fecha', () {
      const String dateString = '2023-05-30T12:30:00';
      final DateTime result = DateUtils.dateTimeFromDynamic(dateString);
      final DateTime expected = DateTime(2023, 5, 30, 12, 30);
      expect(result, equals(expected));
    });

    test('Convertir valor de tiempo en milisegundos', () {
      const int milliseconds = 1622394000000; // 31 de mayo de 2021, 12:00:00
      final DateTime result = DateUtils.dateTimeFromDynamic(milliseconds);
      final DateTime expected = DateTime(2021, 5, 30, 12);
      expect(result, equals(expected));
    });

    test('Convertir Duration', () {
      const Duration duration = Duration(days: 5);
      final DateTime result = DateUtils.dateTimeFromDynamic(duration);
      final DateTime expected = DateTime.now().add(duration);
      expect(result.isAtSameMomentAs(expected), isTrue);
      print(result);
      print(expected);
    });

    test('Manejar valor DateTime directo', () {
      final DateTime directDateTime = DateTime(2023, 6, 15, 8);
      final DateTime result = DateUtils.dateTimeFromDynamic(directDateTime);
      expect(result, equals(directDateTime));
    });

    test('Manejar valor nulo', () {
      final DateTime result = DateUtils.dateTimeFromDynamic(null);
      expect(result, isA<DateTime>());
    });
  });
}