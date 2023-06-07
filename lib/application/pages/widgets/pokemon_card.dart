import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/utils.dart';


class PokemonCard extends StatelessWidget {
  final String element;
  final String namePokemon;
  final String sprite;
  const PokemonCard({super.key, required this.element, required this.namePokemon, required this.sprite});

  @override
  Widget build(BuildContext context) {
  
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: element=="dark" ? Colors.white :  typeElementColor(element),
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      color:  typeElementColor(element),
      child: ListTile(
        
     
     trailing: const Icon(Icons.favorite, color: Colors.red),
        contentPadding: const EdgeInsets.all(24),
        title: Row(
          children: [
   
        SizedBox(
            height: 50,
            width: 50,
            child: Image.network(
            
                sprite,
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
            },
               errorBuilder: (BuildContext context, Object exception,
            StackTrace? stackTrace) {
         return const Center(child: Text('😢'));
  })
              
                ),
          
            const Text("Umbreon",
                style: TextStyle(color: Colors.white, fontSize: 18)),
              
      
          ],
        ),
     
        leading:            SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(typeElementIcon(element),
              semanticsLabel: 'Acme Logo'),
        ),
      ),
    );
  }

 
}