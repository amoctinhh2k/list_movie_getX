import 'dart:html';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/widgets/group.dart';
import 'package:flutter_list_movie/widgets/group_list_date.dart';
import 'package:lottie/lottie.dart';

class AccountScreen extends StatelessWidget {
  bool login=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Cá nhân",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
        body: Column(
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           padding: const EdgeInsets.all(8.0),
            //           decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //               color: Colors.blue),
            //           child: const Center(
            //             child: Text(
            //               "Đăng nhập",
            //               // maxLines: 2,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   height: 1.4,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20.0),
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Expanded(
            //         child: Container(
            //           padding: const EdgeInsets.all(8.0),
            //           decoration: const BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //               color: Colors.grey),
            //           child: const Center(
            //             child: Text(
            //               "Đăng ký",
            //               // maxLines: 2,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   height: 1.4,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20.0),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            (login=true)?Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        // onClick(imageGlobalKey);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            color: Colors.blue),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 10,
                                )),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Lottie.asset(
                                    // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
                                    "assets/img/login.json",
                                    width: 60,
                                    height: 60),
                              ),
                            ),
                            const Expanded(
                              flex: 4,
                              child: Text(
                                "Đăng nhập",
                                // maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 10,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            color: Colors.deepPurpleAccent),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 10,
                                )),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Lottie.asset(
                                    // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
                                    "assets/img/register.json",
                                    width: 60,
                                    height: 60),
                              ),
                            ),
                            const Expanded(
                              flex: 5,
                              child: Text(
                                "Đăng ký",
                                // maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            const Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 10,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):
            Expanded(
              flex: 5,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                TabBar(
                tabs: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.red),
                    child: Row(
                      children: [
                        const Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 10,
                            )),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Lottie.asset(
                              // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
                                "assets/img/play.json",
                                width: 40,
                                height: 40),
                          ),
                        ),
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Lịch sử",
                            // maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.4,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        const Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 10,
                            )),
                      ],
                    ),
                  ),
                  Tab(
                    child:  Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.green),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 10,
                              )),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Lottie.asset(
                                // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
                                  "assets/img/movie_icons.json",
                                  width: 40,
                                  height: 40),
                            ),
                          ),
                          const Expanded(
                            flex: 5,
                            child: Text(
                              "Giỏ phim",
                              // maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          const Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
                    SizedBox(
                      height: 250,
                      child: Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyList(),
                          ), Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyGroup(),
                          )],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(flex: 5, child: MyList()),
          ],
        ));
  }
}
