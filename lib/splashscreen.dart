import 'package:flutter/material.dart';
import 'package:hidayah/beranda.dart';
import 'package:hidayah/layout.dart';
import 'package:google_fonts/google_fonts.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.2,
            0.7,
          ],
          colors: [
            Color(0xff023290),
            Color(0XFF00E0FF),
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Quran App',
                  style: GoogleFonts.julee(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Container(
                  child: Text(
                'Bacalah Quran Setiap Hari',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: SizeConfig.blockHorizontal! * 80,
                height: SizeConfig.blockVertical! * 45,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                       
                        children: [
                          Image(width: double.infinity,
                            image: AssetImage('assets/img/quran2.png'),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                               onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => beranda()));
                            },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 16),
                                decoration: BoxDecoration(
                                    color: Color(0xff023290),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Positioned(
                    //   left: 0,
                    //   right: 0,
                    //   bottom: 10,
                    //   child: Center(
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.of(context).push(MaterialPageRoute(
                    //             builder: (context) => beranda()));
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 40, vertical: 16),
                    //         decoration: BoxDecoration(
                    //             color: Color(0xff023290),
                    //             borderRadius: BorderRadius.circular(30)),
                    //         child: Text(
                    //           'Get Started',
                    //           style: TextStyle(
                    //               fontSize: 22,
                    //               fontWeight: FontWeight.w500,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
