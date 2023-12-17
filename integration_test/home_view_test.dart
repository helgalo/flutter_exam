import 'package:flutter/material.dart';
import 'package:flutter_exam/main.dart';
import 'package:flutter_exam/screens/home_screen.dart';
import 'package:flutter_exam/views/home/widgets/text_data_widget.dart';
import 'package:flutter_exam/widgets/alert_dialog_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Widget buildWidget({Map<String, dynamic>? argumentsScreen}) => MaterialApp(
        title: "Flutter Exam",
        navigatorKey: navigationApp,
        home: const HomeScreen(),
      );

  Finder keyFinder(String key) => find.byKey(Key(key));

  setUpAll(
    () async => {
      await SharedPreferences.getInstance(),
      SharedPreferences.setMockInitialValues(
        {
          "items": [
            "data0",
            "data1",
          ]
        },
      ),
    },
  );

  testWidgets(
    "Should find the home structure working with some text data",
    (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.pumpAndSettle();

      expect(keyFinder("inputField"), findsOneWidget);

      expect(find.byType(TextDataWidget), findsNWidgets(2));
      expect(keyFinder("textData0"), findsOneWidget);
      expect(keyFinder("textData1"), findsOneWidget);
    },
  );

  testWidgets(
    "Should show the first data on inputText when tap on the edit button of the first text and edit when change the text on the inputText and press enter",
    (WidgetTester tester) async {
      Finder editButtonFinder = find.descendant(
          of: keyFinder("textData0"), matching: keyFinder("editButton"));
      Finder inputFieldWithDataFinder = find.descendant(
          of: keyFinder("inputField"), matching: find.text("data0"));

      await tester.pumpWidget(buildWidget());
      await tester.pumpAndSettle();

      expect(keyFinder("inputField"), findsOneWidget);
      expect(keyFinder("textData0"), findsOneWidget);
      expect(editButtonFinder, findsOneWidget);
      expect(inputFieldWithDataFinder, findsNothing);

      await tester.tap(editButtonFinder);
      await tester.pumpAndSettle();

      expect(inputFieldWithDataFinder, findsOneWidget);

      await tester.enterText(keyFinder("inputField"), "edditedData");
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(
          find.descendant(
              of: keyFinder("textData0"), matching: find.text("edditedData")),
          findsOneWidget);
    },
  );

  testWidgets(
    "Should remove the first data when tap on her remove button and confirm rthe action on alert dialog",
    (WidgetTester tester) async {
      Finder removeButtonFinder = find.descendant(
          of: keyFinder("textData0"), matching: keyFinder("removeButton"));

      Finder data0Finder = find.descendant(
          of: find.byType(TextDataWidget), matching: find.text("data0"));

      await tester.pumpWidget(buildWidget());
      await tester.pumpAndSettle();
      expect(data0Finder, findsOneWidget);

      expect(keyFinder("textData0"), findsOneWidget);
      expect(removeButtonFinder, findsOneWidget);
      expect(find.byType(AlertDialogWidget), findsNothing);

      await tester.tap(removeButtonFinder);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialogWidget), findsOneWidget);

      await tester.tap(find.text("Confirmar"));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialogWidget), findsNothing);

      expect(data0Finder, findsNothing);
    },
  );
}
