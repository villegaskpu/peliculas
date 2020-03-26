import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage(peliculas[index].getPosterImg()),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.5, // 70%,
        itemHeight: _screenSize.height * 0.40, // 50%,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
