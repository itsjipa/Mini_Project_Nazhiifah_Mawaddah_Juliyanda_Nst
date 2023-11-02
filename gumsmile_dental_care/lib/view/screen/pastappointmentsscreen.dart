import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/past_provider.dart';
import 'package:provider/provider.dart';

class PastScreen extends StatelessWidget {
  const PastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PastProvider>(
      builder: (context, pastProv, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const<BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          pastProv.data.doctorName,
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: GoogleFonts.inriaSans(
                              fontSize: 11,
                              color: Colors.black54,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Type of Examination:   ',
                                style: GoogleFonts.inriaSans(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: pastProv.data.treatmentType,
                                style: GoogleFonts.inriaSans(
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                        trailing: CircleAvatar(
                          radius: 25,
                          backgroundImage: ExactAssetImage(
                            pastProv.data.picture,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Divider(
                          thickness: 1,
                          height: 20,
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
                                pastProv.data.date,
                                style: GoogleFonts.inriaSans(
                                    color: Colors.black45, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_outlined,
                                color: Colors.black54,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                pastProv.data.time,
                                style: GoogleFonts.inriaSans(
                                    color: Colors.black45, fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    // color: Colors.green, shape: BoxShape.circle
                                    ),
                                child: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Done",
                                style: GoogleFonts.inriaSans(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
