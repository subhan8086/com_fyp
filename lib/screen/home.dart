import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp_pro/Bloc/News_bloc.dart';
import 'package:fyp_pro/Bloc/news_event.dart';
import 'package:fyp_pro/Bloc/news_states.dart';
import 'package:fyp_pro/Model/categories_new_model.dart';
import 'package:fyp_pro/Model/news_channel_headlines_model.dart' as ChannelArticles show Articles;
import 'package:fyp_pro/Model/news_channel_headlines_model.dart';
 // Importing and renaming Articles class
import 'package:fyp_pro/news_view_model.dart';
import 'package:fyp_pro/screen/Add.dart';
import 'package:fyp_pro/screen/category.dart';
import 'package:fyp_pro/screen/favorite_news_provider.dart';
import 'package:fyp_pro/screen/fvrt.dart';
import 'package:fyp_pro/screen/login.dart';
import 'package:fyp_pro/screen/profile.dart';
import 'package:fyp_pro/widget/headlines_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

enum FilterList {
  bbcNews,
  aryNews,
  bleacher_report,
  reuters,
  cnn,
  buzzfeed,
}

class _homeState extends State<home> {
  NewsViewModel newsViewModel = NewsViewModel();
  FilterList? selectedMenu;
  String name = 'bbc-news';
////////share fun///////////////
  void shareNews(String title, String url) {
    Share.share('Check out this news: $title\n$url');
  }

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>()..add(FetchNewsChannelHeadlines('bbc-news'));
    context.read<NewsBloc>()..add(NewsCategories('general'));
  }

  void fetchNews(String channel) {
    context.read<NewsBloc>()..add(FetchNewsChannelHeadlines(channel));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: Tooltip(
          message: 'LogOut',
          child: IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
          ),
        ),
        title: Center(
          child: Text(
            'Home ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>>[
              PopupMenuItem<FilterList>(
                value: FilterList.bbcNews,
                child: Text(
                  'BBC News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    selectedMenu = FilterList.bbcNews;
                    fetchNews('bbc-news');
                  });
                },
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.aryNews,
                child: Text(
                  'Ary News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    selectedMenu = FilterList.aryNews;
                    fetchNews('ary-news');
                  });
                },
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.cnn,
                child: Text(
                  'Cnn News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    selectedMenu = FilterList.cnn;
                    fetchNews('cnn');
                  });
                },
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.buzzfeed,
                child: Text(
                  'Buzzfeed News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    selectedMenu = FilterList.buzzfeed;
                    fetchNews('buzzfeed');
                  });
                },
              ),
              PopupMenuItem<FilterList>(
                value: FilterList.bleacher_report,
                child: Text(
                  'Bleacher-Report News',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    selectedMenu = FilterList.bleacher_report;
                    fetchNews('bleacher-report');
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width,
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (BuildContext context, state) {
                switch (state.status) {
                  case Status.initial:
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  case Status.failure:
                    return Text(state.message.toString());
                  case Status.success:
                    return ListView.builder(
                      itemCount: state.newsList!.articles!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HeadlinesWidget(
                          index: index,
                          dateAndTime: " ",
                        );
                      },
                    );
                  default:
                    return Container();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (BuildContext context, state) {
                switch (state.categoriesStatus) {
                  case Status.initial:
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  case Status.failure:
                    return Text(state.categoriesMessage.toString());
                  case Status.success:
                    return ListView.builder(
                      itemCount: state.newsCategoriesList!.articles!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  state.newsCategoriesList!
                                      .articles![index].urlToImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                  height: height * .18,
                                  width: width * .3,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                            .expectedTotalBytes !=
                                            null
                                            ? loadingProgress
                                            .cumulativeBytesLoaded /
                                            loadingProgress
                                                .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception, StackTrace? stackTrace) {
                                    return Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: height * .18,
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              state.newsCategoriesList!
                                                  .articles![index].title
                                                  .toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
        //////////////////////////////////////////fvrt button//////////////////////////////////
                                          IconButton(
                                            icon: Icon(Icons.favorite),
                                            onPressed: () {
                                              final favoriteProvider = Provider.of<FavoriteNewsProvider>(context, listen: false);
                                              final article = state.newsCategoriesList!.articles![index];

                                              // Convert CategoryArticles to Articles if necessary
                                              final articleToAdd = convertToArticles(article);

                                              // Check if the article is already in favorites
                                              bool isFavorite = favoriteProvider.favoriteArticles.contains(articleToAdd);

                                              if (isFavorite) {
                                                favoriteProvider.removeFavorite(articleToAdd);
                                              } else {
                                                favoriteProvider.addFavorite(articleToAdd);
                                              }
                                            },
                                          ),

////////////share button/////////////////////////////////////////////////////
                                          IconButton(
                                            icon: Icon(Icons.share),
                                            onPressed: () {
                                              shareNews(
                                                  state.newsCategoriesList!
                                                      .articles![index].title
                                                      .toString(),
                                                  state.newsCategoriesList!
                                                      .articles![index].url
                                                      .toString());
                                            },
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              state.newsCategoriesList!
                                                  .articles![index].source!
                                                  .name
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  default:
                    return Container();
                }
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: Tooltip(
                  message: 'Home',
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home()));
                      },
                      child: Icon(Icons.home))),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                  message: 'Favorite',
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => fvrt()));
                      },
                      child: Icon(Icons.favorite))),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                  message: 'Add',
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => add()));
                      },
                      child: Icon(Icons.add))),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                  message: 'Category',
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => category()));
                      },
                      child: Icon(Icons.category_sharp))),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                  message: 'Profile',
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profile()));
                      },
                      child: Icon(Icons.person))),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
/////////////fvrt fun////////////////////////////////////
// Conversion function
Articles convertToArticles(CategoryArticles categoryArticle) {
  return Articles(
    title: categoryArticle.title,
    description: categoryArticle.description,
    url: categoryArticle.url,
    urlToImage: categoryArticle.urlToImage,
    // Add other necessary fields here
  );
}
const spinkit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50.0,
);
