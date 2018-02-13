import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Search GitHub Repositories';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: this.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var listTile = new ListTile(
      leading: new CircleAvatar(
        backgroundImage: new NetworkImage(
            'https://avatars3.githubusercontent.com/u/2193123?v=4'),
      ),
      title: const Text('Tomoya Shibata'),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new TextField(
          decoration: new InputDecoration(
            hintText: 'Search keyword...',
          ),
        ),
      ),
      body: new ListView.builder(
        padding: new EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
        itemExtent: 70.0,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) => listTile,
      ),
    );
  }
}
