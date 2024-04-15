import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class Step {
  Step(this.title, [this.isExpanded = false]);

  String title;
  bool isExpanded;
}

List<Step> getSteps() {
  return [
    Step('What is Medica?'),
    Step('How to start meeting with Medica?'),
    Step('How do I cancel an Appointment?'),
    Step('How do I save the recording?'),
    Step('How do I exit the app?'),
  ];
}

class MedicaHelpcenter extends StatefulWidget {
  const MedicaHelpcenter({Key? key}) : super(key: key);

  @override
  State<MedicaHelpcenter> createState() => _MedicaHelpcenterState();
}

class _MedicaHelpcenterState extends State<MedicaHelpcenter> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  List<String> faqtext = ["General","Account","Service","Payment"];
  int selected = 0;
  final List<Step> _steps = getSteps();
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: width/10,
          toolbarHeight: height/13,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Help_Center".tr,style: urbanistBold.copyWith(fontSize: 24)),
              Image.asset(MedicaPngImg.moreoption,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
            ],
          ),
          bottom: TabBar(
              dividerColor: Medicacolor.lightgrey,
              unselectedLabelStyle: urbanistSemiBold.copyWith(fontSize: 18),
              labelStyle: urbanistSemiBold.copyWith(fontSize: 18),
              indicatorColor: Medicacolor.primary,
              labelPadding: EdgeInsets.symmetric(vertical: height/56),
              unselectedLabelColor: Medicacolor.textgray,
              labelColor: Medicacolor.primary,
              tabs: [
                Text("FAQ".tr),
                Text("Contact_us".tr),
              ]),
        ),
        body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 20,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Medicacolor.transparent,
                                  highlightColor: Medicacolor.transparent,
                                  onTap: () {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  child: Container(
                                    height: height / 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all( color: selected == index
                                            ? Medicacolor.transparent
                                            : Medicacolor.primary),
                                        color: selected == index
                                            ? Medicacolor.primary
                                            : Medicacolor.transparent),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: width / 16),
                                      child: Center(
                                        child: Text(faqtext[index],
                                            style: urbanistMedium.copyWith(
                                                fontSize: 16,
                                                color: selected == index
                                                    ? Medicacolor.white
                                                    : Medicacolor.primary)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  width: width / 36,
                                );
                              },
                              itemCount: faqtext.length),
                        ),
                        SizedBox(height: height/36),
                        TextFormField(
                          cursorColor: Medicacolor.lightgrey,
                          style: urbanistSemiBold.copyWith(fontSize: 16),
                          // controller: email,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(MedicaPngImg.search,height: height/36,),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image.asset(MedicaPngImg.filter,height: height/56,color: Medicacolor.primary),
                              ),
                              fillColor: themedata.isdark ?  Medicacolor.darkblack : Medicacolor.container,
                              filled: true,
                              hintText: "Search".tr,
                              hintStyle: urbanistRegular.copyWith(fontSize: 14,color: Medicacolor.textgray),
                              border: const OutlineInputBorder(),
                              enabledBorder:  OutlineInputBorder(
                                borderSide:  BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderSide: const BorderSide(color: Medicacolor.primary),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        SizedBox(height: height/36),
                        ExpansionPanelList(
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _steps[index].isExpanded  = !isExpanded;
                            });
                          },
                          children: _steps.map<ExpansionPanel>((Step step) {
                            return ExpansionPanel(
                              canTapOnHeader: false,
                              backgroundColor: themedata.isdark
                                  ? Medicacolor.darkblack
                                  : Medicacolor.white,
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  minLeadingWidth: 0.8,
                                  title: Text(step.title,
                                      style: urbanistBold.copyWith(fontSize: 18)),
                                );
                              },
                              body: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: width/26,vertical: height/66),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: urbanistMedium.copyWith(fontSize: 14,
                                      color: themedata.isdark ? Medicacolor.lightwhite : Medicacolor.lightblack),),
                              ),
                              isExpanded: step.isExpanded,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                    child: Column(
                      children: [
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.service,height: height/36,width: height/36,color: Medicacolor.primary),
                                SizedBox(width: width/26),
                                Text("Customer_Service".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.whatapp,height: height/36,width: height/36,color: Medicacolor.primary),
                                SizedBox(width: width/26),
                                Text("WhatsApp".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.website,height: height/36,width: height/36,color: Medicacolor.primary),
                                SizedBox(width: width/26),
                                Text("Website".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.facebook,height: height/36,width: height/36),
                                SizedBox(width: width/26),
                                Text("Facebook".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.twitter,height: height/36,width: height/36,color: Medicacolor.primary),
                                SizedBox(width: width/26),
                                Text("Twitter".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height/46),
                        Container(
                          height: height/12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/26),
                            child: Row(
                              children: [
                                Image.asset(MedicaPngImg.instagram,height: height/36,width: height/36,color: Medicacolor.primary),
                                SizedBox(width: width/26),
                                Text("Instagram".tr,style: urbanistBold.copyWith(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ]),
      ),
    );
  }
}
