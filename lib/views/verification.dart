import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graph/views/dashboard.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Verification extends StatelessWidget {
  String eror;
  String data;
  TextEditingController _verify = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String verify() {
    return """
  mutation verifyUser( 
 \$code: Int! 
  ){
     verifyUser(data:{
      code: \$code
      }){
  user{
    id
  }
  token
      
    }
   
  }
  """;
  }

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
            documentNode: gql(verify()),
            onCompleted: (data) {
              print(data);
            },
            onError: (error) {
              print(error);
            },
          ),
          builder: (runMutation, result) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter Verification Code to Proceed',
                      style: GoogleFonts.lato(
                          color: Colors.blue[900],
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  Container(
                    height: 20,
                    child: Text("$eror"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _verify,
                    obscureText: true,
                    validator: (val) {
                      return val.isEmpty
                          ? 'please provide a valid username not less than 3'
                          : null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintText: 'Verification code',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        runMutation({"code": int.parse(_verify.text)});
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
                          'Verify',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
