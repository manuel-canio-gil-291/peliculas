import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key, required List movies, String? title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: Si no hay titulo no deben de mostrar este widget
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares', 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w400
              )
            )
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _, int index) => const _MoviePoster()
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/circular_progress_indicator_square_small.gif'), 
                image: NetworkImage('https://via.placeholder.com/300x400.jpg'),
                width: 130,
                height: 190,
                fit: BoxFit.cover
              )
            )
          ),
                  
          const SizedBox(height: 5),
                  
          const Text(
            'StarWars: El retorno del nuevo Jedi silvestre de Monte Cristo',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ]
      ),
    );
  }
}