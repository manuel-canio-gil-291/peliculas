import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
        ],
      )
    );
  }
  
}