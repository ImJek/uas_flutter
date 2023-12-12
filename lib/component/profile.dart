// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menu Akun',
                      style: TextStyle(
                          color: Color(0xff1B1B1B),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Icon(Iconsax.setting_2, weight: 600),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Image.asset('assets/barcode.png', width: 84),
                    SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rizqi Fatur',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '160002359102020',
                            style: TextStyle(color: Color(0xff6C6C6C)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24),
                Divider(),
                SizedBox(height: 24),
                buildMenuItem(Iconsax.user, 'Profile Saya'),
                SizedBox(height: 24),
                Divider(),
                SizedBox(height: 24),
                buildMenuItem(Iconsax.box, 'Pesanan'),
                SizedBox(height: 24),
                Divider(),
                SizedBox(height: 24),
                buildMenuItem(Iconsax.star, 'Ulasan'),
                SizedBox(height: 24),
                Divider(),
                SizedBox(height: 24),
                buildMenuItem(Iconsax.gift, 'Reward Saya'),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 24),
                buildMenuItem(Iconsax.message_question, 'Bantuan'), // Updated this line
                SizedBox(height: 24),
                Divider(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}
