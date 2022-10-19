import 'package:segundoparcial/models/model_apod.dart';
import 'package:flutter/material.dart';
import 'package:segundoparcial/models/model_imageLibrary.dart';

import 'package:segundoparcial/providers/pictureofday_provider.dart';
import 'package:segundoparcial/widgets/Futures.dart';
import '../providers/imagelibrary_provider.dart';



class MyHomeApp extends StatefulWidget{
  final String title;
  const MyHomeApp({Key? key, required this.title}): super(key: key);

  State<StatefulWidget> createState()=>_myHomePage_state();
}
class _myHomePage_state extends State<MyHomeApp> {

  late Future<List<ModelPictureOfDay>> ListPictureOfDay;
  late Future<List<ModelNasaImageLibrary>> ListImageLibrary;
  final ScrollController _scrollController = ScrollController();
  bool visibilidad=false;

  @override
  void initState() {
    super.initState();
    final getProvider1 = PictureProvider();
    ListPictureOfDay = getProvider1.getPicturesOfDay();
    final getProvider2 =ImageLibraryProvider();
    ListImageLibrary=getProvider2.getNasaImageLibrary();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==_scrollController.position.maxScrollExtent) { //se evalua si el Scroll se encuentra al final y si es asi que sea visible
        setState(() {
          visibilidad=true;
        });
      }
      if (_scrollController.position.pixels !=_scrollController.position.maxScrollExtent) {
        setState(() {
          visibilidad=false;
        });
      }

    });

  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(
          title: Text(widget.title,style: TextStyle(fontFamily: 'nasa',fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white)),
          elevation: 16.0,
          centerTitle: true,
          ),
        body: CustomScrollView( //permite proporcionar fragmentos directamente para crear varios efectos de desplazamiento, como listas, cuadrículas y encabezados desplegables.
          physics: const ClampingScrollPhysics(),  // Eliminar la física del rebote, evita que el scroll se devuelva cuando llega al final
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(//es un fragmento básico que crea un puente de regreso a uno de los widgets habituales basados en cajas.
                child: ContentFutureAPOD(ListPictureOfDay)//se llama a la funcion (Swiper)
            ),
            const SliverToBoxAdapter(
              child:Align( //alinea los elementos que se encuentran dentro de el
                alignment: Alignment.topLeft,
                child: Padding(padding: EdgeInsets.only(top:10,left: 27.0),//reduce las restricciones según el relleno dado, lo que hace que el elemento secundario tenga un tamaño más pequeño.
                    child:Text("Nasa Library", style: TextStyle(fontSize: 20, fontFamily: 'nasa3'),textAlign: TextAlign.left,textDirection: TextDirection.ltr,),),
              ),
            ),


            ContentFutureNASA(ListImageLibrary)//se llama al widget que contiene el SliverGrid


          ],
        ),
      floatingActionButton: Stack(//Esta clase es útil si desea superponer varios elementos secundarios de forma sencilla
        children: <Widget> [
          Padding(padding: EdgeInsets.only(left:31),
            child: Align(
            alignment: Alignment.bottomLeft,
             child: FloatingActionButton(//boton flotante
                  child: Icon(Icons.vertical_align_top_sharp),
                  onPressed: (){
                    BackTop();
                  },
                ),
          ),),
          Align(
            alignment: Alignment.bottomRight,
            child: Visibility(
                visible: visibilidad,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: (){
                    ImageNasaInfinity();
                  },
                )),
          ),
        ],
      ),
    );
  }
  void ImageNasaInfinity() {
    final provider = ImageLibraryProvider();
    provider.getNasaImageLibrary().then((nuevosvalores){
      setState(() {
        ListImageLibrary.then((valores) => valores.addAll(nuevosvalores));// se añaden los nuevos valores a los viejos
      });
    });
  }
  void BackTop(){
    const double start=0;
    _scrollController.jumpTo(start);// se devulve al inicio del scroll
  }
}



