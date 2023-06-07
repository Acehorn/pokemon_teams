import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';
import '../settings_page/settings_page.dart';
import '../widgets/pokemon_card.dart';

class HomePageWrapperProvider extends StatelessWidget {
  const HomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeRequestedEvent()),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/pokemon.png', fit: BoxFit.contain)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              icon: Icon(Icons.settings, color: themeData.primaryColorLight))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return Container();
              } else if (state is HomeStateLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  ),
                );
              } else if (state is HomeStateLoaded) {
                //    return  PokemonCard(element: state.elementType, namePokemon: state.pokemonName, sprite: state.sprite,);

                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: elementsPokemon.length,
                      itemBuilder: (context, index) {
                        return  PokemonCard(element: state.elementType, namePokemon: state.pokemonName, sprite: state.sprite);
                      }),
                );
              } else if (state is HomeStateError) {
                return Text(state.messageError);
              }
              return const SizedBox();
            },
          ),
        ]),
      ),
    );
  }
}