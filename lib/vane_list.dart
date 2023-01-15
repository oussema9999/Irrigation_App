import 'test.dart';
import 'package:flutter/material.dart';
import 'package:irregation_appp/homePage.dart';
import 'package:irregation_appp/van.dart';
import 'map.dart';
import 'side.dart';

import 'package:influxdb_client/api.dart';

import 'client.dart';

class Vanelist extends StatefulWidget {
  const Vanelist({Key? key}) : super(key: key);

  @override
  State<Vanelist> createState() => _VanelistState();
}

class _VanelistState extends State<Vanelist> {
  List but=   [true, true ,true ,true ,true , true,true,true];
  @override
  Widget build(BuildContext context) {
    List <Widget> buttons=[
      InkWell(
        onTap:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>node()),
          );
        },
        child: Container(
          alignment: Alignment.center,

          child: Text( "Van 1",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 2",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 3",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 4",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 5",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 6",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 7",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),
      InkWell(
        onTap:(){},
        child: Container(
          alignment: Alignment.center,

          child: Text("Van 8",style: TextStyle(color: Colors.green,fontSize: 30,),),

          height: 60,
          width: 350,

          margin: EdgeInsets.all(20),
        ),
      ),

    ];
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Vans list",style: TextStyle(fontSize: 30),),
          centerTitle: true,
          backgroundColor: Colors.green
      ),
      body:

      ListView.builder(
          itemCount:buttons.length,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5,
                    color:Colors.grey ,),

                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child:buttons[index])
                  ,

                  Switch(

                      value: but[index],
                      onChanged: (value)
                      {
                        setState((){
                          but[index]=value;
                        });


                      }
                  )


                ],
              ),
              height: 100,


            );
          }),




    );


  }
}
