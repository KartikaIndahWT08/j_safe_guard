import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class news extends StatelessWidget {
  String gambar;
  String title;
  String nama;
  String deskripsi;
  news(
      {super.key,
      required this.gambar,
      required this.title,
      required this.nama,
      required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 240,
            width: 344,
            color: Colors.amber,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              child: Image.asset(
                gambar,
                height: 240,
                width: 344,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 16,
          right: 36,
          child: SizedBox(
            height: 128,
            width: 345,
            child: Text(
              nama,
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 95,
          left: 16,
          right: 39,
          child: SizedBox(
            height: 128,
            width: 345,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 186,
          left: 16,
          right: 8,
          child: SizedBox(
            height: 128,
            width: 345,
            child: Text(
              deskripsi,
              style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
