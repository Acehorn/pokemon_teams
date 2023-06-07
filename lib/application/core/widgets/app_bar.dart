import 'package:flutter/material.dart';


class AppBarPokemon extends StatefulWidget {
  final List <Widget> actions;
  const AppBarPokemon({super.key, required this.actions});

  @override
  State<AppBarPokemon> createState() => _AppBarPokemonState();
}

class _AppBarPokemonState extends State<AppBarPokemon> {
  @override
  Widget build(BuildContext context) {
    return AppBar(


      centerTitle: true,
        elevation: 0.1,
        title: SizedBox(
            height: 140,
            width: 100,
            child: Image.asset('assets/pokemon.png', fit: BoxFit.contain)),
        actions: widget.actions,
      );
  }
}