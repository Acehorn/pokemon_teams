import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/models/pokemon_model.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar.dart';

class InformationPage extends StatelessWidget {
  final PokemonModel pokemon;
  const InformationPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.types == "dark"
          ? Colors.white
          : typeElementColor(pokemon.types),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarPokemon(
            actions: [],
          )),
      body: Column(
        children: [
   
          SizedBox(
              height: 300,
              width: 300,
              child: Image.network(pokemon.sprites, loadingBuilder:
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(zeros(pokemon.id),
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
              Text(pokemon.name,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(typeElementIcon(pokemon.types),
                semanticsLabel: 'Acme Logo'),
          ),
          const SizedBox(height: 10),
          Text(pokemon.types,
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ],
      ),
    );
  }

  String zeros(int numb) {
    if (numb < 10) {
      return "00$numb ";
    } else if (numb < 100) {
      return "0$numb ";
    } else {
      return "";
    }
  }

  favorite(PokemonModel id) {
    for (var i = 0; i < favorites.length; i++) {
      if (favorites[i].id == id.id) {
        return GestureDetector(
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onTap: () {
            favorites.remove(favorites[i]);
          },
        );
      }
    }

    return GestureDetector(
      child: const Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      onTap: () {
        favorites.add(id);

// ignore: prefer_collection_literals
        Set ids = Set();
        favorites.retainWhere((x) => ids.add(x.id));
      },
    );
  }
}
