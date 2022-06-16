import 'package:flutter/material.dart';
import 'package:nike_store_app/ui/home/home.dart';

const int homeIndex = 0;
const int cartIndex = 1;
const int profileIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedTabIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map<int, GlobalKey<NavigatorState>> map = {
    homeIndex: _homeKey,
    cartIndex: _cartKey,
    profileIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTab =
        map[selectedTabIndex]!.currentState!;
    if (currentSelectedTab.canPop()) {
      currentSelectedTab.pop();
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'سبد خرید'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
          ],
          onTap: (selectedIndex) {
            setState(() {
              _history.remove(selectedTabIndex);
              _history.add(selectedTabIndex);
              selectedTabIndex = selectedIndex;
            });
          },
        ),
        body: IndexedStack(
          index: selectedTabIndex,
          children: [
            _navigator(_homeKey, homeIndex, const HomeScreen()),
            _navigator(_cartKey, cartIndex, const Center(child: Text('Cart'))),
            _navigator(_profileKey, profileIndex,
                const Center(child: Text('Profile'))),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedTabIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedTabIndex != index, child: child)));
  }
}
