import 'dart:developer';
import 'dart:ffi';

import 'package:bhart_app/bloc/home_data_bloc.dart';
import 'package:bhart_app/model/home_model.dart';
import 'package:bhart_app/model/metromodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MetroPgae extends StatefulWidget {
  const MetroPgae({super.key});

  @override
  State<MetroPgae> createState() => _MetroPgaeState();
}

var StationList = [
  "AIIMS",
  "Adarsh Nagar",
  "Airport",
  "Akshardham",
  "Alpha 1",
  "Anand Vihar",
  "Arjan Garh",
  "Arthala",
  "Ashok Park Main",
  "Ashram",
  "Azadpur",
  "Badarpur",
  "Badkhal Mor",
  "Bahadurgarh City",
  "Barakhambha Road",
  "Bata Chowk",
  "Bhikaji Cama Place",
  "Botanical Garden",
  "Brigadier Hoshiyar Singh",
  "Central Secretariat",
  "Chandni Chowk",
  "Chawri Bazar",
  "Chhatarpur",
  "Chirag Delhi",
  "Civil Lines",
  "Dabri Mor-Janakpuri South",
  "Dashrath Puri",
  "Delhi Aerocity",
  "Delhi Cantonment",
  "Delhi Gate",
  "Delta 1",
  "Depot",
  "Dhaula Kuan",
  "Dilshad Garden",
  "Durgabai Deshmukh South Campus",
  "Dwarka",
  "Dwarka Mor",
  "Dwarka Sector 10",
  "Dwarka Sector 11",
  "Dwarka Sector 12",
  "Dwarka Sector 13",
  "Dwarka Sector 14",
  "Dwarka Sector 21",
  "Dwarka Sector 8",
  "Dwarka Sector 9",
  "ESI Hospital",
  "East Azad Nagar",
  "East Vinod Nagar - Mayur Vihar-II",
  "Escorts Mujesar",
  "Faridabad Old",
  "GNIDA Office",
  "GTB Nagar",
  "Ghevra Metro station",
  "Ghitorni",
  "Gokulpuri",
  "Golf Course",
  "Govind Puri",
  "Greater Kailash",
  "Green Park",
  "Guru Dronacharya",
  "HUDA City Centre",
  "Haiderpur",
  "Harkesh Nagar",
  "Hauz Khas",
  "Hazrat Nizamuddin",
  "Hindon",
  "IFFCO Chowk",
  "hi",
  "INA",
  "on",
  "ITO",
  "Inderlok",
  "aprastha",
  "ber City",
  "affrabad",
  "ngirpuri",
  "a Masjid",
  "Islamia",
  "uri East",
  "uri West",
  "Janpath",
  "Jasola Apollo",
  "Jasola Vihar Shaheen Bagh",
  "Jawaharlal Nehru Stadium",
  "Jhandewalan",
  "Jhilmil",
  "Johri Enclave",
  "Jor Bagh",
  "Kailash Colony",
  "Kalindi Kunj",
  "Kalkaji Mandir",
  "Kanhiya Nagar",
  "Karkarduma",
  "Karkarduma Court",
  "Karol Bagh",
  "Kashmere Gate",
  "Kaushambi",
  "Keshav Puram",
  "Khan Market",
  "Kirti Nagar",
  "Knowledge Park II",
  "Kohat Enclave",
  "Krishna Nagar",
  "Lajpat Nagar",
  "Lal Qila",
  "Laxmi Nagar",
  "Lok Kalyan Marg",
  "MG Road",
  "Madipur",
  "Majlis Park",
  "Major Mohit Sharma",
  "Malviya Nagar",
  "Mandawali - West Vinod Nagar",
  "Mandi House",
  "Mansarovar Park",
  "Maujpur-Babarpur",
  "Mayapuri",
  "Mayur Vihar-I",
  "Mayur Vihar Pocket I",
  "Mewala Maharajpur",
  "Micromax Moulsari Avenue",
  "Model Town",
  "Mohan Estate",
  "Mohan Nagar",
  "Moolchand",
  "Moti Nagar",
  "Mundka",
  "Mundka Industrial Area",
  "Munirka",
  "NHPC Chowk",
  "NSEZ",
  "Najafgrah",
  "Nangli",
  "Nangloi",
  "Nangloi Railway station",
  "Naraina Vihar",
  "Nawada",
  "Neelam Chowk Ajronda",
  "Nehru Enclave",
  "Nehru Place",
  "Netaji Subhash Place",
  "New Ashok Nagar",
  "New Delhi",
  "Nirman Vihar",
  "Noida City Centre",
  "Noida Electronic City",
  "Noida Sector 101",
  "Noida Sector 137",
  "Noida Sector 142",
  "Noida Sector 143",
  "Noida Sector 144",
  "Noida Sector 145",
  "Noida Sector 146",
  "Noida Sector 147",
  "Noida Sector 148",
  "Noida Sector 15",
  "Noida Sector 16",
  "Noida Sector 18",
  "Noida Sector 34",
  "Noida Sector 50",
  "Noida Sector 51",
  "Noida Sector 52",
  "Noida Sector 59",
  "Noida Sector 61",
  "Noida Sector 62",
  "Noida Sector 76",
  "Noida Sector 81",
  "Noida Sector 83",
  "Okhla Bird Sanctuary",
  "Okhla NSIC",
  "Okhla Vihar",
  "Palam",
  "Panchsheel Park",
  "Pandit Shree Ram Sharma",
  "Pari Chowk",
  "Paschim Vihar East",
  "Paschim Vihar West",
  "Patel Chowk",
  "Patel Nagar",
  "Peera Garhi",
  "Phase 1",
  "Phase 2",
  "Phase 3",
  "Pitam Pura",
  "Pragati Maidan",
  "Pratap Nagar",
  "Preet Vihar",
  "Pul Bangash",
  "Punjabi Bagh",
  "Punjabi Bagh West",
  "Qutub Minar",
  "R.K.Puram",
  "Raj Bagh",
  "Raja Nahar Singh",
  "Rajdhani Park",
  "Rajendra Place",
  "Rajiv Chowk",
  "Rajouri Garden",
  "Ramakrishna Ashram Marg",
  "Ramesh Nagar",
  "Rithala",
  "Rohini East",
  "Rohini Sector 18",
  "Rohini West",
  "Sadar Bazaar Cantonment",
  "Saket",
  "Samaypur Badli",
  "Sant Surdas",
  "Sarai",
  "Sarita Vihar",
  "Sarojini Nagar",
  "Satguru Ram Singh Marg",
  "Sector 28",
  "Sector 42-43",
  "Sector 53-54",
  "Sector 54 Chowk",
  "Sector 55–56",
  "Seelampur",
  "Shadipur",
  "Shahdara",
  "Shaheed Nagar",
  "Shaheed Sthal",
  "Shakurpur",
  "Shalimar Bagh",
  "Shankar Vihar",
  "Shastri Nagar",
  "Shastri Park",
  "Shiv Vihar",
  "Shivaji Park",
  "Shivaji Stadium",
  "Shyam park",
  "Sikandarpur",
  "Sir Vishweshwaraiah Moti Bagh",
  "South Extension",
  "Subhash Nagar",
  "Sukhdev Vihar",
  "Sultanpur",
  "Surajmal Stadium",
  "Tagore Garden",
  "Terminal 1-IGI Airport",
  "Tikri Border",
  "Tikri Kalan",
  "Tilak Nagar",
  "Tis Hazari",
  "Trilokpuri Sanjay Lake",
  "Tughlakabad",
  "Udyog Bhawan",
  "Udyog Nagar",
  "Uttam Nagar East",
  "Uttam Nagar West",
  "Vaishali",
  "Vasant Vihar",
  "Vidhan Sabha",
  "Vinobapuri",
  "Vishwa Vidyalaya",
  "Vodafone Belvedere Towers",
  "Yamuna Bank"
];

class _MetroPgaeState extends State<MetroPgae> {
  late HomeDataBloc homeDataBloc;
  // MetroDetailsModel? metroDetailsModel;
  callGetPromotersDetailsApi() async {
    Map<String, String> data = {"from": from.toString(), "to": to.toString()};
    homeDataBloc.callPostRegistration(data);

    // debugger();
    // print(data);
  }

  @override
  void initState() {
    homeDataBloc = HomeDataBloc();
    getBranchDetails();
    // CheckRess();
    // callGetPromotersDetailsApi();
    // TODO: implement initState
    //callGetPromotersDetailsApi();

    super.initState();
  }

  List<String> path = [];
  List<String> line1 = [];
  List<String> line2 = [];
  List<String> interchange = [];
  List<String> lineEnds = [];

  double? time;
  bool loanding = true;
  Map data = {
    "ds": ["1", "2"],
    "d2": ["22", "23"],
  };
  String? from;
  String? to;
  getBranchDetails() async {
    await homeDataBloc.postmetrocontrollerStream.listen((event) {
      if (event != null) {
        log("e22qce" + event.toString());

        AutoGenerate metroDetailsModel = AutoGenerate.fromJson(event);

        path.addAll(metroDetailsModel.path);
        interchange.addAll(metroDetailsModel.interchange);

        log("e22qce" + path.toString());
        // log("e22qce" + interchange.toString());

        setState(() {
          loanding = false;

          //print(location);
        });
      }
    });
  }

  TextEditingController fromcontroller = TextEditingController();
  TextEditingController tocontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  isDense: false,
                  isExpanded: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Colors.red, width: 1.0),
                    ),
                    isCollapsed: true,
                    border: InputBorder.none,
                  ),
                  hint: Text(
                    'Depart from',
                    style: TextStyle(color: Colors.black),
                  ),
                  items: StationList.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      )).toList(),
                  //value: StationList,
                  onChanged: (value) {
                    setState(() {
                      from = value as String;
                      // isSelected = true;
                      //  selectedSecurity = value!;
                      // accountTypeValidate = true;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 55,
                    width: 450,
                    padding: const EdgeInsets.all(10),
                  ),
                  dropdownStyleData: DropdownStyleData(
                      isOverButton: true,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all()),
                      //  maxHeight: 200,
                      elevation: 10),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  isDense: false,
                  isExpanded: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(color: Colors.red, width: 1.0),
                    ),
                    isCollapsed: true,
                    border: InputBorder.none,
                  ),
                  hint: Text(
                    'Destination',
                    style: TextStyle(color: Colors.black),
                  ),
                  items: StationList.map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      )).toList(),
                  //value: StationList,
                  onChanged: (value) {
                    setState(() {
                      to = value!;
                      // isSelected = true;
                      //  selectedSecurity = value!;
                      // accountTypeValidate = true;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 55,
                    width: 450,
                    padding: const EdgeInsets.all(10),
                  ),
                  dropdownStyleData: DropdownStyleData(
                      isOverButton: true,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all()),
                      //  maxHeight: 200,
                      elevation: 10),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              // TextFormField(
              //   //inputFormatters: inputFormatters,
              //   controller: fromcontroller,

              //   cursorColor: Colors.black,
              //   decoration: InputDecoration(
              //     hintText: "From",
              //     hintStyle:
              //         TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
              //     fillColor: Colors.blue,
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //         width: 1.0,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //         width: 1,
              //       ),
              //     ),
              //     border:
              //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // TextFormField(
              //   //inputFormatters: inputFormatters,
              //   controller: tocontroller,
              //   // validator: validator,
              //   // keyboardType: keyboardType,
              //   // validator:((value) => {
              //   //   valid();
              //   // },
              //   // [
              //   //  style: batchtext2(AppColors.PrimaryMainColor),
              //   // ],
              //   cursorColor: Colors.black,
              //   decoration: InputDecoration(
              //     hintText: "To",
              //     hintStyle:
              //         TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
              //     fillColor: Colors.blue,
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10.0),
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //         width: 1.0,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //       borderSide: BorderSide(
              //         color: Colors.blue,
              //         width: 1,
              //       ),
              //     ),
              //     border:
              //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                // style: ,
                onPressed: () {
                  callGetPromotersDetailsApi();
                  path.clear();
                  interchange.clear();
                },
                child: const Text('Submit'),
              ),
              SizedBox(
                height: 20,
              ),
              // loanding == true
              //     ? Text("")
              //     : Container(
              //         height: 300,
              //         child: ListView.builder(
              //           itemCount: path.length,
              //           itemBuilder: (context, index) {
              //             return Text(
              //               path[index].toString(),
              //               style: TextStyle(color: Colors.orange),
              //             );
              //           },
              //         ),
              //       ),
              loanding == true
                  ? Container()
                  : Container(
                      height: 120,
                      child: EasyStepper(
                        direction: Axis.horizontal,
                        showStepBorder: true,
                        activeStep: path.length,
                        lineLength: 20,
                        stepShape: StepShape.rRectangle,
                        stepBorderRadius: 35,
                        borderThickness: 30,
                        padding: 20,
                        stepRadius: 20,
                        finishedStepBorderColor: Colors.deepOrange,
                        finishedStepTextColor: Colors.deepOrange,
                        finishedStepBackgroundColor: Colors.deepOrange,
                        activeStepIconColor: Colors.deepOrange,
                        //loadingAnimation: 'assets/loading_circle.json',
                        steps: [
                          for (int i = 0; i < path.length; i++)
                            EasyStep(
                              icon: Icon(Icons.add_task_rounded),
                              title: path[i],
                            ),
                          // EasyStep(
                          //   icon: Icon(Icons.category_rounded),
                          //   title: 'Preparing',
                          // ),
                          // EasyStep(
                          //   icon: Icon(Icons.local_shipping_rounded),
                          //   title: 'Shipping',
                          // ),
                          // EasyStep(
                          //   icon: Icon(Icons.door_back_door_outlined),
                          //   title: 'On The Way',
                          // ),
                          // EasyStep(
                          //   icon: Icon(Icons.check_circle_outline_outlined),
                          //   title: 'Delivered',
                          // ),
                          // EasyStep(
                          //   icon: Icon(Icons.reviews_outlined),
                          //   activeIcon: Icon(Icons.reviews_rounded),
                          //   title: 'Add Review',
                          // ),
                        ],
                        onStepReached: (index) =>
                            setState(() => path[index] = index as String),
                      ),
                    ),

              SizedBox(
                height: 30,
              ),
              // Text(
              //   interchange.toString(),
              // ),
              // loanding == true
              //     ? Text("")
              //:
              loanding == true
                  ? Container()
                  : Container(
                      //color: Colors.amber,
                      height: 200,
                      child: ListView.builder(
                        itemCount: interchange.length,
                        itemBuilder: (context, index) {
                          int sum = index + 1;
                          return Text(
                            " $sum . Change Metro :- " +
                                interchange[index].toString(),
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          );
                        },
                      ),
                    ),
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}
