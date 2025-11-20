
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Favorite Cards'),
        ),  
        body: Column(
          children: [
            FavoriteCard(title: 'title', description: 'description', isFavorite: true),
            FavoriteCard(title: 'title', description: 'description', isFavorite: false),
            FavoriteCard(title: 'title', description: 'description', isFavorite: true),
          ],
        ),    
      ),
      
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool isFavorite;


  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,

  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {

  bool isFavorite = false;

  @override
  void initState(){
    super.initState();
    isFavorite = widget.isFavorite;
  }
  
  void toggleFavorite(){
      setState(() {
        isFavorite = !isFavorite;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded( 
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.description,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite, 
            icon: Icon(
              Icons.favorite_rounded,
              color: isFavorite ? Colors.red: Colors.grey,
              size: 25,
              
            ),
            
          ),
        ],
      ),
      
    );
  }
}