import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: const [
          CardSwiper()

          //Listado horizontal de peliculas
        ],
      )
    );
  }

}