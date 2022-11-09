import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.red,
      child: Swiper(
        itemCount: 10, 
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: ( _, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'route'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: NetworkImage('assets/no-image.png'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      )
    );
  }
}