import 'package:flutter/material.dart';
import 'package:tech_blog/components/my_texts.dart';
import '../components/fake_data.dart';
import '../gen/assets.gen.dart';
import '../components/my_colors.dart';

class HomeScreen extends StatelessWidget {
  final double bodyMargin;

  const HomeScreen({super.key, required this.bodyMargin});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width / 1.25,
                height: height / 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(homePagePosterMap["imageAsset"]))),
              ),
              Container(
                width: width / 1.25,
                height: height / 4.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: GradientColors.homePosterCoverGradient)),
              ),
              Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(width / 12, 0, width / 12, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homePagePosterMap['writer'] +
                                  '_' +
                                  homePagePosterMap['date'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  homePagePosterMap['view'],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          homePagePosterMap['title'],
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tagList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 8, index == 0 ? bodyMargin : 15, 8),
                  child: MainTags(index: index),
                );
              },
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  Assets.icons.bluePen.path,
                  color: MyColors.seeMore,
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  MyTexts.viewHottestBlogs,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 3.5,
            child: ListView.builder(
              itemCount: blogList.getRange(0, 5).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 5.3,
                        width: width / 2.5,
                        child: Stack(
                          children: [
                            Container(
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: AssetImage(homePagePosterMap["imageAsset"]),
                                      fit: BoxFit.cover)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradientColors.blogPost)),
                            ),
                            Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogList[index].views,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: SizedBox(
                            width: width / 2.4,
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              blogList[index].title,
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
            child: Row(
              children: [
                Image.asset(
                  Assets.icons.microphon.path,
                  color: MyColors.seeMore,
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  MyTexts.viewHottestPodcasts,
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 3.5,
            child: ListView.builder(
              itemCount: blogList.getRange(0, 5).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 5.3,
                        width: width / 2.5,
                        child: Stack(
                          children: [
                            Container(
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: AssetImage(homePagePosterMap["imageAsset"]),
                                      fit: BoxFit.cover)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradientColors.blogPost)),
                            ),
                            Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          blogList[index].views,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SizedBox(
                            width: width / 2.4,
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              blogList[index].title,
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

class MainTags extends StatelessWidget {
  final int index;

  const MainTags({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: GradientColors.tags)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Image.asset(
              Assets.icons.hashtagicon.path,
              color: Colors.white,
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
