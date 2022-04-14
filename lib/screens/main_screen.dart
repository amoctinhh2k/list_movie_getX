import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_list_movie/helpers.dart';
import 'package:flutter_list_movie/style/bottom_navbar_bloc.dart';
import 'package:flutter_list_movie/style/theme_bloc/theme_controller.dart';
import 'package:flutter_list_movie/widgets/search_screen_widgets/search_list/search_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'account_screen/account_screen.dart';
import 'genres_screen/genres_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.themeController,
  }) : super(key: key);
  final ThemeController themeController;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavBar _bottomNavBar = BottomNavBar();
  late bool isDarkMode;
  var isOnline = true;

  // late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    checkBoxCallBack(isOnline);
    // Future.delayed(const Duration(seconds: 5), () {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text("Không có kết nối Internet!")));
    // print("kkkk $isOnline");
    // setState(() {
    //   isOnline = true;
    // });
    // });
  }

  // @override
  // void dispose() {
  //   _bottomNavBar.close();
  //   super.dispose();
  // }

  Future<void> checkBoxCallBack(bool checkBoxState) async {
    var isChecked = await verifyOnline();
    print("kkkk $isChecked");
    setState(() {
      isOnline = isChecked;
    });
    if (!isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Không có kết nối Internet!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = widget.themeController.themeMode == ThemeMode.dark;

    return Stack(
      children: [
        AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: SafeArea(
            child: Scaffold(
                body: !isOnline
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : StreamBuilder<NavBarItem>(
                        stream: _bottomNavBar.itemStream,
                        initialData: _bottomNavBar.defaultItem,
                        builder: (BuildContext context,
                            AsyncSnapshot<NavBarItem> snapshot) {
                          switch (snapshot.data) {
                            case NavBarItem.home:
                              // return SearchWidget();
                              return AccountScreen();
                            // return HomeScreen(
                            //     themeController: widget.themeController);
                            case NavBarItem.genres:
                              return GenresListScreen();
                            // GenresWidget();
                            case NavBarItem.search:
                              return SearchWidget();
                            // Container();
                            case NavBarItem.profile:
                              return AccountScreen();
                            // BackgroundVideo();
                            // Container();
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                bottomNavigationBar: StreamBuilder(
                  stream: _bottomNavBar.itemStream,
                  initialData: _bottomNavBar.defaultItem,
                  builder: (BuildContext context,
                      AsyncSnapshot<NavBarItem> snapshot) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey.withOpacity(0.4)))),
                      child: BottomNavigationBar(
                        elevation: 0.9,
                        iconSize: 21,
                        unselectedFontSize: 10.0,
                        selectedFontSize: 10.0,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: snapshot.data!.index,
                        onTap: _bottomNavBar.pickItem,
                        items: [
                          BottomNavigationBarItem(
                            label: "Trang chủ",
                            icon: SizedBox(
                              child: SvgPicture.asset(
                                "assets/icons/home.svg",
                                color: Colors.grey.shade700,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                            activeIcon: SizedBox(
                              child: SvgPicture.asset(
                                "assets/icons/home-active.svg",
                                color: Colors.white,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "Thể loại",
                            icon: SvgPicture.asset(
                              "assets/icons/layers.svg",
                              color: Colors.grey.shade700,
                              height: 25.0,
                              width: 25.0,
                            ),
                            activeIcon: SizedBox(
                              child: SvgPicture.asset(
                                "assets/icons/layers-active.svg",
                                color: Colors.white,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "Tìm kiếm",
                            icon: SvgPicture.asset(
                              "assets/icons/search.svg",
                              color: Colors.grey.shade700,
                              height: 25.0,
                              width: 25.0,
                            ),
                            activeIcon: SizedBox(
                              child: SvgPicture.asset(
                                "assets/icons/search-active.svg",
                                color: Colors.white,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "Cá nhân",
                            icon: SvgPicture.asset(
                              "assets/icons/profile.svg",
                              color: Colors.grey.shade700,
                              height: 25.0,
                              width: 25.0,
                            ),
                            activeIcon: SizedBox(
                              child: SvgPicture.asset(
                                "assets/icons/profile-active.svg",
                                color: Colors.white,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ),
        // !isOnline
        //     ?
        // // SplashScreen()
        //      const Center(
        //             child: CircularProgressIndicator(),
        //           )
        //     : const SizedBox(),
      ],
    );
  }
}
