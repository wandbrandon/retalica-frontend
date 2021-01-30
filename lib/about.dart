import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'lib/assets/retalica_small.png',
            color: Colors.white,
            isAntiAlias: true,
          ),
        ),
        leadingWidth: 50,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('About Retalica'),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(),
                  child: Text(
                    "About Retalica",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "A retail traders best friend and closest advisor",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "The rise of retail trading",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        "Retail investors own 77% of the market capitalization in total via stocks; however, just under half of all households still have no exposure to the stock market. This mean that the majority of investments by retail traders are held by the wealthy. There has been a recent trend, with the advent of interactive trade brokers, of increase retail trading activity and trade volume. Today, markets are in shift with more retail investors entering the market, but several papers have noted that retail traders receive large losses and less than 5% of traders make money. Despite all this, this year has been unprecedented for retail, where they have destabilized the market and are breaking trends. The fields may be stacked against the retail trader, but with the right knowledge and experience a retail trader can still prevail on top of wall street. ")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "The need to stay in the loop",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        "Our world is more interconnected then ever and this has drasticly speed-up the news cycle. Successful decision-making is based on having reliable data and profitable trades are founded on quick reaction to the data. Social media has now opened the door for a quicker, more efficient way of collecting data for investor judgment. GameStop(GME) stock is a great example of this phenomena where those in the know of reddit made million weeks before traditional news sites broke the story. Quantifying public interest in a stock along with their reaction to it can drastically influence what investments to make and when, potentially earning you millions. "),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "What retalica does for you",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        "An opensource web app that allows users to review stocks against social media. Our algorithms scraps through these outlets and collimates the volume of discussion around the company and the interest/sentiment for the company. With markets moving more and more on speculation, having your finger on the pulse makes sure that you don’t miss your opportunity to invest. A study by Indiana University found that by measuring sentiment on twitter alone, one can predict market movement three days later 86.7% of the time. This can be the edge retail investors need to fight toe-to-toe with the billionaires on wall street and turn the market for the people rather than for profit. "),
                  ],
                ),
              ],
            )),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
