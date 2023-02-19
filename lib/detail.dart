import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hidayah/models/surah.dart';

class detail extends StatelessWidget {
  final int noSurat;
  const detail({super.key, required this.noSurat});

  Future<Surah> _getDetail() async {
    var data = await Dio().get('https://equran.id/api/surat/$noSurat');
    return Surah.fromJson((json.decode(data.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getDetail(),
        builder:(context, snapshot) => SafeArea(child: Text('$noSurat'),),)
      );
  }
    
}