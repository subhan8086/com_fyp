import 'package:fyp_pro/Model/categories_new_model.dart';
import 'package:fyp_pro/Model/news_channel_headlines_model.dart';
import 'package:fyp_pro/Repositary.dart';



class NewsViewModel {
  final _repo = NewsRepository();
  Future<NewsChannelsHeadlinesModel> FetchNewsChannelApi(
      String channelName) async {
    final response = await _repo.fetchNewsChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> FetchCaterogyNewsApi(String category) async {
    final response = await _repo.fetchNewsCategoires(category);
    return response;
  }
}
