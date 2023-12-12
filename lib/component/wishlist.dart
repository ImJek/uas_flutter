// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ulangan_flutter/component/keranjang.dart';
import 'package:ulangan_flutter/component/wishlist_1.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  static List<WishList_model> list_wishList = [
    WishList_model(0, 'assets/w_1.png', 'ALEX', 'Unit laci, abu-abu toska, \n 36x70 cm', 'Rp1.350.000'),
    WishList_model(1, 'assets/w_2.png', 'MILLBERGET', 'Kursi putar, murum hitam', 'Rp1.799.000'),
    WishList_model(2, 'assets/w_3.png', 'SONGESAND', 'Rngk tmpt tdr dg 2 ktk penyimpanan,  cokelat, 160x200 cm', 'Rp3.499.000'),
    WishList_model(3, 'assets/w_4.png', 'HEKTAR', 'Lampu lantai, abu-abu tua', 'Rp1.299.000'),
  ];

  List<WishList_model> display_wishList = List.of(list_wishList);

  void updateWishlist(String value) {
    setState(() {
      display_wishList = list_wishList
          .where((element) => element.wishlistJudul.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.only(top: 50, left: 24),
          child: Text(
            'Wishlist',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xff1B1B1B),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 45, right: 24),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Keranjang()));
              },
              icon: Icon(Iconsax.shopping_cart, color: Color(0xff1B1B1B), size: 26),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextField(
                onChanged: (value) => updateWishlist(value),
                decoration: InputDecoration(
                  hintText: "Cari barang impianmu",
                  prefixIcon: Icon(Iconsax.search_normal_1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff6C6C6C),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: '4',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1B1B1B),
                        ),
                      ),
                      TextSpan(
                        text: ' barang',
                      ),
                    ],
                  ),
                ),
                Icon(Icons.list_rounded, size: 25),
              ],
            ),
            SizedBox(height: 22),
            Expanded(
              child: ListView.builder(
                itemCount: display_wishList.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(display_wishList[index].wishlistJudul),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6),
                      Text(display_wishList[index].wishlistTitle),
                      SizedBox(height: 6),
                      Text(
                        display_wishList[index].wishlistHarga,
                        style: TextStyle(
                          color: Color(0xff1B1B1B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff0058AB)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Tambah Keranjang',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0058AB),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.heart, color: Color(0xff1B1B1B)),
                  ),
                  leading: Image.asset('${display_wishList[index].wishlistImage}'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
