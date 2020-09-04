import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            Text(
              'Standard:',
              textAlign: TextAlign.start,
            ),
            RaisedButton(
              child: Text('showModalBottomSheet'),
              onPressed: () => _showStandardModalBottomSheet(context, false),
            ),
            RaisedButton(
              child: Text('showModalBottomSheet: FullScreen'),
              onPressed: () => _showStandardModalBottomSheet(context, true),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'Package: modal_bottom_sheet',
              textAlign: TextAlign.start,
            ),
            RaisedButton(
              child: Text('showCupertinoModalBottomSheet'),
              onPressed: () => _showCupertinoModalBottomSheet(context),
            ),
            FlatButton(
              child: Text('Go to next page >'),
              onPressed: () => _goToNextPage(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showStandardModalBottomSheet(
    BuildContext context,
    bool isScrollControlled,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      builder: (_) => SamplePage('Standard Modal Bottom Sheet'),
    );
  }

  void _showCupertinoModalBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (BuildContext context, ScrollController controller) =>
          SamplePage('Cupertino Modal Bottom Sheet'),
    );
  }

  void _goToNextPage(BuildContext context) {
    Navigator.of(context).push(
      //
      MaterialWithModalsPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: RaisedButton(
                child: Text('showCupertinoModalBottomSheet'),
                onPressed: () => _showCupertinoModalBottomSheet(context),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
