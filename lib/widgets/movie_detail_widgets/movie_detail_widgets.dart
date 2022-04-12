import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/movie_detail_controller.dart';
import 'package:flutter_list_movie/model/movie_detail.dart';
import 'package:flutter_list_movie/widgets/movie_detail_widgets/movie_casts_widget.dart';
import 'package:flutter_list_movie/widgets/movie_detail_widgets/similar_movies_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailWidget extends StatelessWidget {
 MovieDetailWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final MovieDetail movie;
  String? outputDate = "";

  final currencyFormatter = NumberFormat();
  var inputFormat = DateFormat('yyyy-MM-dd');
  var outputFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.white54,
                    child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                            ))),
                  ),
                  AspectRatio(
                      aspectRatio: 3 / 2,
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image:
                          "https://image.tmdb.org/t/p/original/" +
                              movie.backPoster)),
                ],
              ),
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(1.0)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 1],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  left: 10.0,
                  child: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white10,
                              highlightColor: Colors.white30,
                              enabled: true,
                              child: SizedBox(
                                height: 120.0,
                                child: AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              5.0),
                                          color: Colors.black12,
                                        ))),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5.0)),
                              height: 120.0,
                              child: AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5.0),
                                    child: FadeInImage.memoryNetwork(
                                        placeholder:
                                        kTransparentImage,
                                        image:
                                        "https://image.tmdb.org/t/p/w200/" +
                                            movie.poster),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width -
                              140,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            children: [
                              Text(
                          movie.title,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Ngày phát hành : " +
                                        outputDate!.toString(),
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight:
                                        FontWeight.w200),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                left: 5.0,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          EvaIcons.arrowIosBack,
                          size: 25.0,
                        ))),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    EvaIcons.clockOutline,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    getDuration(movie.runtime),
                    style: const TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:   movie.genres.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                            const EdgeInsets.only(right: 5.0),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(30.0)),
                                    color: Colors.white
                                        .withOpacity(0.1)),
                                child: Text(
                                  movie.genres[index].name,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      height: 1.4,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("TỔNG QUAN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white.withOpacity(0.5))),
              const SizedBox(
                height: 10.0,
              ),
              Text(  movie.overview,
                  style: const TextStyle(
                      height: 1.5,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration:
          BoxDecoration(color: Colors.white.withOpacity(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("THÔNG TIN NHÂN VẬT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white.withOpacity(0.5))),
              const SizedBox(
                height: 10.0,
              ),
              MovieCasts(
                movieId: movie.id,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text("GIỚI THIỆU",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.white.withOpacity(0.5))),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trạng thái:",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.5))),
                  const Text(
                      "Hoàn thành"
                      // state.movie.status
                      ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ngân sách:",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.5))),
                  Text(
                      "\$" +
                          currencyFormatter
                              .format(  movie.budget),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ))
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Doanh thu:",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white.withOpacity(0.5))),
                  Text(
                      "\$" +
                          currencyFormatter
                              .format( movie.revenue),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ))
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          decoration:
          BoxDecoration(color: Colors.white.withOpacity(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text("PHIM KHÁC",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.white.withOpacity(0.5))),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: SimilarMoviesWidget(
                  movieId: movie.id,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
  String getDuration(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    print("giờ " + parts.toString());
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}phút';
  }
}
