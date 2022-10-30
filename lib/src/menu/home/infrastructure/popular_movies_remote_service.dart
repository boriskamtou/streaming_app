import 'package:dio/dio.dart';
import 'package:movie_app/src/core/infrastructure/api/dio_exceptions.dart';
import 'package:movie_app/src/core/infrastructure/api/remote_response.dart';
import 'package:movie_app/src/menu/core/infrastructure/movie_response_dto.dart';
import 'package:movie_app/src/menu/core/infrastructure/network_exception.dart';

import '../../../core/infrastructure/api/api.dart';

class PopularMoviesRemoteService {
  final Dio _dio;

  PopularMoviesRemoteService(this._dio);

  Future<RemoteResponse<MovieResponseDTO>> getPopularMovies() async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=${Api.apiKey}&language=en-US&page=1');

      if (response.statusCode == 200) {
        final datas = MovieResponseDTO.fromJson(response.data);

        return RemoteResponse.data(datas, maxPage: datas.totalPages);
      } else {
        throw RestApiException();
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw RestApiException(message: e.response!.data['status_message']);
      } else {
        throw DioException.fromDioError(e);
      }
    }
  }
}
