import 'package:flutter/material.dart';

class Mutquery {
  String register(String username, email, password, phonenumber, refferalCode,
      callingCode, flag) {
    return ("""
      mutation{
        register( email: "$email"
        username: "$username"
        password: "$password"
        phonenumber: "$phonenumber"
        referralCode: "$refferalCode"
        phoneNumberDetails: {
         phonenumber: "$phonenumber"
         callingCode: "$callingCode"
         flag: "$flag"

        }
        ){
          user{
            id
          }
          token
        }
      }
      """);
  }
}
