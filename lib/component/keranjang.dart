// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key});

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  String formatRupiah(int harga) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return currencyFormat.format(harga);
  }

  int hargaAlex = 1350000;
  int indexAlex = 1;

  int hargaMackapar = 1499000;
  int indexMackapar = 1;

  void _onRemovePressed(int index) {
    if (index == indexAlex && indexAlex > 1) {
      setState(() {
        indexAlex -= 1;
      });
    } else if (index == indexMackapar && indexMackapar > 1) {
      setState(() {
        indexMackapar -= 1;
      });
    }
  }

  void _onAddPressed(int index) {
    if (index == indexAlex) {
      setState(() {
        indexAlex += 1;
      });
    } else if (index == indexMackapar) {
      setState(() {
        indexMackapar += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        toolbarHeight: 85,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30, left: 24),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Iconsax.arrow_left,
              color: Color(0xff1B1B1B),
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Keranjang',
            style: TextStyle(
              color: Color(0xff1B1B1B),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 38, right: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.heart,
                color: Color(0xff1B1B1B),
              ),
            ),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
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
                        text: '2',
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
                Text(
                  'Hapus Semua',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0058AB),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            _buildCartItem('assets/w_1.png', 'ALEX', 'Unit laci, abu-abu toska, \n 36x70 cm', hargaAlex, indexAlex),
            SizedBox(
              height: 24,
            ),
            _buildCartItem('assets/lemari_putih.png', 'MACKAPÄR', 'Kabinet/tempat sepatu, putih, \n 80x35x102 cm', hargaMackapar, indexMackapar),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xffE7E7E7))),
        child: Padding(
          padding: EdgeInsets.only(top: 24, bottom: 17, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTotalPrice(),
              _buildAddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String image, String title, String description, int harga, int index) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 100,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xff1B1B1B),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              description,
              style: TextStyle(
                color: Color(0xff6C6C6C),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '${formatRupiah(harga * index)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff1B1B1B),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                _buildTrashIcon(index),
                SizedBox(
                  width: 16,
                ),
                _buildQuantityController(index),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTrashIcon(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE7E7E7)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: IconButton(
        onPressed: () => _onRemovePressed(index),
        icon: Icon(Iconsax.trash),
      ),
    );
  }

  Widget _buildQuantityController(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE7E7E7)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _onRemovePressed(index),
            icon: Icon(
              Iconsax.minus,
              color: Color(0xff6C6C6C),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text('$index'),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () => _onAddPressed(index),
            icon: Icon(
              Iconsax.add,
              color: Color(0xff0058AB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPrice() {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          'Total',
          style: TextStyle(color: Color(0xff6C6C6C)),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          formatRupiah(hargaMackapar * indexMackapar + hargaAlex * indexAlex),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff1B1B1B),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0058AB),
      ),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Tambah Keranjang',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
