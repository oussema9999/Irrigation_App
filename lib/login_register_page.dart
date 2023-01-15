import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'inscrire.dart';
import 'menuPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool hidden =true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

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


  Widget _entryField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: hidden,
      controller: controller,

    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
      isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.6),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Bienvenue",
              style: TextStyle(color: Colors.black, fontSize: 44.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress ,
              decoration: InputDecoration(
                hintText: "Nom d'utilisateur ou e-mail",
                prefixIcon: Icon(Icons.supervised_user_circle,color:Colors.black),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller: _controllerPassword,
              obscureText: hidden ,
              decoration: InputDecoration(
                hintText: "Mot de passe",
                prefixIcon: Icon(Icons.lock,color:Colors.black),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    Icons.visibility,
                  ),
                ),
              ),
            ),
            _errorMessage(),
            const SizedBox(
              height: 44.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Color.fromRGBO(56, 122, 76,10),
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: (){
                  signInWithEmailAndPassword ;
                  Navigator.push(context,

                    MaterialPageRoute(builder: (context)=>Home()),
                  );
                },
                child:Text("Se connecter",
                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 18.0,
                    )),
              ),
            ),
            const SizedBox(
              height: 28.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor:Color.fromRGBO(56, 122, 76,10),
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Signup()),
                  );
                },
                child:Text("S'inscrire",
                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 18.0,
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Mot de passe "),
                InkWell(
                  onTap:(){},
                  child: Text(
                    " oublié ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                Text("? "),
              ],
            ),
            SizedBox(
              height: 25,
            ),

          ],
        ),
      ),
    );


  }
  void _togglePasswordView(){
    hidden = !hidden;
    setState(() {

    });

  }
}
