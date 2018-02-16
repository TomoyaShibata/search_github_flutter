import 'package:search_github_flutter/data/user.dart';

class Users {
  final int totalCount;
  final bool incompleteResults;
  final List<User> items;

  Users(this.totalCount, this.incompleteResults, this.items);

  static Users fromJson(Map<String, dynamic> json) => new Users(
        json['total_count'],
        json['incomplete_results'],
        json['items'] != null
            ? json['items'].map((item) => new User.fromJson(item)).toList()
            : [],
      );
}
