import 'package:dub_tralers/models/trailer.dart';
import '_http_config.dart' as api;

class TrailerService {
  
  late String baseUrl = 'trailer';
  
  Future<Trailer> getTrailer(int id) async {
    final response = await api.Http.requestGet('$baseUrl/$id');

    if (response.statusCode == 200) {
      return Trailer.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to load trailer: ${response.statusCode}');
    }
  }

  Future<List<Trailer>> listTrailer() async {
    final response = await api.Http.requestGet('$baseUrl/');

    if (response.statusCode == 200) {
      return Trailer.fromJsonList(response.data);
    } 
    else {
      throw Exception('Failed to list trailer: ${response.statusCode}');
    }
  }
}
