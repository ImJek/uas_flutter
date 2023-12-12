// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ulangan_flutter/component/home.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/frame1.png',
//               width: 156,
//             ),
//             SizedBox(height: 24,),
//             Text('Creating a better everyday life \n for the many people.',style: TextStyle(
//               fontSize: 12,
//               color: Color(0xff6C6C6C),
//             ),
//             // textAlign: ,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }