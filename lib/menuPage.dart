
import 'vane_list.dart';
import 'auth.dart';
import 'package:flutter/material.dart';
import 'package:irregation_appp/homePage.dart';
import 'map.dart';
import 'vane_list.dart';
import 'package:influxdb_client/api.dart';
import 'statistique.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(image:
          NetworkImage("https://images.pexels.com/photos/10616343/pexels-photo-10616343.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              fit:BoxFit.cover            )

      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Menu",style: TextStyle(fontSize: 30),),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(


                child: ElevatedButton(child: Text("Carte d'Irregation ",style: TextStyle(color: Colors.green,fontSize: 30,),),
                  onPressed: () {
                Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => OrderTrackingPage()),
                       );
                        },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,)
                ),
                height: 60,
                width: 350,
                margin: EdgeInsets.all(20),
              ),
              Container(
                child: ElevatedButton(child: Text("Liste de Vannes",style: TextStyle(color: Colors.green,fontSize: 30,),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (Vanelist())),
                      );

                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,)
                ),

                height: 60,
                width: 350,
                margin: EdgeInsets.all(20),
              ),
              Container(
                child: ElevatedButton(child: Text("Statistiques",style: TextStyle(color: Colors.green,fontSize: 30,),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => stat()),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,)
                ),
                height: 60,
                width: 350,
                margin: EdgeInsets.all(20),
              ),
              Container(
                child: ElevatedButton(child: Text("Déconnecter",style: TextStyle(color: Colors.green,fontSize: 30,),),
                    onPressed:signOut,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,)
                ),

                height: 60,
                width: 350,
                margin: EdgeInsets.all(20),
              ),

            ],
          ),
        ),


      ),
    );
  }
}
