import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaGlobal/medica_color.dart';
import 'package:medica/MedicaGlobal/medica_fonts.dart';
import 'package:medica/MedicaGlobal/medica_images.dart';
import 'package:medica/MedicaPages/MedicaProfile/medica_addnewcard.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';

class MedicaPayments extends StatefulWidget {
  const MedicaPayments({Key? key}) : super(key: key);

  @override
  State<MedicaPayments> createState() => _MedicaPaymentsState();
}

class _MedicaPaymentsState extends State<MedicaPayments> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(MedicaThemecontroler());
  int selectpay = 0;
  List<String> paymentimg = [MedicaPngImg.paypal,MedicaPngImg.google,MedicaPngImg.apple,MedicaPngImg.mastercard,MedicaPngImg.mastercard,MedicaPngImg.mastercard];
  List<String> paymentname = ["PayPal","Google Pay","Apple Pay","•••• •••• •••• •••• 4679","•••• •••• •••• •••• 2766","•••• •••• •••• •••• 3892"];
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
            Text("Payments".tr,style: urbanistBold.copyWith(fontSize: 24)),
            Image.asset(MedicaPngImg.scanner,height: height/36,color: themedata.isdark ? Medicacolor.white : Medicacolor.black),
          ],
        ),
      ),
     body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Medicacolor.transparent,
                      highlightColor: Medicacolor.transparent,
                      onTap: () {
                        setState(() {
                          selectpay = index;
                        });
                      },
                      child: Container(
                        height: height/12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: themedata.isdark ? Medicacolor.darkblack : Medicacolor.container,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width/26),
                          child: Row(
                            children: [
                              Image.asset(paymentimg[index].toString(),height: height/32,width: height/32,),
                              SizedBox(width: width/26),
                              Text(paymentname[index].toString(),style: urbanistBold.copyWith(fontSize: 18)),
                              const Spacer(),
                              Text("Connected".tr,style: urbanistBold.copyWith(fontSize: 16,color: Medicacolor.primary)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (context, index) {
                return SizedBox(height: height/46);
              }, itemCount: paymentname.length),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/26,vertical: height/36),
        child:  InkWell(
          splashColor:Medicacolor.transparent,
          highlightColor:Medicacolor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MedicaAddnewcard();
            },));
          },
          child: Container(
            height: height/15,
            width: width/1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:  Medicacolor.primary,
            ),
            child: Center(
              child: Text("Add_New_Card".tr,style: urbanistSemiBold.copyWith(fontSize: 16,color:Medicacolor.white)),
            ),
          ),
        ),
      ),
    );
  }
}
