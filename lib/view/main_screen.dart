import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/components/fake_data.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/components/my_colors.dart';
import 'package:tech_blog/components/my_texts.dart';
import 'package:tech_blog/view/profile_screen.dart';
import 'home_screen.dart';



final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatelessWidget {
  Rx<int> selectedIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double bodyMargin = width / 10;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        width: width / 1.3,
        backgroundColor: MyColors.scaffoldBg,
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Image.asset(
                  Assets.images.logo.path,
                  scale: 3,
                ),
              )),
              ListTile(
                title: Text(
                  MyTexts.profile,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {},
              ),
              Divider(
                color: MyColors.dividerColor,
              ),
              ListTile(
                title: Text(MyTexts.aboutTechBlog,
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              Divider(
                color: MyColors.dividerColor,
              ),
              ListTile(
                title: Text(MyTexts.share,
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () async{
                    await Share.share(MyTexts.shareText);
                },
              ),
              Divider(
                color: MyColors.dividerColor,
              ),
              ListTile(
                title: Text(MyTexts.techBlogInGithub,
                    style: Theme.of(context).textTheme.titleMedium),
                onTap: () {},
              ),
              Divider(
                color: MyColors.dividerColor,
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu)),
            Image.asset(
              Assets.images.logo.path,
              height: height / 13.6,
            ),
            Icon(Icons.search),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Stack(
          children: [
            Obx(()=>IndexedStack(
              index: selectedIndex.value,
              children: [
                HomeScreen(bodyMargin: bodyMargin),
                ProfileScreen(),
              ],
            ),),
            Positioned(
                left: 0,
                right: 0,
                bottom: 12,
                child: BottomNav(
                  bodyMargin: bodyMargin,
                  onBottomNavigationTap: (chosenScreen) {
                      selectedIndex.value = chosenScreen;
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final double bodyMargin;
  final Function(int chosenScreen) onBottomNavigationTap;

  const BottomNav(
      {super.key,
      required this.bodyMargin,
      required this.onBottomNavigationTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 10,
      child: Padding(
        padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    onBottomNavigationTap(0);
                  },
                  icon: Image.asset(
                    Assets.icons.home.path,
                    height: 30,
                    width: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.icons.write.path,
                    height: 30,
                    width: 30,
                  )),
              IconButton(
                  onPressed: () {
                    onBottomNavigationTap(1);
                  },
                  icon: Image.asset(
                    Assets.icons.user.path,
                    height: 30,
                    width: 30,
                  )),
            ],
          ),
          height: height / 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(colors: GradientColors.bottomNav)),
        ),
      ),
    );
  }
}
