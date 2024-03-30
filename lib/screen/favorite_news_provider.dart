import 'package:flutter/material.dart';
import 'package:fyp_pro/Model/news_channel_headlines_model.dart';

class FavoriteNewsProvider extends ChangeNotifier {
  List<Articles> _favoriteArticles = [];

  List<Articles> get favoriteArticles => _favoriteArticles;

  void addFavorite(Articles article) {
    _favoriteArticles.add(article);
    notifyListeners();
  }

  void removeFavorite(Articles article) {
    _favoriteArticles.remove(article);
    notifyListeners();
  }
}
