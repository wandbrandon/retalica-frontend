import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  final searches = ["appl", "gme", "jnj", "amc", "amd", "clsk", "ibm", "tsla"];

  final recentSearches = ["appl", "gme", "jnj", "amc", "amd"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : searches.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.account_balance_wallet),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style:
                TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey[400]))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}