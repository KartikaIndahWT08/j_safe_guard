import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../education/screen/education.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(153, 153, 153, 1), Colors.white])),
          ),
          leading: Image.asset(
            'lib/image/logo.png',
            height: 60,
          ),
          title: RichText(
            text: TextSpan(
                text: "Jember-",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: "Safe Guard",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 74, 173, 1)),
                  )
                ]),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  width: 800,
                  height: 300,
                  child: Image.asset(
                    'lib/image/edu1.png',
                    width: 900,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Education();
                        },
                      ));
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 245, 245, 2),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                  ),
                ),
                Positioned(
                  top: 219,
                  child: Container(
                    height: 90,
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 32, right: 34, top: 14),
                      child: Text(
                        "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 54,
                    width: 315,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://picsum.photos/id/237/200/300"),
                          radius: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Matt Villano")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 12),
                    child: const Text(
                        "Epilepsi adalah gangguan sistem saraf pusat (neurologis) di mana aktivitas otak menjadi tidak normal. Kondisi ini pun menyebabkan kejang atau periode perilaku yang tidak biasa dan terkadang kehilangan kesadaran.  Gejala kejang pada pengidap epilepsi dapat sangat bervariasi. Beberapa orang dengan epilepsi hanya menatap kosong selama beberapa detik selama kejang, sementara yang lain berulang kali menggerakkan lengan atau kaki. Memberikan pertolongan pertama pada kejang epilepsi sangat diperlukan untuk terhindar dari komplikasi ataupun cedera. Nah, informasi selengkapnya mengenai pertolongan pertama pada epilepsi bisa dibaca di sini! Jika kamu melihat seseorang mengalami kejang, ada beberapa pertolongan pertama yang bisa dilakukan, yaitu Anemia yang disebabkan oleh kurangnya sel darah merah atau sel darah merah yang tidak berfungsi di dalam tubuh. Ini menyebabkan aliran oksigen berkurang ke organ tubuh. Gejala dapat berupa kelelahan, kulit pucat, sesak napas, pusing, limbung, atau detak jantung cepat. Pengobatan tergantung pada diagnosis utama. Suplemen zat besi dapat digunakan untuk kekurangan zat besi. Suplemen vitamin B dapat digunakan untuk kadar vitamin rendah. Transfusi darah dapat digunakan untuk kehilangan darah. Obat untuk mendorong pembentukan darah dapat digunakan jika produksi darah tubuh berkurang."),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
