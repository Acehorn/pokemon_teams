import 'package:flutter/material.dart';
import 'package:pokemon_teams/application/core/utils/utils.dart';
import 'package:pokemon_teams/application/pages/widgets/pokemon_card.dart';
import 'package:pokemon_teams/application/pages/widgets/team_card_pokemon.dart';

class FavoriteDialog extends StatefulWidget {
  const FavoriteDialog({super.key});

  @override
  State<FavoriteDialog> createState() => _FavoriteDialogState();
}

class _FavoriteDialogState extends State<FavoriteDialog> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      insetPadding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 50,
                width: 100,
                child: Image.asset('assets/pokemon.png', fit: BoxFit.contain)),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: favorites.isEmpty
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: favorites
                            .length, // Número total de elementos en la lista
                        itemBuilder: (context, index) {
                          return TeamCardPokemon(
                            pokemon: favorites[index],
                          );
                        },
                      )),
            ElevatedButton(
              child: const Text('Aceptar'),
              onPressed: () {
              Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
