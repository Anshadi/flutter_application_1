import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator Veiw Test", () {
  testWidgets("Calculator Test", (WidgetTester tester) async {
    await tester
        .pumpWidget(const MyApp()); //to trigger my app behind i.e pumped my app

    expect(find.byKey(const Key("Result")), findsOneWidget);
    expect(find.byKey(const Key("displaytwo")), findsOneWidget);
    expect(find.byKey(const Key("displayone")), findsOneWidget);

    //now we have to make the same things for our four icons

    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

  });

    testWidgets("opeartions test", (WidgetTester tester) async{
      await tester.pumpWidget(const MyApp());//have to again pump the app as  new test

    //now we can extract a widget too
    await tester.enterText(find.byKey(const Key("displayone")), "20");
    await tester.enterText(find.byKey(const Key("displaytwo")), "10");

    await tester.tap(find.byIcon(CupertinoIcons.add));//.tap will tell what do on tapping that icon
    await tester.pump();//to rebuild the frame

    expect(find.text("30"),findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.minus));//.tap will tell what do on tapping that icon
    await tester.pump();//to rebuild the frame

    expect(find.text("10"),findsNWidgets(2));//as it gets two 10 widgets because our one input is also 10

    await tester.tap(find.byIcon(CupertinoIcons.multiply));//.tap will tell what do on tapping that icon
    await tester.pump();//to rebuild the frame

    expect(find.text("200"),findsOneWidget);

    await tester.tap(find.byIcon(CupertinoIcons.divide));//.tap will tell what do on tapping that icon
    await tester.pump();//to rebuild the frame

    expect(find.text("2.0"),findsOneWidget);//it won,t be 2




    // final d1 = find.byKey(const Key("diplayone"));
    //  // ignore: unused_local_variable
    //  final d2 = find.byKey(const Key("diplaytwo"));   //it returns a  key_finder
    //  print(d1);

    //expect(find.byType(Container), findsOneWidget);
    //it finds only one widget and it finds container
    //expect(find.text("Hello World"), findsOneWidget);
    //to find wether the text is written in our file or not if not then it fails the text
  });
  });
}
