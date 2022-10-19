import 'package:flutter/material.dart';
import 'package:segundoparcial/models/model_apod.dart';
import 'package:card_swiper/card_swiper.dart';



Widget ContentSwiper(List<ModelPictureOfDay> data){
  return Column(
    children: [
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(padding: EdgeInsets.only(top:10,left: 27.0,bottom: 7.0),
          child:Text("APOD FOR THE LAST MONTH", style: TextStyle(fontSize: 20,fontFamily: 'nasa3' ),textAlign: TextAlign.left,textDirection: TextDirection.ltr),
      ),),

      Container(
        width: double.maxFinite,
        height: 320.0,
        child: Swiper(
          autoplay: true, //se determina que se hara el paso automatico
          itemWidth: 300.0,
          autoplayDelay: 1500,//para pasar las imagenes automaticamente (segundos)
          curve: Curves.easeIn,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(data[index].url,fit: BoxFit.cover),
            );
          },
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      )
    ],

  );
}








