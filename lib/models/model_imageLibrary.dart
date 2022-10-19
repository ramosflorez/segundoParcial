class NasaImageLibrary{
  List<ModelNasaImageLibrary>items=[];
  NasaImageLibrary();
  NasaImageLibrary.fromJsonList(List<dynamic>jsonList){
    if(jsonList==null) return;

    for (var item in jsonList){
      final picture=ModelNasaImageLibrary.fromJsonMap(item);
      if(picture.mediaType!="video" ){
        items.add(picture);
      }
    }
  }
}

class ModelNasaImageLibrary{
  late String url;
  late String mediaType;
  late String title;
  late String date;
  late String description;
  ModelNasaImageLibrary(
      this.url,
      this.mediaType,
      this.title,
      this.date,

      this.description
      );
  ModelNasaImageLibrary.fromJsonMap(Map<String, dynamic> json){
    url=json['url'] ;
    mediaType=json['media_type'];
    title=json['title'];
    date=json['date'];
    description=json['explanation'];
  }
}
