import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:segundoparcial/models/model_apod.dart';

class PictureProvider{


  Future<List<ModelPictureOfDay>> getPicturesOfDay() async{
    final url="https://api.nasa.gov/planetary/apod?api_key=zMbEV4g645WllQVXqeAkBdV9tTkdFQz87TATq6Gf&end_date=2022-10-18&start_date=2022-09-16";
    final respuesta=await http.get(Uri.parse(url) ); //toma la url y se convierte en el formato que se necesita
    if (respuesta.statusCode==200){
      String body=utf8.decode(respuesta.bodyBytes);
      final jsonData=jsonDecode(body);
      final pictures=PictureOfDay.fromJsonList(jsonData);
      return pictures.items;
    }else{
      throw Exception("Ocurrio algo ${respuesta.statusCode}");
    }
  }
}