import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_provider/models/movie_model.dart';
import 'package:movie_provider/screens/screens.dart';

import '../utils.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: InkWell(
        onTap: () {
          Get.to(() => MovieScreen(movie: movie));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160.h,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: movie.title!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.network(movie.poster!, fit: BoxFit.cover),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.h),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black.withOpacity(.7),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              movie.imdbRating!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "/10",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Group 356.png",
                          scale: 4.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          durationToString(movie.runtime!),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: MColors.mOrange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String durationToString(String minutes) {
  var y = minutes.split(' ');
  int z = int.parse(y[0]);
  var h = z ~/ 60;
  var m = z % 60;
  String time = '${h} hours ${m} minutes';
  return time;
}
