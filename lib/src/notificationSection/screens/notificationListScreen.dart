import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saluswellpatient/src/notificationSection/models/notificationModel.dart';
import 'package:saluswellpatient/src/notificationSection/services/notificationFirebaseServices.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../../../common/utils/themes.dart';
import '../widgets/notificationTileWidget.dart';

class NotificaionsListScreen extends StatefulWidget {
  const NotificaionsListScreen({Key? key}) : super(key: key);

  @override
  State<NotificaionsListScreen> createState() => _NotificaionsListScreenState();
}

class _NotificaionsListScreenState extends State<NotificaionsListScreen> {
  NotificationFirebaseServices notificationFirebaseServices =
      NotificationFirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.appcolor,
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Notifications",
                style: fontW5S12(context)!.copyWith(
                    fontSize: 27,
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          StreamProvider.value(
              value: notificationFirebaseServices
                  .streamNotifications(FirebaseUtils.progress),
              initialData: [NotificationModelFirebase()],
              builder: (context, child) {
                List<NotificationModelFirebase> notificationsList =
                    context.watch<List<NotificationModelFirebase>>();
                return notificationsList[0].recieverId == null
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Notifications Found!",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackcolor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : notificationsList[0].notificationId == null
                        ? const SpinKitPouringHourGlass(
                            size: 30,
                            color: AppColors.appcolor,
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: notificationsList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: NotificationTileWidget(
                                      notificationModelFirebase:
                                          notificationsList[index],
                                    ),
                                  );
                                })),
                          );
              })
        ],
      ),
    );
  }
}
