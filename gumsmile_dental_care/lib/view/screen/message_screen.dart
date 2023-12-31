import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/doctor_provider.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<DoctorProvider>().insertDataIntoLocal(Constant().data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DoctorProvider>(
        builder: (context, dataProvider, _) {
          final now = DateTime.now();
          dataProvider.sortDoctorOnlineStatus(now);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      "Messages",
                      style: GoogleFonts.roboto(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                          onChanged: (query) {
                            dataProvider.filterDoctors(query);
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Active Now',
                      style: Constant().textHeading,
                    ),
                  ),
                  SizedBox(
                    height: 90.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dataProvider.doctors.length,
                        itemBuilder: (context, index) {
                          final doctors = dataProvider.doctors[index];
                          final isOnline =
                              dataProvider.isDoctorOnline(doctors, now);
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            width: 65.0,
                            height: 65.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2.0,
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Center(
                                  child: SizedBox(
                                    height: 65.0,
                                    width: 65.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        30.0,
                                      ),
                                      child: Image.asset(
                                        doctors.picture,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(
                                    5.0,
                                  ),
                                  padding: const EdgeInsets.all(
                                    3.0,
                                  ),
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isOnline ? Colors.green : Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      'Chat',
                      style: Constant().textHeading,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataProvider.doctors.length,
                    itemBuilder: (context, index) {
                      final dokters = dataProvider.doctors[index];
                      final workHours = dokters.workHours;
                      final workDays = dokters.workDays;
                      return Card(
                        child: ListTile(
                          title: Text(
                            dokters.name,
                            style: Constant().textAppBar,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: Constant().text,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Work Days: ',
                                    ),
                                    TextSpan(
                                      text: workDays.join(', '),
                                      style: GoogleFonts.inriaSans(
                                        color: Colors.black87,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Work Hours: ',
                                style: Constant().text,
                              ),
                              for (var workHour in workHours)
                                Text(
                                  '${workHour.start.format(context)} - ${workHour.end.format(context)}',
                                  style: GoogleFonts.inriaSans(
                                    color: Colors.black87,
                                    fontSize: 10.0,
                                  ),
                                ),
                            ],
                          ),
                          trailing: SizedBox(
                            width: 20.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <SizedBox>[
                                SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.message_rounded,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
