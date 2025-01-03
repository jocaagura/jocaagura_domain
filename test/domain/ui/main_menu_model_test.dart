import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jocaagura_domain/jocaagura_domain.dart';

// revisado 10/03/2024 author: @albertjjimenezp
void main() {
  group('ModelMainMenu', () {
    const IconData iconData = Icons.home;
    void onPressed() {}
    const String label = 'Option 1';
    const String description = 'Description';

    test('copyWith creates a new instance with the provided values', () {
      final ModelMainMenuModel modelMainMenu = ModelMainMenuModel(
        iconData: iconData,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      const IconData newIconData = Icons.settings;
      void newOnPressed() {}

      const String newLabel = 'Option 2';
      const String newDescription = 'New Description';

      final ModelMainMenuModel copiedModelMainMenu = modelMainMenu.copyWith(
        iconData: newIconData,
        onPressed: newOnPressed,
        label: newLabel,
        description: newDescription,
      );

      expect(copiedModelMainMenu.iconData, equals(newIconData));
      expect(copiedModelMainMenu.onPressed, equals(newOnPressed));
      expect(copiedModelMainMenu.label, equals(newLabel));
      expect(copiedModelMainMenu.description, equals(newDescription));
      final ModelMainMenuModel copied2ModelMainMenu =
          copiedModelMainMenu.copyWith();
      expect(copied2ModelMainMenu, equals(copiedModelMainMenu));

      final ModelMainMenuModel identicalMainMenu = modelMainMenu.copyWith();
      expect(
        identicalMainMenu,
        equals(modelMainMenu),
      );
    });

    test('equality comparison returns true for equal instances', () {
      final ModelMainMenuModel modelMainMenu1 = ModelMainMenuModel(
        iconData: iconData,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      final ModelMainMenuModel modelMainMenu2 = ModelMainMenuModel(
        iconData: iconData,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      expect(modelMainMenu1 == modelMainMenu2, isTrue);
    });

    test('equality comparison returns false for different instances', () {
      final ModelMainMenuModel modelMainMenu1 = ModelMainMenuModel(
        iconData: iconData,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      final ModelMainMenuModel modelMainMenu2 = ModelMainMenuModel(
        iconData: Icons.settings,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      expect(modelMainMenu1 == modelMainMenu2, isFalse);
    });

    test('hashCode returns the correct value', () {
      final ModelMainMenuModel modelMainMenu = ModelMainMenuModel(
        iconData: iconData,
        onPressed: onPressed,
        label: label,
        description: description,
      );

      final int expectedHashCode = label.toLowerCase().hashCode;

      expect(modelMainMenu.hashCode, equals(expectedHashCode));
    });
  });
}
