import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';


class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0,),
                _posterTitulo( pelicula ),
              ]
            ),
          )
        ],
      ),
    );
  }

  _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.white,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
      background: FadeInImage(
        placeholder: AssetImage('assets/img/loading.gif'), 
        image: NetworkImage(pelicula.getBackgroundImg()),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.contain,
        ),
      ),
    );
  }

  _posterTitulo(Pelicula pelicula) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: 
              Image(
                  image: NetworkImage(pelicula.getPosterImg()),
                  height: 150.0,
              ),
          ),
          SizedBox(height: 20.0,),
          Flexible(
            child: Column(
              children: <Widget>[
                Text(pelicula.title),
                Text(pelicula.originalTitle)
              ],
            )
          )
        ],
      ),
    );
  }
}