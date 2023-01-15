import 'dart:ffi';

import 'package:flutter/material.dart';
import 'client.dart';




class node extends StatefulWidget {
  const node ({Key? key}) : super(key: key);
  @override
  State<node> createState() => _nodeState();
}

class _nodeState extends State<node>  {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Etats de Van",style: TextStyle(fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column (
        children: <Widget>[
          Expanded(
            child:Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children:<Widget> [
                  ListTile(
                    title: Text(
                      "Van1",
                      style:TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    trailing: Container(
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: clientTemperature(),
                      builder: (context, snapshot){
                        if (snapshot.hasData){
                        return ListTile(
                          title: Text(
                            "Température",
                            style:TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          trailing: Text(
                            "${snapshot.data[14]}",
                            style:TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        );}
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: clientPressure(),
                      builder: (context, snapshot ){
                        if (snapshot.hasData){
                          return ListTile(
                            title: Text(
                              "Pression",
                              style:TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            trailing: Text(
                              "${snapshot.data[14]}",
                              style:TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          );}
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: clientHumidity(),
                      builder: (context, snapshot ){
                        if (snapshot.hasData){
                          return ListTile(
                            title: Text(
                              "Humidité",
                              style:TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            trailing: Text(
                              "${snapshot.data[14]}",
                              style:TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          );}
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: clientHumidity(),
                      builder: (context, snapshot ){
                        if (snapshot.hasData){
                          return ListTile(
                            title: Text(
                              "Humidité(Sol)",
                              style:TextStyle(
                                fontSize: 25.0,
                              ),
                            ),
                            trailing: Text(
                              "${snapshot.data[14]}",
                              style:TextStyle(
                                fontSize: 30.0,
                              ),
                            ),
                          );}
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }
}