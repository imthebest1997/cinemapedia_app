import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(      
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
 const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();

    ref.read( popularMoviesProvider.notifier ).loadNextPage();

   ref.read( upcomingMoviesProvider.notifier ).loadNextPage();

   ref.read( topRatedMoviesProvider.notifier ).loadNextPage();

  }

 @override
 Widget build(BuildContext context) {
  
  final initialLoading = ref.watch(initialLoadingProvider);

  if(initialLoading) return const FullScreenLoader();

  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
  final slideMovies = ref.watch( moviesSlideshowProvider );
  final popularMovies = ref.watch( popularMoviesProvider );
  final topMovies = ref.watch( topRatedMoviesProvider );
  final upComingMovies = ref.watch( upcomingMoviesProvider );
  
  return CustomScrollView(
    slivers:[
      const SliverAppBar(
        floating: true,        
        stretch: true,
        title: CustomAppbar(),
      ),

      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideMovies),
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: "En Cines",
                  subTitle: "Lunes 20",
                  loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                ),
            
                MoviesHorizontalListview(
                  movies: upComingMovies,
                  title: "Próximamente",
                  subTitle: "En este mes",
                  loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                ),
            
                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: "Populares",
                  loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
                ),
            
                MoviesHorizontalListview(
                  movies: topMovies,
                  title: "Mejor Calificadas",
                  subTitle: "Desde siempre",
                  loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                ),            
              ],
            );
          },
          childCount: 1,
        )
      ),
    ] 
  );
 }
}