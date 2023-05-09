import 'package:flutter/material.dart';
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends State<BottomNavigationBarScreen> {
  int _selectIndex = 0;

  final List<Widget> _children = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  void onTabTapped(int index) {
    setState(() {
      // if (index == 2) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => NewScreen()),
      //   );
      // } else {
      _selectIndex = index;
      // }

      print("Imsndcfghj");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectIndex],
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RouteName.chooseCategoryScreen);
            },
            child: Image.asset(
              ImageUtility.addPostIcon,
              width: 60,
              height: 60,
            ),
          )),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 15.0, color: Colors.black12),
                ],
              ),
              child: Image.asset(
                ImageUtility.bottomBarBg,
                height: 80,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: BottomBarWidget(
                    onTap: () {
                      onTabTapped(0);
                    },
                    title: "Home",
                    image: ImageUtility.homeIcon,
                    currentIndex: 0,
                    selectIndex: _selectIndex,
                  )),
                  Expanded(
                      child: BottomBarWidget(
                    onTap: () {
                      onTabTapped(1);
                    },
                    title: "Chat",
                    image: ImageUtility.chatIcon,
                    currentIndex: 1,
                    selectIndex: _selectIndex,
                  )),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                      child: BottomBarWidget(
                    onTap: () {
                      onTabTapped(2);
                    },
                    title: "My Add",
                    image: ImageUtility.myAddIcon,
                    currentIndex: 2,
                    selectIndex: _selectIndex,
                  )),
                  Expanded(
                      child: BottomBarWidget(
                    onTap: () {
                      onTabTapped(3);
                    },
                    title: "Profile",
                    image: ImageUtility.profileIcon,
                    currentIndex: 3,
                    selectIndex: _selectIndex,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );

    // return Container(
    //   color: Colors.white12,
    //   child: ListView.builder(itemBuilder: (context,inde){
    //     return Text("inde  ds s  s s ds ds d sd sd sd s ds dx$inde");
    //   }),
    // );
  }
}
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Chat'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Add'),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        await googleSignIn.signOut();
        Navigator.pushNamedAndRemoveUntil(context, RouteName.logInScreen, (route) => false);
      },
      child: Center(child: Text('Profile \n Log out',textAlign: TextAlign.center,)),
    );
  }
}


class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Center(
        child: Text('This is a new screen'),
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  final int currentIndex;
  final int selectIndex;

  const BottomBarWidget(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.image,
      required this.currentIndex,
      required this.selectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              color: currentIndex == selectIndex
                  ? ColorUtility.color152D4A
                  : ColorUtility.colorB0B9C3,
              height: 25,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: StyleUtility.bottomTextStyle.copyWith(
                  color: currentIndex == selectIndex
                      ? ColorUtility.color152D4A
                      : ColorUtility.colorB0B9C3),
            ),
          ],
        ),
      ),
    );
  }
}
