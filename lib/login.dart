import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graph/register.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('HAGGLEX',
                  style: GoogleFonts.lato(
                      color: Colors.blue[900],
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 70,
              ),
              TextFormField(
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)
                      ? null
                      : "Enter correct email";
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white))),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgotten password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      "Create one",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.blue[900]),
                    ),
                  )
                ],
              ),
            ])),
      ),
    );
  }
}
