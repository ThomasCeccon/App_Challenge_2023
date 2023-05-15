import 'package:flutter/material.dart' show AppBar, BuildContext, Builder, Color, Colors, FontWeight, Icon, IconButton, Icons, Navigator, Text;

import 'package:google_fonts/google_fonts.dart';

appBar(String goTo){
  if(goTo==" ")
  {
    return AppBar(
            centerTitle: true,
            backgroundColor: Colors.tealAccent.shade700,         
               title: Text(
              'MediRED',
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
  }
  else{
    return AppBar(
            centerTitle: true,
            backgroundColor: Colors.tealAccent.shade700,     
            automaticallyImplyLeading: false,
           /*
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/$goTo');
                      },
                    );
                  },
                ),
                */
            title: Text(
              'MediRED',
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
  }
}