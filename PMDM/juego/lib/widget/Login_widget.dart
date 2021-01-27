import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Controller/LoginController.dart';

import '../views/Route_selection_view.dart';

import '../views/Register_view.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({Key key}) : super(key: key);
  _WidgetLogin createState() => _WidgetLogin();
}

class _WidgetLogin extends State<WidgetLogin> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            width: 350,
            child: Column(
              children: [
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email:",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey[850].withOpacity(0.7),
                    filled: true,
                    hintText: 'platano@gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password:",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey[850].withOpacity(0.7),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await login(emailcontroller.text, passwordcontroller.text)
                        .then((value) {
                      if (value == true) {
                        print(value);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RouteSelection(),
                          ),
                        );
                      }
                    });
                  },
                  child: Text('Iniciar Sesión'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text('No tengo cuenta'),
                ),
              ],
            ),
          ),
          Text("Recuperar contraseña")
        ],
      ),
    );
  }
}
