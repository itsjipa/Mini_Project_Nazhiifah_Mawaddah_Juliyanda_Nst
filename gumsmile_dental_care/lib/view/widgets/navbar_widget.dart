import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/navbar_provider.dart';
import 'package:gumsmile_dental_care/view/screen/openai_screen.dart';
import 'package:provider/provider.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(builder: (context, navbarProvider, _) {
      return Scaffold(
        body: navbarProvider.screen[navbarProvider.selectedIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AiScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.adb,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navbarProvider.selectedIndex,
            onTap: (index) {
              navbarProvider.selectIndex(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}
