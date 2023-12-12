// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Detail extends StatefulWidget {

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isPressed = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Iconsax.arrow_left,color: Colors.black,size: 26,)
                ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text('ALEX/LAGKAPTEN',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black
          ),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 24,right: 20),
            child: Row(
              children: [
                Icon(Iconsax.search_normal,color: Colors.black,),
                SizedBox(width: 20,),
                Icon(Iconsax.share,color: Colors.black,),
                SizedBox(width: 20,),
                Icon(Iconsax.shopping_cart,color: Colors.black,)
              ],
            ),
          )
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/romm.png'),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Image.asset('assets/meja.png',width: 58,),
                    SizedBox(width: 12,),
                    Image.asset('assets/karpet.png',width: 58),
                    SizedBox(width: 12,),
                    Image.asset('assets/lemari.png',width: 58),
                    SizedBox(width: 12,),
                    Image.asset('assets/tiang.png',width: 58),
                    SizedBox(width: 12,),
                    Image.asset('assets/romm.png',width: 58,)
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ALEX/LAGKAPTEN',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black
                    ),),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed; // Membalik status ikon
                        });
                      },
                      icon: Icon(isPressed ? Iconsax.heart5 : Iconsax.heart,
                          color: isPressed ? Colors.red : Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                Text('Meja, hijau muda/putih, 120x60 cm', style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6C6C6C)
                ),),
                SizedBox(height: 12,),
                Text('Rp1.909.000',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24
                ),),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    Icon(Iconsax.star1,color: Colors.yellow,),
                    SizedBox(width: 4,),
                    Text('4.5 | Terjual 116',style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff6C6C6C)
                    ),)
                  ],
                ),
                SizedBox(height: 12,),
                Text('Ruang terbatas bukan berarti Anda harus menolak \n belajar atau bekerja dari rumah. Meja ini memakan \n sedikit ruang lantai namun masih memiliki unit laci tempat Anda dapat menyimpan kertas dan barang penting lainnya.')
              ],
            ), 
          )
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffE7E7E7)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24,bottom: 17, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE7E7E7)),
                  borderRadius: BorderRadius.circular(1)
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if(count > 1) {
                            count = count - 1;
                          }  
                        });
                      }, 
                      icon: Icon(Iconsax.minus,size: 26,)
                    ),
                    SizedBox(width: 10,),
                    Text('${count}',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(width: 10,),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count ++;
                        });
                      }, 
                      icon: Icon(Iconsax.add,size: 26,)
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff0058AB),
                ),
                padding: EdgeInsets.only(left: 25,right: 25),
                child: TextButton(
                  onPressed: (){}, 
                  child: Text('Tambah Keranjang',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),)
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}