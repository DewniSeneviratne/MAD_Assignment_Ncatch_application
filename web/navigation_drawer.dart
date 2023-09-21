import 'package:flutter/material.dart';
import 'package:ncatch_nav/rate_us.dart';
import 'package:ncatch_nav/temp_home_page.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [buildHeader(context), buildMenuItems(context)],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: const Color.fromRGBO(0, 193, 84, 1.0),
        child: InkWell(
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TempHomePage(),
            ));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 12 + MediaQuery.of(context).padding.top,
              bottom: 12,
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fgirl&psig=AOvVaw3DsGpQEJPqvzjaVut-MuK4&ust=1694379566012000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCNjbgfS1noEDFQAAAAAdAAAAABAE"),
                ),
                SizedBox(height: 8),
                Text(
                  "Zara Dulvanya",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                Text(
                  "zaradulvan@students.nsbm.ac.lk",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          runSpacing: 8,
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const TempHomePage(),
              )),
            ),
            ListTile(
              title: const Text('FOC Contacts'),
              onTap: () {
                //close navigation drawer before
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TempHomePage(),
                ));
              },
            ),
            ListTile(
              title: const Text('Invite Friends'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Rate Us'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const RatingScreen(),
              )),
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Log out'),
              onTap: () {},
            ),
          ],
        ),
      );
}
