import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Verification Code to Proceed',
                style: GoogleFonts.lato(
                    color: Colors.blue[900],
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              obscureText: true,
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
            Container(
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
          ],
        ),
      ),
    ));
  }
}
