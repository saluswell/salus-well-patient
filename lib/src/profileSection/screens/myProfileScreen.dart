
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/utils/themes.dart';
import '../../../res.dart';
import 'myProfileTab/aboutTab.dart';
import 'myProfileTab/reviewsTab.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: AppColors.appcolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: SizedBox(
                            height: 45,
                            width: 45,
                            child: Card(
                              color: AppColors.whitecolor,
                              elevation: 4,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 4,
                                    top: 4,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.appcolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        Res.articelsImagepng,
                        height: 170,
                        width: 170,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(4.7)",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 14,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Irfa Nadeem",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 16,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Sohaibjameel3@gmail.com",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 11,
                            color: AppColors.blackcolor.withOpacity(0.6),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Neutrition",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 12,
                            color: AppColors.appcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                   //   toNext(context: context, widget: EditProfileScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: AppColors.lightwhitecolor),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Res.editicon),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Edit Profile",
                              style: fontW5S12(context)!.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
                labelStyle: fontW4S12(context)!.copyWith(
                    color: AppColors.lightwhitecolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
                indicatorPadding: EdgeInsets.only(),
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.appcolor,
                unselectedLabelColor: AppColors.lightdarktextcolor,
                padding: EdgeInsets.only(),
                tabs: [
                  Tab(
                    text: "Reviews(14)",
                  ),
                  Tab(
                    text: "About",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                ReviewListTabScreen(),
                AboutUserProfileTabScreen()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
