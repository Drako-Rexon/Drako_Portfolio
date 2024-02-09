import 'package:flutter/material.dart';
import 'package:portfolio_drako/utils/colors.dart';
import 'package:portfolio_drako/utils/image_constants.dart';
import 'package:portfolio_drako/utils/important_function.dart';
import 'package:portfolio_drako/widgets/tap_icon_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.func});
  final func;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasCallSupport = false;
  bool skills = false;

  //todo
  changeTheme() async {
    final pref = await SharedPreferences.getInstance();
    bool? theme = pref.getBool("theme");
    if (theme == null || theme == false) {
      pref.setBool("theme", true);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List socialIcon = [
      TapIconwidget(
        icon: SimpleIcons.github,
        onTap: () async {
          var url = Uri.https('github.com', '/Drako-Rexon');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
      ),
      TapIconwidget(
        icon: SimpleIcons.twitter,
        onTap: () async {
          var url = Uri.https('twitter.com', '/drako_rexon');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
      ),
      TapIconwidget(
        icon: SimpleIcons.linkedin,
        onTap: () async {
          var url = Uri.https('linkedin.com', '/in/abhishek-kayal-drako/');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        },
      ),
      TapIconwidget(
          icon: SimpleIcons.gmail,
          onTap: () async {
            launchUrlCustom(
                url: 'drakocodeforever@gmail.com', scheme: 'mailto');
          }),
    ];
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => desktopHomepage(context, socialIcon),
      mobile: (BuildContext context) => mobileHomepage(context),
      tablet: (BuildContext context) => tabletHomepage(context),
    );
  }

  Scaffold desktopHomepage(BuildContext ctx, socialIcon) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: CircleAvatar(
                      radius: 110,
                      backgroundColor: Colors.yellowAccent,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 105,
                        child: CircleAvatar(
                          radius: 95,
                          backgroundImage: AssetImage(personImage),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abhishek Kayal (Drako)',
                      style: TextStyle(
                        letterSpacing: 1.8,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(
                        letterSpacing: 1.4,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                        children: List.generate(
                            socialIcon.length,
                            (index) => Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: socialIcon[index]))),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    '3+\nYears of work\nExperience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.4,
                      color: Theme.of(ctx).secondaryHeaderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    '50+\nCompleted\nprojects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.4,
                      color: Theme.of(ctx).secondaryHeaderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    '20+\nSatisfied\ncustomers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.4,
                      color: Theme.of(ctx).secondaryHeaderColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () => launchUrlCustom(
                      url:
                          'https://drive.google.com/uc?export=download&id=1GKFmznrlEpeXBjTTrcy2d16XFCyflrDS'),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Download CV  ',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Icon(
                          Icons.file_download_outlined,
                          color: primaryColor,
                          weight: 10,
                          size: 34,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO: apply phone number for tablet and mobile devices
                    _hasCallSupport
                        ? launchUrlCustom(url: '+919310708784', scheme: 'tel')
                        : launchUrlCustom(url: '+919310708784', scheme: 'tel');
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(ctx).backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Contact Me   ',
                          style: TextStyle(
                            color: Theme.of(ctx).secondaryHeaderColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Icon(
                          Icons.call,
                          color: Theme.of(ctx).secondaryHeaderColor,
                          weight: 10,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 700,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Theme.of(ctx).backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            skills = !skills;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              color: skills
                                  ? Theme.of(ctx).backgroundColor
                                  : Theme.of(ctx).scaffoldBackgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Center(
                            child: Text(
                              'Portfolio',
                              style: TextStyle(
                                letterSpacing: 1.4,
                                color: Theme.of(ctx).secondaryHeaderColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            skills = !skills;
                          });
                        },
                        child: Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                              color: skills
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(ctx).backgroundColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Center(
                            child: Text(
                              'Skills',
                              style: TextStyle(
                                letterSpacing: 1.4,
                                color: Theme.of(ctx).secondaryHeaderColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 800,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (ctx, ind) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              image: AssetImage(portfolioImage),
                              fit: BoxFit.fill)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '© Abhishek Kayal (Drako). 2024 All rights reserved',
                  style: TextStyle(
                    color: Theme.of(ctx).secondaryHeaderColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  skillSets() {
    return Container();
  }

  mobileHomepage(BuildContext context) {
    return Container();
  }

  tabletHomepage(BuildContext context) {
    return Container();
  }
}
