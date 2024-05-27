import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class berita extends StatelessWidget {
  String gambar;
  String title;
  String nama;
  berita(
      {super.key,
      required this.gambar,
      required this.title,
      required this.nama});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 128,
            width: 345,
            color: Colors.amber,
            child: Image.asset(
              gambar,
              height: 128,
              width: 345,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 16,
          right: 16,
          child: SizedBox(
            height: 128,
            width: 345,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 99,
          left: 16,
          right: 16,
          child: SizedBox(
            height: 128,
            width: 345,
            child: Text(
              nama,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
