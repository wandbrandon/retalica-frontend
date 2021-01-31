import 'package:flutter/material.dart';
import 'package:retalica/services/finnhub_service.dart';
import 'package:retalica/stock_info/widgets/stock_page.dart';

class Search extends SearchDelegate<String> {
  final searches = ["AAL", "GME", "JNJ", "AAPL", "AMD", "PG", "IBM", "TSLA"];
  final recentSearches = [];
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

    //loading screen
    return FutureBuilder(
      future: fetchFinnHubResponse(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return StockPage(stock: snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
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
