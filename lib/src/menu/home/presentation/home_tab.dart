import '../../../core/infrastructure/common_import.dart';

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  Widget build(BuildContext context) {
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
                    const _PlayAndAddToMyListButtons()
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 18),
          _RowTitle(
            title: 'Top 10 Popular Movies',
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
              itemBuilder: (ctx, i) => const _MovieItem(),
            ),
          ),
          const SizedBox(height: 18),
          _RowTitle(
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
              itemBuilder: (ctx, i) => const _MovieItem(),
            ),
          ),
          const SizedBox(height: 18),
          _RowTitle(
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
              itemBuilder: (ctx, i) => const _MovieItem(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayAndAddToMyListButtons extends StatelessWidget {
  const _PlayAndAddToMyListButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.play_circle,
                color: AppColors.white,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                'Play',
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 2,
                color: AppColors.white,
              )),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: AppColors.white,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                'My List',
                style: GoogleFonts.urbanist(
                  color: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/movie_image.png',
            ),
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
            child: const Center(
              child: Text(
                '9.5',
                textAlign: TextAlign.center,
                style: TextStyle(
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

class _RowTitle extends StatelessWidget {
  final String title;
  final void Function() onSeeAllTap;
  const _RowTitle({
    Key? key,
    required this.title,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: const Text(
              'See all',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
