import 'package:flutter/material.dart';
import 'package:fyp_pro/screen/favorite_news_provider.dart';
import 'package:fyp_pro/screen/home.dart';
import 'package:provider/provider.dart';

class fvrt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
          },
        ),
        title: Center(
          child: Text('Favorite ', style: TextStyle(color: Colors.white),),
        ),
      ),
      body: Consumer<FavoriteNewsProvider>(
        builder: (context, favoriteProvider, _) {
          return ListView.builder(
            itemCount: favoriteProvider.favoriteArticles.length,
            itemBuilder: (context, index) {
              final article = favoriteProvider.favoriteArticles[index];
              return ListTile(
                title: Text(article.title ?? ''), // Handle nullable string
                subtitle: Image.network(article.urlToImage ?? ''), // Display image if available
              );
            },
          );
        },
      ),
    );
  }
}
