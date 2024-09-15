import 'package:faketok_app/providers/tab_provider.dart';
import 'package:faketok_app/screens/add_video.dart';
import 'package:faketok_app/screens/home.dart';
import 'package:faketok_app/screens/inbox.dart';
import 'package:faketok_app/screens/shop.dart';
import 'package:faketok_app/screens/my_profile.dart';
// import 'package:faketok_app/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Tabs>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  int currentIndex = 0;
  int tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
  }
  
  List<Widget> navList = [
    const Home(),
    const Shop(),
    const AddVideo(),
    const Inbox(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final currentTab = ref.watch(tabNotifierProvider);
    if (currentTab.currentTab <= 2) {
      _tabController.index = currentTab.currentTab;
    }
    // return GestureDetector(
    //     onHorizontalDragEnd: (details) {
    //       if (details.primaryVelocity! < 0) {
    //         Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => const UserProfile(),
    //         ));
    //       }
    //     },
    //     child:
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.live_tv)),
          title: TabBar(
              onTap: (value) {
                ref.read(tabNotifierProvider.notifier).updateTab(value);
              },
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              dividerHeight: 0,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Friends',
                ),
                Tab(
                  text: 'Following',
                ),
                Tab(
                  text: 'For You',
                )
              ]),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).canvasColor),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex == 0 ? Icons.home : Icons.home_outlined),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                      currentIndex == 1 ? Icons.shop : Icons.shop_outlined),
                  label: 'Shop'),
              const BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(currentIndex == 3
                      ? Icons.message
                      : Icons.message_outlined),
                  label: 'Inbox'),
              BottomNavigationBarItem(
                  icon: Icon(currentIndex == 4
                      ? Icons.account_circle
                      : Icons.account_circle_outlined),
                  label: 'Profile'),
            ]),
      ),
      body: navList[currentIndex],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
