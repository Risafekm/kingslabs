import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kingslabs/screens/dashboard/homescreen.dart';
import 'package:kingslabs/screens/login/widgets/custom_button.dart';
import 'package:kingslabs/screens/login/widgets/text_area.dart';
import 'package:kingslabs/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('group', () {
    testWidgets('login screen testing', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextArea).at(0), 'Risaf');
      await Future.delayed(Duration(seconds: 2));
      await tester.enterText(find.byType(TextArea).at(1), '41184118');
      await Future.delayed(Duration(seconds: 2));
      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 2));
      expect(find.byType(HomeScreen), findsOneWidget);
      await Future.delayed(Duration(seconds: 2));
    });
  });
}
