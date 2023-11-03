import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/doctor_provider.dart';
import 'package:gumsmile_dental_care/view/screen/bookappoint/book_appointment_step2_screen.dart';
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<DoctorProvider>().insertDataIntoLocal(Constant().data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'STEP 1 OUT OF 2',
            style: Constant().textAppBar,
          ),
        ),
        body: Consumer<DoctorProvider>(
          builder: (context, step1Prov, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(
                  15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The reason of the visit",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: step1Prov.doctors.length,
                          itemBuilder: (context, index) {
                            final doctor = step1Prov.doctors[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Step2Screen(doctor: doctor),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 2.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: Image.asset(
                                        doctor.picture,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(doctor.name),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        );
  }
}
