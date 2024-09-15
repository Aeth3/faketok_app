import 'package:faketok_app/providers/following_provider.dart';
import 'package:faketok_app/providers/friends_provider.dart';
import 'package:faketok_app/providers/tab_provider.dart';
import 'package:faketok_app/providers/foryou_provider.dart';
import 'package:faketok_app/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _pageController;
  late PageController _forYouPageController;
  late PageController _followingPageController;
  late PageController _friendsPageController;
  int currentPage = 2;
  int forYouPage = 0;
  int followingPage = 0;
  int friendsPage = 0;
  bool hasReachedEnd = true;

  @override
  void initState() {
    _forYouPageController = PageController(initialPage: forYouPage);
    _followingPageController = PageController(initialPage: followingPage);
    _friendsPageController = PageController(initialPage: friendsPage);
    _pageController = PageController(initialPage: currentPage);

    // _pageController.addListener(() {
    //   if (_pageController.page == _pageController.page!.roundToDouble() &&
    //       _pageController.page == _pageController.position.maxScrollExtent &&
    //       _pageController.position.userScrollDirection ==
    //           ScrollDirection.reverse) {
    //     isExplicitScrollToEnd = true;
    //   } else {
    //     isExplicitScrollToEnd = false;
    //   }
    // });
    super.initState();
  }

  void _animateToTab(int tab) {
    _pageController.jumpToPage(tab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _followingPageController.dispose();
    _friendsPageController.dispose();
    _forYouPageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // final pageState = ref.watch(forYouNotifierProvider);
    final tabState = ref.watch(tabNotifierProvider);
    // forYouPage = pageState.currentPage;
    currentPage = tabState.currentTab;

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenHeight * 1.0;
    final forYouVideos = ref.watch(forYouVideoListNotifierProvider);
    final followingVideos = ref.watch(followingNotifierProvider);
    final friendsVideos = ref.watch(friendsNotifierProvider);

    Future.microtask(() {
      _animateToTab(currentPage);
    });

    return Container(
      margin: const EdgeInsets.only(top: 35),
      width: double.infinity,
      height: containerHeight,
      color: Colors.black,
      child:
          // NotificationListener<ScrollNotification>(
          //   onNotification: (scrollNotification) {
          //     if (scrollNotification is ScrollEndNotification &&
          //         _pageController.position.pixels ==
          //             _pageController.position.maxScrollExtent) {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const UserProfile(),
          //       ));
          //     }
          //     return false;
          //   },
          //   child:
          PageView(
              onPageChanged: (value) {
                ref.read(tabNotifierProvider.notifier).updateTab(value);
                ref
                    .read(followingNotifierProvider.notifier)
                    .filterFollowing(forYouVideos);
                ref
                    .read(friendsNotifierProvider.notifier)
                    .filterFriends(forYouVideos);

                if (value == 2) {
                  setState(() {
                    hasReachedEnd = true;
                  });
                } else {
                  hasReachedEnd = false;
                }
              },
              controller: _pageController,
              children: [
                //Friends
            PageView.builder(
              key: const PageStorageKey<String>('friendsPage'),
              controller: _friendsPageController,
              scrollDirection: Axis.vertical,
              itemCount: friendsVideos.length,
              itemBuilder: (context, index) {
                return VideoWidget(
                  video: friendsVideos[index],
                  containerHeight: containerHeight,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isEnd: hasReachedEnd,
                );
              },
            ),
            // Following
            PageView.builder(
              key: const PageStorageKey<String>('followingPage'),
              controller: _followingPageController,
              scrollDirection: Axis.vertical,
              itemCount: followingVideos.length,
              itemBuilder: (context, index) {
                return VideoWidget(
                  video: forYouVideos[index],
                  containerHeight: containerHeight,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isEnd: hasReachedEnd,
                );
              },
            ),
            //For You
            PageView.builder(
              key: const PageStorageKey<String>('ForYou'),
              controller: _forYouPageController,
              scrollDirection: Axis.vertical,
              itemCount: forYouVideos.length,
              itemBuilder: (context, index) {
                return VideoWidget(
                  video: forYouVideos[index],
                  containerHeight: containerHeight,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  isEnd: hasReachedEnd,
                );
              },
            )
          ]),
    );
  }
}
