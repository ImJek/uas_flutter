// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ulangan_flutter/component/keranjang.dart';

class Inspiration extends StatefulWidget {
  const Inspiration({Key? key}) : super(key: key);

  @override
  State<Inspiration> createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget buildCategory(String title, int id) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = id;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(
                color: selectedIndex == id ? Color(0xff0058AB) : Colors.grey),
            color: selectedIndex == id ? Color(0xff0058AB) : Colors.white,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: selectedIndex == id ? Colors.white : Colors.grey,
            ),
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 54, left: 15),
            child: Text(
              'Temukan Inspirasi',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff1B1B1B)),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 54, left: 24),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Iconsax.search_normal_1,
                          color: Color(0xff1B1B1B), size: 26)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Keranjang()));
                      },
                      icon: Icon(Iconsax.shopping_cart,
                          color: Color(0xff1B1B1B), size: 26)),
                ],
              ),
            )
          ],
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            labelColor: Color(0xff1B1B1B),
            tabs: [
              Tab(text: 'Inspirasi'),
              Tab(text: 'Koleksi'),
              Tab(text: 'Edukasi'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildCategory('Semua', 0),
                            SizedBox(width: 16),
                            buildCategory('Ruang Kerja', 1),
                            SizedBox(width: 16),
                            buildCategory('Dapur', 2),
                            SizedBox(width: 16),
                            buildCategory('Ruang Keluarga', 3),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildOffer('Hunian compact yang \n nyaman',
                              'assets/kantor.png'),
                          _buildOffer('Lakukan 5 hal ini agar \n sepatumu bebas ...',
                              'assets/tempat_olahraga.png')
                        ],
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/kasur.png',
                            width: 382,
                            height: 120,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Hadirkan nuasa elegant dan fancy kedalam \n kamar tidur anda',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff1B1B1B)),
                          )
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildOffer(
                              'Rumah lebih sehat \n dengan set tempat ...',
                              'assets/sabun.png'),
                          _buildOffer(
                              'Membuat kamar anak \n rapi jadi lebih mudah',
                              'assets/kulkas.png')
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Halaman Ini Belum Tersedia',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                'Halaman Ini Belum Tersedia',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildOffer(String title, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, width: 170),
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff1B1B1B)),
        )
      ],
    );
  }
}
