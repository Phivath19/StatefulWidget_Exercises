

// // -----------------------Default code ----------------------------------


// import 'package:flutter/material.dart';
// import 'ui/screens/temperature_screen.dart';
// import 'ui/screens/welcome_screen.dart';

// // List<String> screens = ['WelcomeScreen()', 'TemperatureScreen()'];

// class TemperatureApp extends StatefulWidget {
 
//   const TemperatureApp({super.key});

//   @override
//   State<TemperatureApp> createState() {
//     return _TemperatureAppState();
//   }
// }

// class _TemperatureAppState extends State<TemperatureApp> {

//   int currentScreenIndex = 0;

//   void switchScreen(int currentScreen){
//     setState(() {
//       currentScreenIndex = currentScreen;
//     });
//   }
  
//   @override
//   Widget build(context) {

//     List<Widget> screens = [
//       WelcomeScreen(onBackPressed: ()=> switchScreen(0)),
//       TemperatureScreen(onStartPressed: ()=> switchScreen(1)),
//     ];

//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xff16C062),
//                 Color(0xff00BCDC),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: screens[currentScreenIndex],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const TemperatureApp());
// }




// ----------------------------The code that can be click and move to another screen------------------------------------ 

import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // This variable tracks which screen to display
  // 0 = WelcomeScreen, 1 = TemperatureScreen
  int currentScreenIndex = 0;

  // This method changes the screen by updating the state
  void switchScreen(int screenIndex) {
    setState(() {
      currentScreenIndex = screenIndex;
    });
  }

  @override
  Widget build(context) {
    // List of screens to display
    List<Widget> screens = [
      WelcomeScreen(onStartPressed: () => switchScreen(1)),
      TemperatureScreen(onBackPressed: () => switchScreen(0)),
    ];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Display the current screen based on currentScreenIndex
          child: screens[currentScreenIndex],
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
