import 'package:flutter/material.dart';
import 'vane_list.dart';
import 'statistique.dart';
import 'map.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_register_page.dart';
import 'menuPage.dart';


class NavBar extends StatelessWidget {

  NavBar({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  dynamic user;
  String userEmail='';


 Future  <void>  getCurrentUserInfo() async {
    user =  _auth.currentUser ;
    return user.email;

  }


  Future<void> signOut() async {
    await Auth().signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("oussema"),
              accountEmail: Text("oussema.louhichi999@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.usda.gov%2Fmedia%2Fblog%2F2017%2F12%2F13%2Ffarmers-keeping-nutrients-field-out-streams&psig=AOvVaw3Sw_-7XRtdJDGcOhOmqr_c&ust=1673620994687000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPi0x5iiwvwCFQAAAAAdAAAAABAE",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(56, 122, 76,10),

            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Accueil ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){
              Navigator.push(context,

                MaterialPageRoute(builder: (context)=>Home()),);

            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text(
              "Carte d'irrigation ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
            ),
            onTap: (){


            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              "Liste de Vannes  ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Vanelist()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pending),
            title: Text(
              "Statistiques ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){
              Navigator.push(context,

                MaterialPageRoute(builder: (context)=>stat()),);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Paramétres",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              "Déconnecter ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap:(){
            signOut;
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>LoginPage()),);
            }
          ),

        ],
      ),

    );
  }
}
