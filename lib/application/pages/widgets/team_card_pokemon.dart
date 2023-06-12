import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_teams/data/models/pokemon_model.dart';
import '../../core/utils/utils.dart';
import '../information_page.dart/information_page.dart';

class TeamCardPokemon extends StatefulWidget {
  final PokemonModel pokemon;

  const TeamCardPokemon({super.key, required this.pokemon});

  @override
  State<TeamCardPokemon> createState() => _TeamCardPokemonState();
}

class _TeamCardPokemonState extends State<TeamCardPokemon> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: widget.pokemon.types == "dark"
              ? Colors.white
              : typeElementColor(widget.pokemon.types),
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      color: typeElementColor(widget.pokemon.types),
      child: ListTile(
        subtitle: const Text("Ya es parte de tu equipo.", style: TextStyle(color: Colors.white)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InformationPage(
                      pokemon: widget.pokemon,
                    )),
          );
        },
        // ignore: iterable_contains_unrelated_type
        contentPadding: const EdgeInsets.all(8),
        title: Row(
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: Image.network(widget.pokemon.sprites, loadingBuilder:
                    (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }, errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(child: Text('😢'));
                })),
            Text(widget.pokemon.name,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        leading: SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(typeElementIcon(widget.pokemon.types),
              semanticsLabel: 'Acme Logo'),
        ),
      ),
    );
  }
}
