
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import './button.dart';
import 'dart:async';
//Este import me permite utilizar golocation, usar el GPS del telefono.
import 'package:geolocator/geolocator.dart';
import './question.dart';

// void main() => runApp(rumGuide());
int num=0;

void main(){

  runApp(rumGuide());

}


//All widgets are classes, needs ()
/*Text es widget tod o es widget!!!*/
class rumGuide extends StatefulWidget{

  @override
  rumGuideState createState() => rumGuideState();

//  @override
//  State<StatefulWidget> createState() {
//    // TO DO: implement createState
//    //devuelve un update de ui , i think
//    return rumGuideState();
//  }
}
// _rumGuideState hace que la clase sea privada.
//El underscore alfrente vuelve las cosas privadas.
 class rumGuideState extends State<rumGuide>{
  //Lo trae el dependency de google maps, Controla el widget de google maps.
   GoogleMapController mapController;
//Coordenadas de prueba.
   final LatLng _center = const LatLng(18.123200,-67.123200);

   //Esta funcion se llama cuando se crea el widget de Google Maps.
   //Nos da control sobre el widget.
   void onMapCreated(GoogleMapController controller) {
     mapController = controller;
   }


//Funcion asignada al boton de ubicacion.
   //Se encarga de asignar las coordenadas obtenidas del gps al
   //map view de google maps.
   //asyn quiere decir que la funcion puede que no responda al momento
   //De no responder devuelve una caja vacia y luego pone los datos
   Future<void> locateMe() async {
     //final GoogleMapController controller = await mapController.;
     //Se encarga de pedir el location y permiso de gps.
     //Geolocator es la clase que maneja el GPS

     //Location accuracy high me permite un min de 100m de accuracy en android.
     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //Imprimir position en el termino para prueba.
     print(position);
     print(position.latitude );
     //LatLng cord = LatLng(18.123123,-67.123123) ;
     LatLng gpsPosition = LatLng(position.latitude,position.longitude);
     // Crea una animacion que mueve la camara con un Zoom de 19.0 , a las coordenadas que provee el gps.
     mapController.animateCamera(CameraUpdate.newLatLngZoom(gpsPosition,19.0) );


   }
//Funcion de prueba, sin usa el GPS.
   static final CameraPosition myPos = CameraPosition(
     bearing: 192.833,
     target: LatLng(45.531563, -122.677433),
     tilt: 80.0,
     zoom: 14.0,
   );




//buidld se actualiza par de veces, no poner ariables aqui.
 @override
 Widget build(BuildContext context){
    return MaterialApp(
      //Scaffold basicamente es toda la applicacion.
      //La app se basa en widgets. to do es un widget.
      home: Scaffold(
        //Barra principal de la aplicacion.
        appBar: AppBar(
          title: Text(
            'rumGuide' , textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Cursive' ,fontSize: 30),) , backgroundColor: Color.fromRGBO(34,139,34, 50), )  ,
        //Stack me permite colocar widgets uno encima del otro.
          body: Stack(
          children: <Widget>[
            //My Location Enable, habillita el punto de localizacion azul, es basado en el gps del telefono.
            //MyLocationButtonEnable, me permte usar mi propio boton de ubicar al usuario.

        GoogleMap(myLocationEnabled: true,
            myLocationButtonEnabled: false,
            //Trae el mapa de Google Maps
            onMapCreated: onMapCreated,
            //Esatblesco una vista predeterminada para cuando comience el app.
            initialCameraPosition: CameraPosition(
              target: _center,
              //A mayor zoom mas de cerca se ve.
              zoom: 15.0,
            )
        ),

        Align(
          alignment: Alignment.bottomRight,
            child:
          Padding(
          padding: EdgeInsets.all(10.0),
          child: //Container(color: Colors.green ,height: 120, child:
            Button(locateMe, Icons.location_searching),
//          Align(
//            alignment: FractionalOffset.bottomRight, //widthFactor: 720,
//            //heightFactor: 1000,
//            child: Column(
//              children: <Widget>[
//               //RaisedButton( child: Text('Algo'), color: Colors.white,),
//
//                Button(locateMe, Icons.location_searching),
//                //Container( color: Colors.black, height: 200,)
//                //TextFormField()
//
//              ],
//            ),
//          ),
          //)
        )
        ),

            Align(
              // x=-1 extrema izquirda, 0 centro, 1 extrema derecha, "y" de arriba a abajo (x,y).
              alignment: Alignment(1,0)  ,
              child: Button(null, Icons.adb)
            )
          ]

        )
          //Column(
//          children: [
////            Question( '$num'),
////            RaisedButton(
////              child: Text('OKKK 1'),
////              //NO USAR PARENTESIS PARA AGREGAR UNA FUNCIONALIDAD
////              //pasar solo el nombre de la funcion
////              onPressed: answerQuestion,
////            ),
////            RaisedButton(
////                child:
////                Text('Contestacion 2'),
////                //Otro metodo
////                onPressed: () {print('opcion 2'); }),
////            RaisedButton(
////              child: Text(' opcion 3'),
////              onPressed: (){
////                print(num);
////                num =num+1 ;} ,
////            ),
//
//          ],
//        ),

    ),
    );
  }
}