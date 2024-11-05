import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, {required String text,} ) async {
    final snackbar = SnackBar(
      content: SizedBox(
        height: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 22, 114, 25),), ),
              ),
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent, 
      duration: const Duration(milliseconds: 1200),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
