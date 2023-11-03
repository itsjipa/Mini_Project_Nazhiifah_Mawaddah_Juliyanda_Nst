import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/service/appointment_service.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/listappointment_provider.dart';
import 'package:provider/provider.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentProc =
        Provider.of<ListAppointmentsProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: FutureBuilder(
        future: appointmentProc.fetchDataAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('You dont have appointment'),
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else {
            final appoint = appointmentProc.appointment;
            debugPrint('$appoint');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(appoint.length, (index) {
                final appointment = appoint[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Constant().colorBar.withOpacity(
                          0.2,
                        ),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            appointment.doctorName,
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              style: Constant().text,
                              children: [
                                TextSpan(
                                  text: 'Type Examination: ',
                                  style: Constant().text.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextSpan(
                                  text: appointment.treatmentType,
                                  style: Constant().text.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          trailing: CircleAvatar(
                            radius: 25,
                            backgroundImage: ExactAssetImage(
                              appointment.picture,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.black,
                            height: 20.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black54,
                                  size: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  appointment.date,
                                  style: Constant().text.copyWith(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.black54,
                                  size: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  appointment.time,
                                  style: Constant().text.copyWith(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Confirmed",
                                  style: GoogleFonts.inriaSans(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF4F6FA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirmation'),
                                          content: const Text(
                                              'Are you sure want to cancel this appointment ? '),
                                          actions: [
                                            TextButton(
                                              onPressed: ()  {
                                                 AppointmentService()
                                                    .deleteAppointmentByDoctorName(
                                                        appointment.doctorName);
                                                
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Yes'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('No'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.inriaSans(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constant().colorButton,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "Reschedule",
                                    style: Constant().textButton.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}

