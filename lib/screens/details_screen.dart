import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Details Screen')
        ),
      )
    );
  }
  
}