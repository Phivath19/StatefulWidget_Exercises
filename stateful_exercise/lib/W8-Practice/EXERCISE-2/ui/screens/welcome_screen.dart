// import 'package:flutter/material.dart';

// class WelcomeScreen extends StatelessWidget {
//   final VoidCallback onBackPressed;
//   const WelcomeScreen({
//     super.key,
//     required this.onBackPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Icon(
//             Icons.thermostat_outlined,
//             size: 120,
//             color: Colors.white,
//           ),
//         ),
//         const Text(
//           "Welcome !",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 50,
//           ),
//         ),
//         const SizedBox(height: 15),
//         OutlinedButton(
//           onPressed: null,
//           style: OutlinedButton.styleFrom(
//               side: const BorderSide(width: 1.0, color: Colors.white)),
//           child: const Text('Start to convert',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//               )),
//         )
//       ],
//     ));
//   }
// }


import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  // This callback function is called when the "Start to convert" button is pressed
  final VoidCallback onStartPressed;

  const WelcomeScreen({super.key, required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
          ),
          const Text(
            "Welcome !",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            // Call the onStartPressed callback when button is pressed
            onPressed: onStartPressed,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: const Text(
              'Start to convert',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

