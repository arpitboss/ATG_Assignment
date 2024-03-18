import 'package:atg_assignment/widgets/custom_appbar.dart';
import 'package:atg_assignment/widgets/grid_item.dart';
import 'package:atg_assignment/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingIcon: Icons.view_sidebar,
        trailingIcon1: Icons.message_outlined,
        trailingIcon2: Icons.notifications,
        preferredHeight: kToolbarHeight,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: const Color(0xf4f6fbff),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello, Priya!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times New Roman'),
                    ),
                    const Text(
                      'What do you wanna learn today?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30),
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: 2),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (_, index) => buildGridItem(
                              _getIconData(index),
                              _getText(index),
                            )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  Programs for you',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                              color: Colors.black,
                              fontFamily: 'Times New Roman',
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text(
                                    'View All',
                                    style: TextStyle(
                                        fontFamily: 'Times New Roman'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => buildListItem(
                          _getHeading(index),
                          _getDescription(index),
                          _getLessons(index),
                          _getImage(index)),
                      separatorBuilder: (_, __) => const SizedBox(width: 0),
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blueAccent[200]!,
        items: [
          _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
          _buildBottomNavigationBarItem(Icons.menu_book_rounded, 'Learn', 1),
          _buildBottomNavigationBarItem(Icons.hub_outlined, 'Hub', 2),
          _buildBottomNavigationBarItem(Icons.chat_bubble_rounded, 'Chat', 3),
          _buildBottomNavigationBarItem(Icons.person, 'Profile', 4),
        ],
        currentIndex: _selectedIndex.value,
        onTap: (index) {
          _selectedIndex.value = index;
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      backgroundColor: Colors.transparent,
      activeIcon: Stack(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 3,
              color: Colors.blue,
            ),
          ),
          Center(
            child: Icon(
              icon,
              color: Colors.blueAccent[200]!,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.book_rounded;
      case 1:
        return Icons.help;
      case 2:
        return Icons.menu_book_rounded;
      case 3:
        return Icons.track_changes_sharp;
      default:
        return Icons.error;
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return 'Programs';
      case 1:
        return 'Get help';
      case 2:
        return 'Learn';
      case 3:
        return 'DD Tracker';
      default:
        return 'Error';
    }
  }

  String _getHeading(int index) {
    switch (index) {
      case 0:
        return 'LIFESTYLE';
      case 1:
        return 'WORKING PAGE';
      default:
        return 'Error';
    }
  }

  String _getDescription(int index) {
    switch (index) {
      case 0:
        return 'A complete guide for your newly born baby';
      case 1:
        return 'Understanding the working culture and behaviour';
      default:
        return 'Error';
    }
  }

  String _getLessons(int index) {
    switch (index) {
      case 0:
        return '16 lessons';
      case 1:
        return '12 lessons';
      default:
        return 'Error';
    }
  }

  String _getImage(int index) {
    switch (index) {
      case 0:
        return 'assets/babyfeed.png';
      case 1:
        return 'assets/natarajasana.png';
      default:
        return 'Error';
    }
  }
}
