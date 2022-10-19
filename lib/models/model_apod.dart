class PictureOfDay{
  List<ModelPictureOfDay>items=[]; //
  PictureOfDay();
  PictureOfDay.fromJsonList(List<dynamic>jsonList){
    if(jsonList==null) return;
    for (var item in jsonList){
      final picture=ModelPictureOfDay.fromJsonMap(item);
      if(picture.mediaType!="video" ){//si el tipo de media es video que no se agregue
        items.add(picture);
      }
    }
  }
}

class ModelPictureOfDay{
  late String mediaType;
  late String url;

  ModelPictureOfDay(
      this.mediaType,
      this.url
      );

  ModelPictureOfDay.fromJsonMap(Map<String, dynamic> json){//busca en el formato json y agrega a las variables su respectivo contenido
    mediaType=json['media_type'];
     url=json['url'] ;
  }
}
