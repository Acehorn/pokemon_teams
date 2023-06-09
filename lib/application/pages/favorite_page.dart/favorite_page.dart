import 'package:flutter/material.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar.dart';
import '../widgets/pokemon_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBarPokemon(
            actions: [],
          )),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: favorites.isEmpty
              ? Container()
              : ListView.builder(
                  itemCount:
                      favorites.length, // Número total de elementos en la lista
                  itemBuilder: (context, index) {
                    return PokemonCard(
                      pokemon: favorites[index],
                    );
                  },
                )),
    );
  }
}
