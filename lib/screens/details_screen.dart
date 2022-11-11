import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _Overview(),
            const _Overview(),
            const _Overview(),
            const _Overview(),
            const CastingCards()
          ]))
        ],
      )
    );
  }
  
}

class _CustomAppBar extends StatelessWidget {


  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
            ),
        ),
        background: const FadeInImage(placeholder: AssetImage('assets/circular_progress_indicator_selective.gif'), image: NetworkImage('https://via.placeholder.com/500x300.jpg')),
      ),
    );
  }
} 


class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/circular_progress_indicator_square_small.gif'), 
              image: NetworkImage('https://via.placeholder.com/200x300.jpg'), 
              height: 150
            )
          ),

          const SizedBox(width: 20),

          Column(
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis,),
              Text('movie.originalTitle', style: textTheme.subtitle2, overflow: TextOverflow.ellipsis,),

              Row(children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                const SizedBox(width: 5,),
                Text('movie.voteAverage', style: Theme.of(context).textTheme.caption)
              ],)
            ],
          )
        ],
      )
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Nisi consectetur dolor reprehenderit magna aute nulla nostrud. Sunt incididunt ut in irure et cupidatat sint enim eu mollit. Sunt esse exercitation dolor officia reprehenderit duis aute amet qui ipsum. Consequat in non sit quis do commodo cillum in anim non ullamco ut incididunt.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,)
    );
  }
}