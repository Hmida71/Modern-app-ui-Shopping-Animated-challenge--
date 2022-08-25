import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  double indicatorPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                          radius: 140, backgroundColor: Color(0xff262626)),
                      ImageSlideshow(
                        width: double.infinity,
                        height: 380,
                        initialPage: indicatorPage.toInt(),
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          print('Page changed: $value');
                          setState(() {
                            indicatorPage = value.toDouble();
                          });
                        },
                        autoPlayInterval: 3000,
                        isLoop: true,
                        indicatorRadius: 0,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'images/madam.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'images/madam.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'images/madam.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Image.asset(
                              'images/madam.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, top: 30, bottom: 15),
                        alignment: Alignment.center,
                        child: Text(
                          "Find your perfect match electronic",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.4,
                                  fontSize: 38)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.center,
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and  industry. Lorem Ipsum has been the industry's .",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.4,
                                  height: 1.8,
                                  fontSize: 16)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DotsIndicator(
                        dotsCount: 4,
                        position: indicatorPage,
                        decorator: const DotsDecorator(
                          color: Colors.black26, // Inactive color
                          activeColor: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DrawerScreen(),
                                ));
                              },
                              child: const Text(
                                "Skip Now",
                                style:
                                    TextStyle(letterSpacing: 1.4, fontSize: 16),
                              ),
                            ),
                            Container(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DrawerScreen(),
                                ));
                              },
                              child: const CircleAvatar(
                                radius: 32,
                                backgroundColor: Color(0xff1c1c1c),
                                child: Icon(Icons.chevron_right, size: 40),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      // controller: zoomDrawerController,
      menuScreen: const Menu(),
      mainScreen: Home(),
      borderRadius: 24.0,
      showShadow: false,
      angle: 0.0,
      style: DrawerStyle.defaultStyle,
      isRtl: false,
      // drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: 275,
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var hie = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          // alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: hie,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        ZoomDrawer.of(context)!.close();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/madam.png"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Lillie Margan",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      height: 4,
                      endIndent: 40,
                      thickness: 4,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Shop",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Categories",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("WishList",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("My Cart",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Track Order",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Support",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("FAQ",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      height: 4,
                      endIndent: 40,
                      thickness: 4,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Logout",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 22))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List btnList = ["Recomended", "phone", "laptop", "spects"];
  List items = [
    {
      "name": "Apple Watch Series 6",
      "price": "640",
      "img": "images/appel watch s6.png"
    },
    {"name": "apple AirPods pro", "price": "270", "img": "images/airpods.png"},
    {"name": "Apple AirPods Max", "price": "499", "img": "images/applemax.png"},
    {"name": "MacBook Pro", "price": "1499", "img": "images/macbook pro.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.open();
            },
            child: const Icon(Icons.menu, color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Shopping",
            style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                    width: double.infinity,
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Color(0xff4e4d51),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text("Prome",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)))),
                              const SizedBox(height: 20),
                              Text("Up to",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                              Row(
                                children: [
                                  Text("30%",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 45,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                  Text("off",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                ],
                              )
                            ],
                          ),
                        )),
                        Expanded(child: Container()),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 0, right: 50),
                    padding: const EdgeInsets.only(bottom: 44),
                    // color: Colors.red,
                    // height: 260,
                    width: 150,
                    child: Image.asset(
                      "images/banner.png",
                      fit: BoxFit.contain,
                    )),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      btnList.length,
                      (index) => Container(
                          margin: EdgeInsets.only(left: index == 0 ? 0 : 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: index == 0
                                ? const Color(0xff222222)
                                : const Color.fromARGB(255, 224, 224, 224),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(btnList[index],
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? Colors.white
                                          : Colors.black)))),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffc3c6c7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(items[0]["img"])),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(items[0]["name"],
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)))),
                              Expanded(
                                  child: Text(items[0]["price"] + "\$",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black38)))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffc3c6c7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(items[1]["img"])),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(items[1]["name"],
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)))),
                              Expanded(
                                  child: Text(items[1]["price"] + "\$",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black38)))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffc3c6c7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(items[2]["img"])),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(items[2]["name"],
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)))),
                              Expanded(
                                  child: Text(items[2]["price"] + "\$",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black38)))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffc3c6c7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(items[3]["img"])),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(items[3]["name"],
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)))),
                              Expanded(
                                  child: Text(items[3]["price"] + "\$",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black38)))),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
