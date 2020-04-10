
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
  //Lo trae el dependenci de google maps
   GoogleMapController mapController;

   final LatLng _center = const LatLng(18.123200,-67.123200);

   void onMapCreated(GoogleMapController controller) {
     mapController = controller;
   }

   Future<void> locateMe() async {
     //final GoogleMapController controller = await mapController.;
     //Se encarga de pedir el location y permiso de gps.
     //Geolocator es la clase que maneja el GPS
     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     print(position);
     print(position.latitude );
     //LatLng cord = LatLng(18.123123,-67.123123) ;
     LatLng gpsPosition = LatLng(position.latitude,position.longitude);
     mapController.animateCamera(CameraUpdate.newLatLngZoom(gpsPosition,14.0) );
   }

   static final CameraPosition myPos = CameraPosition(
     bearing: 192.833,
     target: LatLng(45.531563, -122.677433),
     tilt: 80.0,
     zoom: 14.0,
   );


//  void answerQuestion(){
//    // Set state actualiza el widget, llamando a build. Hace re render.
//    //en este casollama al widget build
//    //hace re render a lo que haya cambiado solamente
//    //flutter se encarga de eso.
//    setState(() {
//      num=num+1;
//    });
//    print('Seleccion escogida');
//  }

//buidld se actualiza par de veces, no poner ariables aqui.
 @override
 Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'rumGuide' , textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Cursive' ,fontSize: 30),) , backgroundColor: Color.fromRGBO(34,139,34, 50), )  ,
        body: Stack(
          children: <Widget>[
        GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            )),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: <Widget>[
                RaisedButton( child: Text('Algo'),),

                Button(locateMe, Icons.location_searching)

              ],
            ),
          ),
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

    ),);
  }
}