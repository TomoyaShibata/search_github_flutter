import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_github_flutter/data/user.dart';
import 'package:search_github_flutter/data/users.dart';

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
  final GitHubApi gitHubApi = new GitHubApi();
  final List<User> _items = [];
  bool _isPending = false;

  void getUsers(String query) {
    if (query.isEmpty) {
      this.setState(() {
        this._items.clear();
      });
      return;
    }

    this.setState(() => this._isPending = true);

    this.gitHubApi.searchUsers(query).then((users) {
      this.setState(() {
        this._items.clear();
        this._items.addAll(users.items);
        this._isPending = false;
      });
    });
  }

  Widget getListTile(int index) => this._items.isEmpty
      ? new ListTile()
      : new ListTile(
          leading: new CircleAvatar(
            backgroundImage: new NetworkImage(this._items[index].avatarUrl),
          ),
          title: new Text(this._items[index].login),
        );

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new TextField(
            decoration: new InputDecoration(
              hintText: 'Search keyword...',
            ),
            onChanged: (text) => this.getUsers(text),
            onSubmitted: (text) => this.getUsers(text),
          ),
        ),
        body: new Column(
          children: <Widget>[
            this._isPending
                ? new LinearProgressIndicator()
                : new LinearProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.transparent),
                    backgroundColor: Colors.transparent,
                  ),
            new Expanded(
              child: this._items.isEmpty
                  ? new Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: new Text("no results"),
                    )
                  : new ListView.builder(
                      padding: new EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      itemExtent: 70.0,
                      itemCount: this._items.length,
                      itemBuilder: (BuildContext context, int index) =>
                          this.getListTile(index),
                    ),
            ),
          ],
        ),
      );
}

class GitHubApi {
  final String baseUrl = 'https://api.github.com/search';
  final Map<String, String> headers = {
    "Authorization": "bearer [token]",
  };

  Future<Users> searchUsers(String query) async {
    var response = await http.get(
      '${this.baseUrl}/users?q=$query',
      headers: this.headers,
    );
    return Users.fromJson(JSON.decode(response.body));
  }
}
