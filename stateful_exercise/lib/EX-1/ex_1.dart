
  import 'package:flutter/material.dart';
  void main(){
    runApp(
      const MyApp()
    );
  }

  class MyApp extends StatelessWidget {
    const MyApp({
      super.key
    });

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Select button',
        theme: ThemeData(
          primarySwatch: Colors.blue,   
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Stateful-widget button'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  SelectableButton(),
                  SizedBox(height: 20),
                  SelectableButton(),
                  SizedBox(height: 20),
                  SelectableButton(),
                  SizedBox(height: 20),
                  SelectableButton(),
              ],
            ),
          ),
        ),
      );
    }
  }

  class SelectableButton extends StatefulWidget {
    const SelectableButton({
      super.key
    });

    @override
    State<SelectableButton> createState() => _SelectableButtonState();
  }

  class _SelectableButtonState extends State<SelectableButton> {
    bool isSelected = false;

    String get textLabel => isSelected ? 'Selected' : 'Not Select';

    Color get textColor => isSelected ? Colors.white : Colors.black;

    Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

    void toggleSelection(){
      setState(() {
        isSelected = !isSelected;
      });
    }
    
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 100,
        width: 500,
        child: ElevatedButton(
          onPressed:toggleSelection,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(50),
            ),
          ),
          child: Text(
            textLabel,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
    }
  }