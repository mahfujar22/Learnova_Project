import 'package:flutter/material.dart';
import 'package:task_project/screens/home_screen.dart';
import 'package:task_project/screens/lightbulb_outline_screen.dart';
import 'package:task_project/screens/menu_book_outline_screen.dart';
import 'package:task_project/screens/person_screen.dart';
import 'package:task_project/screens/video_library_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    VideoLibraryScreen(),
    LightBulbOutlineScreen(),
    MenuBookOutLineScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedItemColor: const Color(0xFF023F86),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: _navIcon(Icons.home, 0), label: ''),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.video_library, 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.lightbulb_outline, 2),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.menu_book_outlined, 3),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _navIcon(Icons.person, 4),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 28,
          color: isSelected ? const Color(0xFF0A5ED7) : Colors.grey,
        ),

        const SizedBox(height: 4),
        isSelected
            ? Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF0A5ED7),
                  shape: BoxShape.circle,
                ),
              )
            : const SizedBox(height: 6),
      ],
    );
  }
}
