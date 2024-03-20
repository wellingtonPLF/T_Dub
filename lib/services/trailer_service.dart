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

  Future<Trailer> postTrailer(Trailer trailer) async {
    final response = await api.Http.requestPost('$baseUrl/', trailer);

    if (response.statusCode == 200) {
      return Trailer.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to post trailer: ${response.statusCode}');
    }
  }

  Future<Trailer> updateTrailer(Trailer trailer) async {
    var id = trailer.getId();
    final response = await api.Http.requestUpdate('$baseUrl/$id', trailer);

    if (response.statusCode == 200) {
      return Trailer.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to update trailer: ${response.statusCode}');
    }
  }

  Future<Trailer> deleteTrailer(int id) async {
    final response = await api.Http.requestDelete('$baseUrl/$id');

    if (response.statusCode == 204) {
      return Trailer.fromJson(response.data);
    } 
    else {
      throw Exception('Failed to delete trailer: ${response.statusCode}');
    }
  }
}
