import 'package:adaptix/adaptix.dart';
import 'package:elimde/screens/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'home/home_page.dart';
import 'favorites/favorites_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.onThemeChange, this.onLocaleChange});

  final ValueChanged<ThemeMode>? onThemeChange;
  final ValueChanged<Locale?>? onLocaleChange;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  int _cartCount = 2;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomePage(),
      const SearchPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 10.adaptedPx(context),),
            Image(image: AssetImage("assets/logos/app_bar_logo.png"), height: 50.adaptedPx(context),)
          ],
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButton: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -6, end: -6),
        showBadge: _cartCount > 0,
        badgeContent: Text(
          '$_cartCount',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff3B82F6), Color(0xff9333EA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: FloatingActionButton(
            elevation: 0, // let gradient container handle the background
            onPressed: () {

            },
            backgroundColor: Colors.transparent, // 👈 important
            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home_outlined,
          Icons.search,
          Icons.favorite_outline,
          Icons.person_outline,
        ],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Theme.of(context).colorScheme.onSurfaceVariant,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
        shadow: BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, -5),
        ),
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}