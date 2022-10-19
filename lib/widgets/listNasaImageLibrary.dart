import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:segundoparcial/models/model_imageLibrary.dart';
import '../pages/detail_page.dart';

List <Widget> listNasaImageLibrary(List<ModelNasaImageLibrary> data,context) {
  List<Widget> image = [];
  for (var item in data) {
    image.add(GestureDetector(//Un widget que detecta gestos.
      onTap: (){//si es tocado pasara lo de adentro
        Navigator.push(//El método push agregará una Route a la pila de rutas administradas por el Navigator
            context,
            MaterialPageRoute(
            builder: (context)=>DetailsPage(nasa:item), //envia la información que se necesita al widget
        )
        );
      },
      child: Container(
        height: 250,
        width: 250,
        child: Column(
          children: [
            ClipRRect(//Un widget que recorta a su hijo usando un rectángulo redondeado.
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(item.url,
                fit: BoxFit.cover,
                height: 140,
                width: 140,
              ),
            ),

            Text(item.title, style: GoogleFonts.openSans(fontSize: 10.0,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    )
    );
  }
  return image;
}
