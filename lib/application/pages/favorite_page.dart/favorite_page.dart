import 'package:flutter/material.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar.dart';
import '../widgets/pokemon_card.dart';

class FavoritePage extends StatelessWidget {

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PreferredSize(
    preferredSize: Size.fromHeight(40),
    child:  AppBarPokemon(actions: [
        ],)
      ),

      body: Padding(
          padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
      children: [
         Expanded(child: PokemonCard(listpokemons: favorites))
      ],
        ),
      ),
    );
  }
}