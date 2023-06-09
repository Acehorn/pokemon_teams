import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/pokemon_model.dart';
import '../../core/utils/shared.dart';
import '../../core/utils/utils.dart';
import '../information_page.dart/information_page.dart';

class PokemonCard extends StatefulWidget {
  final List<PokemonModel> listpokemons;
  const PokemonCard({super.key, required this.listpokemons});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.listpokemons.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: widget.listpokemons[index].types == "dark"
                    ? Colors.white
                    : typeElementColor(widget.listpokemons[index].types),
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            color: typeElementColor(widget.listpokemons[index].types),
            child: ListTile(
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InformationPage(
                         pokemon: widget.listpokemons[index],
                          )),
                ); 

              },
              // ignore: iterable_contains_unrelated_type
              trailing:  favorite(widget.listpokemons[index]),
              contentPadding: const EdgeInsets.all(24),
              title: Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                          widget.listpokemons[index].sprites,
                          loadingBuilder: (BuildContext context, Widget child,
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
                  Text(widget.listpokemons[index].name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
              leading: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                    typeElementIcon(widget.listpokemons[index].types),
                    semanticsLabel: 'Acme Logo'),
              ),
            ),
          );
        });
  }

favorite(PokemonModel id) {

  
  for (var i = 0; i < favorites.length; i++) {
    if (favorites[i].id == id.id) {
      return GestureDetector(
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onTap: () async {
          setState(() {
            
          });
         favorites.remove(favorites[i]);
await deletePokemon(id.id);
        },
      );
    }
  }

  return GestureDetector(
    child: const Icon(
      Icons.favorite,
      color: Colors.black,
    ),
       onTap: () async {
        setState(() {
          
        });
         favorites.add(id);
     
   
// ignore: prefer_collection_literals
Set ids = Set();
favorites.retainWhere((x) => ids.add(x.id));
await insertPokemon(id);

        },
  );



}

}
