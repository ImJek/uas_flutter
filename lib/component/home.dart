// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ulangan_flutter/component/detail/detail_produck1.dart';
import 'package:ulangan_flutter/component/detail/detail_product.dart';
import 'package:ulangan_flutter/component/keranjang.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showTextField = true;
  bool _showSearchIcon = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double currentScroll = _scrollController.position.pixels;
    if (currentScroll > 20 && _showTextField) {
      setState(() {
        _showTextField = false;
        _showSearchIcon = true;
      });
    } else if (currentScroll <= 20 && !_showTextField) {
      setState(() {
        _showTextField = true;
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 80.0,
            // pinned: pinned,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(left: 24,),
              child: Image.asset('assets/logo.png', width: 86, height: 35),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    if (_showSearchIcon)
                      IconButton(
                        icon: Icon(
                          Iconsax.search_normal_1,
                          color: Color(0xff1B1B1B),
                        ),
                        onPressed: () {
                          setState(() {
                            _showTextField = true;
                            _showSearchIcon = false;
                          });
                        },
                      ),
                    SizedBox(width: 24,),
                    Icon(
                      Iconsax.notification,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Keranjang())
                      );
                      }, 
                      icon: Icon(Iconsax.shopping_cart),
                      color: Color(0xff1B1B1B),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                   ],
                ),
              )
            ],
            shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                        Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Cari barang impianmu",
                              prefixIcon: Icon(Iconsax.search_normal),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(2))),
                        ),
                      ),
                      SizedBox(height: 24,),
                      Image.asset('assets/gambar_awal.png',width: 382,height: 280,),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          category('assets/tempat_tidur.png','Kamar Tidur'),
                          category('assets/tempat_makan.png', 'Ruang Makan'),
                          category('assets/dapur.png', 'Dapur'),
                        ],
                      ),
                      SizedBox(height: 24,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          category('assets/boneka.png', 'Bayi & Anak'),
                          category('assets/pakaian.png', 'Tekstil'),
                          category('assets/rempah.png', 'Penyimpanan')
                        ],
                      ),
                      SizedBox(height: 48,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Produk Populer', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),),
                          Text('Lihat Semua', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0058AB)
                          ),)
                        ],
                      ),
                      SizedBox(height: 16,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) => Detail())
                                    );
                                  },
                                  child: _Produk('assets/gantungan.png','KROKFJORDEN','Pengait dengan \n plastik isap ...','Rp99.900')
                                ),
                              ),
                            ),
                            SizedBox(width: 24,),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, 
                                    MaterialPageRoute(builder: (context) => Detail())
                                  );
                                  },
                                  child: _Produk('assets/meja.png', 'ALEX/LAGKAPTEN', 'Meja, hijau muda/ \n putih, 120x60 cm', 'Rp1.909.000')
                                ),
                              ),
                            ),
                            SizedBox(width: 24,),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: _Produk('assets/fardal.png','FARDAL/PAX','Kombinasi lemari \n pakaian, putih/hig...','Rp8.400.000'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 48,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Telusuri Koleksi Kami', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),),
                          Text('Lihat Semua', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0058AB)
                          ),)
                        ],
                      ),
                      SizedBox(height: 16,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset('assets/poster1.png',width: 180,height: 232,),
                            SizedBox(width: 16,),
                            Image.asset('assets/poster2.png', width: 180,height: 232,),
                          ],
                        ),
                      ),
                      SizedBox(height: 48,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Penawaran Terkini', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),),
                          Text('Lihat Semua', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0058AB)
                          ),)
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/poster3.png',width: 183,),
                          Image.asset('assets/poster4.png',width: 183)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Column _Produk(String Gambar, String Judul, String Detail, String Harga) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Gambar,width: 146,height: 146,),
        SizedBox(height: 12,),
        Text(Judul, style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),),
        SizedBox(height: 6,),
        Text(Detail,style: TextStyle(
          color: Color(0xff6C6C6C)
        ),),
        SizedBox(height: 12,),
        Text(Harga, style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),)
      ],
    );
  }

  Column category(String Gambar, String Judul) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Gambar,width: 105,),
        SizedBox(height: 6,),
        Text(Judul, style: TextStyle(
          color: Color(0xff1B1B1B),
          fontWeight: FontWeight.w600,
          fontSize: 14
        ),),
      ],
    );
  }
}

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   _SliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }