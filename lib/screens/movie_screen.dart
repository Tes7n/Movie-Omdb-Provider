import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_provider/models/models.dart';
import 'package:movie_provider/utils/utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class MovieScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              MoviePosterView(
                movie: movie,
              ),
              ActionBar(),
              RatingCard(
                movie: movie,
              ),
              InfoCard(
                movie: movie,
              ),
              AboutCard(
                movie: movie,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final MovieModel movie;
  const AboutCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: MColors.mViolet,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "Plot",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Text(
                    movie.plot!,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.grey[600], fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "Director",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: NameCardWrapper(
                    nameList: movie.director!,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "Actors",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: NameCardWrapper(
                    nameList: movie.actors!,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "Writer",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: NameCardWrapper(
                    nameList: movie.writer!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NameCardWrapper extends StatelessWidget {
  final String nameList;
  NameCardWrapper({Key? key, required this.nameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> result = nameList.split(',');
    return Wrap(
      spacing: 15.w,
      runSpacing: 15.h,
      children: result.map((e) => NameCard(name: e)).toList(),
    );
  }
}

class NameCard extends StatelessWidget {
  final String name;
  const NameCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        color: Colors.grey.withOpacity(.2),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Text(
            name.toUpperCase(),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final MovieModel movie;
  const InfoCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: MColors.mViolet,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Group 357.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      SizedBox(
                        width: ScreenUtil().screenWidth / 2,
                        child: Text(
                          movie.year!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Vector.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      SizedBox(
                        width: ScreenUtil().screenWidth / 2,
                        child: Text(
                          movie.country!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Group 356.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      SizedBox(
                        width: ScreenUtil().screenWidth / 2,
                        child: Text(
                          movie.runtime!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/Group 358.png',
                        scale: 3.0,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      SizedBox(
                        width: ScreenUtil().screenWidth / 2,
                        child: Text(
                          movie.language!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingCard extends StatelessWidget {
  final MovieModel movie;
  const RatingCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: MColors.mViolet,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating: 4.2,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        unratedColor: MColors.mdOrange,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: MColors.mOrange,
                        ),
                        onRatingUpdate: (i) {},
                      ),
                      Text(
                        movie.imdbRating!,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: MColors.mOrange),
                      )
                    ],
                  ),
                ),
                Ratings(movie: movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Ratings extends StatelessWidget {
  final MovieModel movie;
  const Ratings({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: movie.ratings!.map((e) => RatingsRow(rating: e)).toList(),
      ),
    );
  }
}

class RatingsRow extends StatelessWidget {
  const RatingsRow({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth / 2,
            child: Text(
              rating.source!,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.grey[600], fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            rating.value!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: MColors.mlgrey, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 70.0,
              width: 70.0,
              color: MColors.mViolet,
              child: Image.asset(
                "assets/Vector 27.png",
                scale: 3.0,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 70.0,
              width: 70.0,
              color: MColors.mViolet,
              child: Image.asset(
                "assets/Path-1.png",
                scale: 3.0,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              height: 70.0,
              width: 70.0,
              color: MColors.mViolet,
              child: Image.asset(
                "assets/Path.png",
                scale: 3.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePosterView extends StatelessWidget {
  final MovieModel movie;
  const MoviePosterView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: movie.title!,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ).createShader(
                    Rect.fromLTRB(0, 0, rect.width / 4, rect.height / 4));
              },
              blendMode: BlendMode.dstIn,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(movie.poster!, fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.grey.withOpacity(.4),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        "assets/eva_arrow-ios-back-fill.png",
                        scale: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          movie.title!,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            movie.genre!,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: MColors.mgrey,
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
