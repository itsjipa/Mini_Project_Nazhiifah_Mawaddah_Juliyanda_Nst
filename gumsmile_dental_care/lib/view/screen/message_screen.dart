import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/model/provider/message_provider.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() =>
        context.read<MessageProvider>().insertDataIntoLocal(Constant().data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Message',
          style: Constant().textAppBar,
        ),
      ),
      body: Consumer<MessageProvider>(
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
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
                    ),
                    child: Text(
                      'Active Now',
                      style: Constant().textHeading,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 90,
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
                            width: 65,
                            height: 65,
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
                                    height: 65,
                                    width: 65,
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
                                  margin: const EdgeInsets.all(5.0),
                                  padding: const EdgeInsets.all(3.0),
                                  height: 20,
                                  width: 20,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
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
                        return ListTile(
                          title: Text(dokters.name),
                          trailing: SizedBox(
                            width: 20,
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <SizedBox>[
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.call,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.message_rounded,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
