import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String register() {
    return """
  mutation Register( \$email: String!, 
  \$username: String!, 
  \$referralCode: String, 
  \$password: String!, 
  \$phonenumber: String!, 
  \$callingCode: String,
  \$flag: String,
  \$phoneNumber: String
  ){
     register(data:{
      email : \$email
      username : \$username,
      referralCode : \$referralCode,
      password : \$password
      phonenumber : \$phonenumber
      phoneNumberDetails: {     flag: \$flag
      phoneNumber: \$phoneNumber
      callingCode: \$callingCode}
      }){
  user{
    id
  }
  token
      
    }
   
  }
  """;
  }

  QueryResult result = QueryResult();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController userName = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber();
  final _formKey = GlobalKey<FormState>();
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
                  documentNode: gql(register()),
                  onCompleted: (data) {
                    print(data);
                  },
                  onError: (error) {
                    print(error.graphqlErrors[0]);
                  },
                ),
                builder: (RunMutation runMutation, QueryResult result) {
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
                          height: 50,
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
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: userName,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? 'please provide a valid username not less than 3'
                                : null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'UserName',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? 'please provide a valid password not less than 3'
                                : null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.security),
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: referralCode,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.link),
                              hintText: 'Refferal Code ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InternationalPhoneNumberInput(
                          autoValidate: true,
                          selectorConfig: SelectorConfig(
                              selectorType:
                                  PhoneInputSelectorType.BOTTOM_SHEET),
                          initialValue: PhoneNumber(isoCode: 'NG'),
                          onInputChanged: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          searchBoxDecoration:
                              InputDecoration(hintText: 'select countries'),
                          inputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState.validate()) {
                              print(emailController.text);
                              runMutation({
                                'email': emailController.text,
                                'username': userName.text.trim(),
                                'phonenumber': phoneNumber.phoneNumber,
                                'password': passwordController.text,
                                'referralCode': referralCode.text,
                                'callingCode': phoneNumber.dialCode,
                                'flag': phoneNumber.isoCode,
                                'phoneNumber': phoneNumber.phoneNumber
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
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
