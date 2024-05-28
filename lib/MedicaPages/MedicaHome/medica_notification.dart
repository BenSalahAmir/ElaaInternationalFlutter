import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/Service/NotificationService.dart';
import 'package:medica/models/Notification.dart' as custom;
import 'package:shared_preferences/shared_preferences.dart';

class MedicaNotification extends StatefulWidget {
  const MedicaNotification({Key? key}) : super(key: key);

  @override
  State<MedicaNotification> createState() => _MedicaNotificationState();
}

class _MedicaNotificationState extends State<MedicaNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  late Future<List<custom.Notification>> notificationsFuture;
  final NotificationService notificationService = NotificationService();
  String? userId;

  @override
  void initState() {
    super.initState();
    loadUserData().then((_) {
      setState(() {
        notificationsFuture = notificationService.getNotifications(userId!);
      });
    });
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
    if (userId == null) {
      // Handle case where userId is not found in SharedPreferences
      // This could involve showing an error message, redirecting to a login page, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 10,
        title: Row(
          children: [
            Text("Notification".tr, style: urbanistBold.copyWith(fontSize: 24)),
            const Spacer(),
            Image.asset(MedicaPngImg.moreoption, height: height / 36, color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
      body: userId == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<custom.Notification>>(
        future: notificationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notifications'));
          } else {
            List<custom.Notification> notifications = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: notifications.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        custom.Notification notification = notifications[index];
                        return InkWell(
                          splashColor: Medicacolor.transparent,
                          highlightColor: Medicacolor.transparent,
                          onTap: () {
                            // Handle notification tap
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height / 13,
                                    width: height / 13,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Medicacolor.lightprimary, // Adjust color based on notification type
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Image.asset(MedicaPngImg.activecalender, height: height / 56, color: Medicacolor.primary), // Adjust icon based on notification type
                                    ),
                                  ),
                                  SizedBox(width: width / 26),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width / 1.8,
                                        child: Text(notification.title, style: urbanistSemiBold.copyWith(fontSize: 19), maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ),
                                      SizedBox(height: height / 80),
                                      Text(
                                        "${notification.timestamp}", // Format the timestamp as needed
                                        style: urbanistRegular.copyWith(fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  if (notification.isRead != null && !notification.isRead)
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Medicacolor.primary,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 110),
                                        child: Text("New".tr, style: urbanistSemiBold.copyWith(fontSize: 10, color: Medicacolor.white)),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: height / 40),
                              Text(
                                notification.message,
                                style: urbanistRegular.copyWith(fontSize: 15, color: Medicacolor.textgray),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height / 46);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
