import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/app_bar.dart';
import '../bloc/home_bloc.dart';
import '../settings_page/settings_page.dart';
import '../widgets/error_message.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final ScrollController scrollController = ScrollController();
    final HomeBloc myDataBloc = HomeBloc();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBarPokemon(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/favorites').then((_) {
                      setState(() {});
                    });
                  },
                  icon:
                      Icon(Icons.favorite, color: themeData.primaryColorLight)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings').then((_) {
                      setState(() {});
                    });
                  },
                  icon:
                      Icon(Icons.settings, color: themeData.primaryColorLight)),
            ],
          )),
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
                return Expanded(
                    child: NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    if (scrollController.position.extentAfter == 0) {
                      setState(() {});
                      myDataBloc.add(HomeRequestedEventUpdate());
                    }
                    return true;
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.listpokemons
                        .length, // Número total de elementos en la lista
                    itemBuilder: (context, index) {
                      return PokemonCard(
                        pokemon: state.listpokemons[index],
                      );
                    },
                  ),
                ));
              } else if (state is HomeStateError) {
                return ErrorMessage(message: state.messageError);
              }
              return const SizedBox();
            },
          ),
        ]),
      ),
    );
  }
}
