import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_dashboard.dart';
import 'package:medica/MedicaPages/MedicaHome/medica_selectpackage.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:table_calendar/table_calendar.dart';

class MedicaBookAppoinment extends StatefulWidget {
  final String? type;
  const MedicaBookAppoinment({super.key,required this.type});

  @override
  State<MedicaBookAppoinment> createState() => _MedicaBookAppoinmentState();
}

class _MedicaBookAppoinmentState extends State<MedicaBookAppoinment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int selecthour = 3;
  List<String> hour = ["09:00 AM","09:30 AM","10:00 AM","10:30 PM","11:00 PM","11:30 PM","15:00 PM","15:30 PM","16:00 PM","16:30 PM","17:00 PM","17:30 PM"];
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width/10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.type == "1" ? "Book_Appointment".tr : "Reschedule_Appointment".tr,style: urbanistBold.copyWith(fontSize: 24)),],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select_Date".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/46),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightprimary
                ),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  focusedDay: DateTime.now(),
                  lastDay: DateTime(2050),
                  headerVisible: true,
                  daysOfWeekVisible: true,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Medicacolor.primary,
                        borderRadius: BorderRadius.circular(10)),
                    todayTextStyle: const TextStyle(
                      color: Medicacolor.white,
                    ),
                    selectedDecoration: BoxDecoration(
                        color: Medicacolor.primary,
                        borderRadius: BorderRadius.circular(50)),
                    selectedTextStyle: const TextStyle(
                      color: Medicacolor.white,
                    ),
                  ),
                  shouldFillViewport: false,
                  currentDay: _selectedDay,
                  calendarFormat: CalendarFormat.month,
                  pageAnimationEnabled: false,
                  headerStyle: HeaderStyle(
                      headerMargin: EdgeInsets.symmetric(
                          vertical: height/96, horizontal: width/26),
                      leftChevronIcon: Container(
                        height: height/22,
                        width: width/8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Medicacolor.textgray)),
                        child:const  Icon(
                          Icons.chevron_left,
                          color:  Medicacolor.textgray,
                        ),
                      ),
                      rightChevronIcon: Container(
                          height: height/22,
                          width: width/8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Medicacolor.textgray)),
                          child:const  Icon(Icons.chevron_right,
                              color: Medicacolor.textgray)),
                      formatButtonVisible: false,
                      decoration:  BoxDecoration(
                        color:  themedata.isdark ? Medicacolor.darkblack : Medicacolor.lightprimary,
                      ),
                      titleCentered: true,
                      titleTextStyle: urbanistBold.copyWith(
                        fontSize: 14
                      )),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      // String convertdate =
                      // FormatedDate(_selectedDay.toString());
                      // selectdate = convertdate;
                    });
                  },
                ),
              ),
              SizedBox(height: height/36),
              Text("Select_Hour".tr,style: urbanistBold.copyWith(fontSize: 18)),
              SizedBox(height: height/36),
              GridView.builder(
                itemCount: hour.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                 crossAxisSpacing: 10,
                childAspectRatio: (height/1) /(width/1.3)
              ), itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Medicacolor.transparent,
                  highlightColor: Medicacolor.transparent,
                  onTap: () {
                    setState(() {
                      selecthour = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all( color: selecthour == index
                            ? Medicacolor.transparent
                            : Medicacolor.primary),
                        color: selecthour == index
                            ? Medicacolor.primary
                            : Medicacolor.transparent),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: width / 26),
                      child: Center(
                        child: Text(hour[index],
                            style: urbanistMedium.copyWith(
                                fontSize: 16,
                                color: selecthour == index
                                    ? Medicacolor.white
                                    : Medicacolor.primary)),
                      ),
                    ),
                  ),
                );
              },)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/96),
        child: InkWell(
          splashColor: Medicacolor.transparent,
          highlightColor: Medicacolor.transparent,
          onTap: () {
            if(widget.type == "1"){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MedicaSelectPackage();
              },));
            }else{
              reschedulsuccess();
            }
            },
          child: Container(
            height: height/16,
            width: width/1,
            decoration: BoxDecoration(
              color: Medicacolor.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: Text("Next".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.white),)),
          ),
        ),
      ),
    );
  }
  reschedulsuccess() async {
    return await showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: themedata.isdark ? Medicacolor.darkblack : Medicacolor.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(52)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 46, vertical: height / 46),
              child: Column(
                children: [
                  Image.asset(MedicaPngImg.booksuccess,height: height/6,fit: BoxFit.fill),
                  SizedBox(height: height/36),
                  Text("Rescheduling_Success".tr,style: urbanistBold.copyWith
                    (fontSize: 24,color: Medicacolor.primary),textAlign: TextAlign.center,),
                  SizedBox(height:height/86),
                  Text("Appointment_successfully_changed_You_will_receive_a_receive_a_notification_and_the_doctor_you_selected_will_contact_you".tr,
                      style: urbanistRegular.copyWith(fontSize: 16),textAlign: TextAlign.center),
                  SizedBox(height: height/36),
                  InkWell(
                    splashColor:Medicacolor.transparent,
                    highlightColor:Medicacolor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MedicaDashboard();
                      },));
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:Medicacolor.primary,
                      ),
                      child: Center(
                        child: Text("View_Appointment".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
                      ),
                    ),
                  ),
                  SizedBox(height: height/46),
                  InkWell(
                    splashColor:Medicacolor.transparent,
                    highlightColor:Medicacolor.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/15,
                      width: width/1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: themedata.isdark ? Medicacolor.lblack : Medicacolor.lightprimary,
                      ),
                      child: Center(
                        child: Text("Cancel".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.primary)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        context: context);
  }
}
