import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, {required String text,} ) async {
    final snackbar = SnackBar(
      content: SizedBox(
        height: 70,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text( text, style: const TextStyle(fontSize: 16), ),
                ),
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
