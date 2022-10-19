import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:segundoparcial/models/model_imageLibrary.dart';


class ImageLibraryProvider{
  Future<List<ModelNasaImageLibrary>> getNasaImageLibrary() async{
    final url="https://api.nasa.gov/planetary/apod?api_key=zMbEV4g645WllQVXqeAkBdV9tTkdFQz87TATq6Gf&count=24";
    final respuesta=await http.get(Uri.parse(url) );
    if (respuesta.statusCode==200){
      String body=utf8.decode(respuesta.bodyBytes);
      final jsonData=jsonDecode(body);
      final pictures=NasaImageLibrary.fromJsonList(jsonData);
      return pictures.items;
    }else{
      throw Exception("Ocurrio algo ${respuesta.statusCode}");
    }
  }
}