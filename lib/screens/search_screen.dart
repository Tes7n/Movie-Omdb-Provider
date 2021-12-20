import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_provider/providers/movie_provider.dart';
import 'package:movie_provider/utils/utils.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _searchController.addListener(() {
      setState(() {});
    });
    final _provider = Provider.of<MovieProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg bloop.png'), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        controller: _searchController,
                        autofocus: false,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: MColors.mlgrey,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search Movie",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: MColors.mgrey,
                          ),
                          prefixIcon: Image.asset('assets/Frame.png',
                              scale: 2.5, color: MColors.mgrey),
                          suffixIcon: InkWell(
                            onTap: () => _searchController.clear(),
                            child: Image.asset('assets/Group 220.png',
                                scale: 3.0,
                                color: _searchController.text.isNotEmpty
                                    ? MColors.mgrey
                                    : Colors.transparent),
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey.withOpacity(.3),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        cursorColor: const Color(0xff9D9C9C),
                        cursorHeight: 25.0,
                        onSubmitted: (string) {
                          _provider.fetchMovies(string);
                          print(string);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Consumer<MovieProvider>(builder: (c, mProvider, _) {
                      if (mProvider.isLoading == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return MovieCard(
                          movie: mProvider.movieList[0],
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
