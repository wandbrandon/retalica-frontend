import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  final searches = ["appl", "gme", "jnj", "amc", "amd", "clsk", "ibm", "tsla"];

  final recentSearches = ["appl", "gme", "jnj", "amc", "amd"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty ? recentSearches : searches;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.account_balance_wallet),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
}
