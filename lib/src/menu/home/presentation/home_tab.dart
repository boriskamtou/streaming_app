import 'package:another_flushbar/flushbar.dart';
import 'package:movie_app/src/menu/core/infrastructure/movie.dart';
import 'package:movie_app/src/menu/home/application/popular_movies_notifier.dart';
import 'package:movie_app/src/menu/home/shared/providers.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/infrastructure/common_import.dart';
import 'widgets/play_and_add_to_my_list_buttons.dart';
import 'widgets/row_title.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _popularMovies = ref.watch(popularMoviesNotifier);
    ref.listen<PopularMoviesState>(
      popularMoviesNotifier,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          loading: () {},
          success: (_) {
            Flushbar(
              message: 'Success',
              icon: const Icon(
                Icons.info,
                color: AppColors.alertSuccess,
              ),
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.bgGreen,
              messageColor: AppColors.alertSuccess,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 2),
            ).show(context);
          },
          // failure: (error) {
          //   Flushbar(
          //     message: error ?? 'Hello',
          //     icon: const Icon(
          //       Icons.info,
          //       color: AppColors.alertError,
          //     ),
          //     borderRadius: BorderRadius.circular(10),
          //     backgroundColor: AppColors.bgRed,
          //     messageColor: AppColors.alertError,
          //     duration: const Duration(seconds: 2),
          //     margin: const EdgeInsets.all(16),
          //   ).show(context);
          // },
        );
      },
    );
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/f_image.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(.15),
                      Colors.black.withOpacity(.3),
                      Colors.black.withOpacity(.49),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/search.png',
                            color: AppColors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/notification.png',
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: MediaQuery.of(context).size.width / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr Strange 2',
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Action, Superhero, Science Fiction ...',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.urbanist(
                        color: AppColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const PlayAndAddToMyListButtons()
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 18),
          RowTitle(
            title: 'Top 10 Popular Movies',
            onSeeAllTap: () {},
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: _popularMovies.maybeMap(
              orElse: () {
                return null;
              },
              intial: (_) {
                return const Center(
                  child: Text('Loading data...'),
                );
              },
              loading: (_) {
                return SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => const LoadingMovie(),
                  ),
                );
              },
              failure: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      _.message != null ? _.message! : 'Error',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              success: (data) {
                return _ListOfPopularMovies(
                  movies: data.movies,
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          RowTitle(
            title: 'Top 10 Rated Movies',
            onSeeAllTap: () {},
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => const _MovieItem(
                imageUrl:
                    'https://media.comicbook.com/2017/10/iron-man-movie-poster-marvel-cinematic-universe-1038878.jpg',
                voteAverage: 7.2,
              ),
            ),
          ),
          const SizedBox(height: 18),
          RowTitle(
            title: 'Trending Movies',
            onSeeAllTap: () {},
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) => const _MovieItem(
                imageUrl:
                    'https://media.comicbook.com/2017/10/iron-man-movie-poster-marvel-cinematic-universe-1038878.jpg',
                voteAverage: 7.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListOfPopularMovies extends StatelessWidget {
  final List<Movie> movies;
  const _ListOfPopularMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => _MovieItem(
        imageUrl: movies[i].fullImageUrl,
        voteAverage: movies[i].voteAverage,
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  final String imageUrl;
  final double voteAverage;
  const _MovieItem({
    Key? key,
    required this.imageUrl,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            height: 20,
            width: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                voteAverage.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingMovie extends StatelessWidget {
  const LoadingMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300.withOpacity(.5),
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 100,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              height: 20,
              width: 30,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
