import 'package:segundoparcial/models/model_imageLibrary.dart';
import 'package:segundoparcial/widgets/listNasaImageLibrary.dart';
import 'package:flutter/material.dart';
import 'package:segundoparcial/models/model_apod.dart';
import 'SwiperPictureOfDay.dart';


Widget ContentFutureAPOD(ListPictureOfDay){
  return FutureBuilder(  //Future para cargar todas las imagenes al contenedor swiper
    future: ListPictureOfDay,
    builder: (context,Snapshot){

      if(Snapshot.hasData){
        return ContentSwiper(Snapshot.data as List<ModelPictureOfDay>);
      }else{
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white), //el color del simbolo de carga

          ),
        );
      }
    },
  );
}

Widget ContentFutureNASA(ListImageLibrary){
  return FutureBuilder( //futurebuilder para cargar las imagenes al grid
    future: ListImageLibrary,
    builder: (context,Snapshot){
      if(Snapshot.hasData){
        return SliverGrid( //SliverGrid coloca cada imagen en una posicion, funciona como un grid solo que este va dentro del Customscrollview
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(7.0),
                child: listNasaImageLibrary(Snapshot.data as List<ModelNasaImageLibrary>,context)[index],
              );
            },
            childCount:listNasaImageLibrary(Snapshot.data as List<ModelNasaImageLibrary>,context).length,
          ),
        );
      }else{
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                );
              }
          ),

        );
      }
    },
  );
}