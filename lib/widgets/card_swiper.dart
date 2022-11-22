import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatefulWidget {
  const CardSwiper(List<Movie> onDisplayMovies, {super.key, required this.movies, required this.onNextPage});

  final List<Movie> movies;
  final Function onNextPage;

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  int _currentIndex = 0;

    
  @override
  Widget build(BuildContext context) {
    void initState() {
      //TODO: Implement initState
      super.initState();
    }

    final size = MediaQuery.of(context).size;
    if(widget.movies.isEmpty){
      return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: const Center(
          child: CircularProgressIndicator()
        )
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.white,
      child: Swiper(
        itemCount: widget.movies.length - 1,
        onIndexChanged: (int index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
            if(index == widget.movies.length - 1)
            {
              widget.onNextPage();
              setState(() {
                
              });
            }
          });
        },
        index: _currentIndex, 
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _, int index) {

          final movie = widget.movies[index];
          movie.title = 'swiper-${movie.id}';
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/circular_progress_indicator_square_small.gif'), 
                image: NetworkImage(movie.FullPosterImg),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      )
    );
  }
}