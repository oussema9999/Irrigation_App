library dropdown_formfield;
import 'login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'menuPage.dart';

String dropdownValue = "Type d'utilisateur";

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool hidden1 = true;
  bool hidden2 = true;
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Inscription",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(56, 122, 76,10),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[

                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nom d'utilisateur" ,
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress ,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _controllerPassword,
                    obscureText: hidden1 ,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      suffixIcon: InkWell(
                        onTap: (){
                          hidden1 = !hidden1;
                          setState(() {

                          });

                        },
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    obscureText: hidden2 ,
                    decoration: InputDecoration(
                      labelText: 'Confirmez mot de passe',
                      suffixIcon: InkWell(
                        onTap: (){
                          hidden2 = !hidden2;
                          setState(() {

                          });

                        },
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide(
                            width: 5,
                            style: BorderStyle.none,
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: DropdownButton<String>(

                        value: dropdownValue,

                        items: <String>["Type d'utilisateur", 'Utilisateur normale', 'Administrateur']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 25,
                  ),

                ],
              ),
              _errorMessage(),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(

                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed:() {
                    createUserWithEmailAndPassword ;
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home()),);
                  },
                  color: Color.fromRGBO(56, 122, 76,10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Vous avez déjà un compte ?"),
                  InkWell(
                    onTap:(){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginPage()),
                      );
                    },
                    child: Text(
                      " Se connecter",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field

