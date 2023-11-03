import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/home_provider.dart';
import 'package:gumsmile_dental_care/view/screen/bookappoint/book_appointment_step1_screen.dart';
import 'package:gumsmile_dental_care/view/screen/list_appointment_screen.dart';
import 'package:gumsmile_dental_care/view/widgets/build_image.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProv, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Row(
                    children: [
                      Align(
                        alignment: FractionalOffset.topLeft,
                        child: CircleAvatar(
                          // ignore: sort_child_properties_last
                          child: const Icon(
                            Icons.person,
                            size: 50,
                          ),
                          backgroundColor: Colors.black.withOpacity(
                            0.1,
                          ),
                          maxRadius: 36.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome, ',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              '${homeProv.username}',
                              style: Constant().textButton.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CarouselSlider.builder(
                  itemCount: homeProv.image.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = homeProv.image[index];
                    return buildImage(image, index);
                  },
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    pageSnapping: false,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(
                      seconds: 3,
                    ),
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 420.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constant().colorPage,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          36.0,
                        ),
                        topRight: Radius.circular(
                          36.0,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                          ),
                          child: Text(
                            'Booking and List',
                            style: Constant().textHeading,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Step1Screen()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 124.0,
                                    height: 113.0,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6.0,
                                          spreadRadius: 4.0,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/feature/img5.jpeg',
                                    ),
                                  ),
                                  Container(
                                    width: 124.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                          10.0,
                                        ),
                                        bottomRight: Radius.circular(
                                          10.0,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 8.0,
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            'Book Appointment',
                                            style: Constant().textFeature,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Text(
                                            'free for first consultation',
                                            style: GoogleFonts.quicksand(
                                              fontSize: 8.0,
                                              color: Colors.blueGrey.shade800,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListAppointmentScreen()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 124,
                                    height: 113,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child:
                                        Image.asset('assets/feature/img6.jpeg'),
                                  ),
                                  Container(
                                    width: 124,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            'Your Appointment',
                                            style: Constant().textFeature,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'List your appointment',
                                            style: GoogleFonts.quicksand(
                                                fontSize: 8,
                                                color: Colors.blueGrey.shade800,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
