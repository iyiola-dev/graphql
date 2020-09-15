import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graph/register.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Login extends StatelessWidget {
  String login() {
    return """
  mutation login( 
  \$email: String!, 
  \$password: String!, 
  ){
     login(data:{
      email : \$email
      password : \$password
      }){
  user{
    id
  }
  token
      
    }
   
  }
  """;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            child: Mutation(
                options: MutationOptions(
                  documentNode: gql(login()),
                  onCompleted: (data) {
                    print(data);
                  },
                  onError: (error) {
                    print(error.graphqlErrors[0]);
                  },
                ),
                builder: (runMutation, result) {
                  return Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HAGGLEX',
                              style: GoogleFonts.lato(
                                  color: Colors.blue[900],
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 70,
                          ),
                          TextFormField(
                            controller: emailController,
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
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.security),
                                hintText: 'password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
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
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                print(emailController.text);
                                runMutation({
                                  "data": {
                                    'email': emailController.text,
                                    'password': passwordController.text,
                                  }
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Register()));
                                },
                                child: Text(
                                  "Create one",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue[900]),
                                ),
                              )
                            ],
                          ),
                        ]),
                  );
                })),
      ),
    );
  }
}
