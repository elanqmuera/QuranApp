import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidayah/layout.dart';
import 'package:hidayah/tabs/hijb_tab.dart';
import 'package:hidayah/tabs/page_tab.dart';
import 'package:hidayah/tabs/para_tab.dart';
import 'package:hidayah/tabs/surah_tab.dart';

class beranda extends StatelessWidget {
  const beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: _appBar(),
      bottomNavigationBar: _BottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _Greeating(),
                    ),
                    SliverAppBar(
                      shape: Border(
                          bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.1), width: 3)),
                      pinned: true,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(0), child: _Tab()),
                    )
                  ],
              body: const TabBarView(
                  children: [SurahTab(), ParaTab(), PageTab(), HijbTab()])),
        ),
      ),
    );
  }

  TabBar _Tab() {
    return TabBar(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      indicatorWeight: 3,
      tabs: [
        _tabItem(label: 'Surah'),
        _tabItem(label: 'Para'),
        _tabItem(label: 'Page'),
        _tabItem(label: 'Hijb'),
      ],
    );
  }

  Tab _tabItem({required String label}) => Tab(
        child: Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  Column _Greeating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 123, 255)),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          child: _lastRead(),
        )
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: SizeConfig.blockVertical! * 20,
          width: SizeConfig.blockHorizontal! * 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.2,
                  0.8,
                ],
                colors: [
                  Color.fromARGB(255, 23, 82, 199),
                  Color.fromARGB(255, 10, 209, 236),
                ],
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Image.asset('assets/img/quran2.png',
                  opacity: AlwaysStoppedAnimation(.2))),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/book.svg'),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Last Read',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text('Al - Fatihah',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 4,
                ),
                Text('Ayat No : 1',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  AppBar _appBar() => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            IconButton(
                onPressed: (() => {}),
                icon: SvgPicture.asset('assets/svgs/strip.svg')),
            SizedBox(
              width: 20,
            ),
            Text('Quran App',
                style: GoogleFonts.julee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 123, 255))),
            const Spacer(),
            IconButton(
                onPressed: (() => {}),
                icon: SvgPicture.asset('assets/svgs/search.svg')),
          ],
        ),
      );
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _ButtomBarItem(icon: 'assets/svgs/home_quran.svg', label: 'Quran'),
        _ButtomBarItem(icon: 'assets/svgs/lampu.svg', label: 'Tips'),
        _ButtomBarItem(icon: 'assets/svgs/berdoa.svg', label: 'Sholat'),
        _ButtomBarItem(icon: 'assets/svgs/tangan_doa.svg', label: 'Berdoa'),
        _ButtomBarItem(icon: 'assets/svgs/favorite.svg', label: 'Catatan'),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
    );
  }

  BottomNavigationBarItem _ButtomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon:
              SvgPicture.asset(icon, color: Color.fromARGB(255, 117, 117, 117)),
          activeIcon: SvgPicture.asset(
            icon,
            color: Colors.blue,
          ),
          label: label);
}
