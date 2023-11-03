import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/service/firebase_service.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/home_provider.dart';
import 'package:gumsmile_dental_care/view/widgets/profile_item.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: GoogleFonts.roboto(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: FractionalOffset.center,
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(
                  builder: (context, profileProv, _) {
                    return Text(
                      '${profileProv.username}',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    );
                  },
                ),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  // color: Colors.black,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constant().colorButton,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    onPressed: () {
                    
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),

                // Menu
                Profilesetting(
                    title: 'Settings', icon: Icons.settings, onTap: () {}),
                Profilesetting(
                    title: 'Wallet', icon: Icons.wallet, onTap: () {}),
                Profilesetting(
                  title: 'Ask Me',
                  textColor: Colors.black,
                  icon: Icons.question_mark,
                  onTap: () {
                    
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Profilesetting(
                  title: 'Log Out',
                  icon: Icons.logout_outlined,
                  onTap: () => FirebaseService().logOut(context),
                  textColor: Colors.red.shade800,
                  endIcon: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
