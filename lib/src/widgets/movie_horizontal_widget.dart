import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

import '../models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function sigientePagina;

  MovieHorizontal({@required this.peliculas, @required this.sigientePagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener((){
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        print('cargar peliculas');
        sigientePagina();
      }
    });


    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, index) => tarjeta(context, peliculas[index])
      )
    );
  }

  Widget tarjeta(BuildContext context, Pelicula pelicula) {
    final peliculaConteiner =  Container(
          child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 100.0,
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

      return GestureDetector(
        child: peliculaConteiner,
        onTap: (){
          Navigator.pushNamed(context, 'detalle',arguments: pelicula);
        },
      );
  }
}
