import 'package:trading_app/core/constants/network_path.dart';
import 'package:trading_app/core/dio_client/dio_client.dart';
import 'package:trading_app/features/home/data/model/post_model.dart';

class PostRepository {
  final DioClient dio = DioClient();

  Future<List<TradingPostModel>> getPosts() async {
    final response = await dio.get(NetworkPath.posts);

    final data = response.data;

    if (data is Map<String, dynamic>) {
      return data.entries.map((entry) {
        final postData = entry.value as Map<String, dynamic>;
        return TradingPostModel.fromJson(postData);
      }).toList();
    } else {
      throw Exception('Unexpected data format');
    }
  }
}
