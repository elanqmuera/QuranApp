import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hidayah/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidayah/detail.dart';
import 'package:hidayah/models/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        initialData: [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) =>
                  _surahItem(context: context, surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(.35)
              ),
              itemCount: snapshot.data!.length);
        }));
  }

  Widget _surahItem({required Surah surah, required BuildContext context}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder:(context) => detail(noSurat: surah.nomor,),));
    },
    child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svgs/number.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                        child: Text(
                      '${surah.nomor}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 5, 70, 123)),
                    )),
                  )
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.namaLatin,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 5, 70, 123),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                    surah.tempatTurun.name,
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 126, 127, 129),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ), SizedBox(width: 4,),
                  Container(
                    width: 4, height: 4, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color.fromARGB(255, 126, 127, 129)),
                  ), SizedBox(width: 4,),
                    Text(
                    "${surah.jumlahAyat} Ayat",
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 126, 127, 129),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                    ],
                  )
                ],
              )),
              Text(
                surah.nama,
                style: GoogleFonts.amiri(color: Color.fromARGB(255, 5, 70, 123),fontSize: 20, fontWeight: FontWeight.bold ),
              ),
            ],
          ),
        ),
  );
}
