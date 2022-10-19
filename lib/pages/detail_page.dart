import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/model_imageLibrary.dart';

class DetailsPage extends StatelessWidget{

  final ModelNasaImageLibrary nasa; //defino en una variable la clase

  const DetailsPage({Key? key,required this.nasa}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(nasa.title),
      ),
      body: ListView(//ListView es el widget de desplazamiento. Muestra a sus hijos uno tras otro en la dirección de desplazamiento.
        children: [
          Stack(//Un widget que coloca a sus hijos en relación con los bordes de su caja.
            children: <Widget>[
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Hero(//Volando una imagen De una pantalla a otra se llama animación hero. en Flutter, aunque el mismo movimiento a veces se denomina una transición del elemento compartido.
                  tag: nasa.date,//Tag es un widget que simplifica el proceso de creación de una etiqueta para cualquier widget dado. Simplemente pase la cadena de la etiqueta y el widget Tag colocará la etiqueta sobre el widget deseado.
                  child: Expanded(
                    child:FadeInImage.memoryNetwork(//mostrar un marcador de posición al principio, y las imágenes se desvanecerían a medida que se cargan,
                      placeholder: kTransparentImage,//arcador de posición transparente simple.
                      image: nasa.url,
                      fit: BoxFit.contain,)) ,
                  ),

            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(nasa.date, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Text(nasa.description,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1.0,),textAlign: TextAlign.justify,),
          )
        ],
      ),
    );
  }
}