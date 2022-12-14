import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:movie_app/src/menu/home/presentation/home_tab.dart';

import '../../../core/infrastructure/common_import.dart';
import '../../home/shared/providers.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0;

  final _iconOutlineList = <String>[
    'assets/icons/home.png',
    'assets/icons/discovery.png',
    'assets/icons/bookmark.png',
    'assets/icons/download.png',
    'assets/icons/profile.png',
  ];

  final _iconSolidList = <String>[
    'assets/icons/home_solid.png',
    'assets/icons/discovery_solid.png',
    'assets/icons/bookmark_solid.png',
    'assets/icons/download_solid.png',
    'assets/icons/profile_solid.png',
  ];
  final titleList = <String>[
    'Home',
    'Discovery',
    'Bookmark',
    'Download',
    'Profile',
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    Text(
      'Index 1: Explore',
    ),
    Text(
      'Index 2: My List',
    ),
    Text(
      'Index 3: Download',
    ),
    Text(
      'Index 4: Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(popularMoviesNotifier.notifier).getPopularMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _iconOutlineList.length,
        splashSpeedInMilliseconds: 0,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.primary : AppColors.inactiveColor;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isActive ? _iconSolidList[index] : _iconOutlineList[index],
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  titleList[index],
                  maxLines: 1,
                  style: GoogleFonts.urbanist(
                    color: color,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        leftCornerRadius: 14,
        rightCornerRadius: 14,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 1.5,
          spreadRadius: 0,
        ),
        elevation: 2,
      ),
      body: _widgetOptions.elementAt(_bottomNavIndex),
    );
  }
}
