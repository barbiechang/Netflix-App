import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import './updateForm.dart';
import 'Lib2/addForm.dart';
import 'Lib2/database.dart';
import 'topic_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List _widgetOptions = [
    _Home(),
    _Search(),
    _Favorite(),
    _Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        home: Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                icon:
                    Icon(color: Color.fromARGB(255, 255, 255, 255), Icons.home),
                label: "Home",
                activeIcon: Icon(Icons.home, color: Colors.red),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    color: Color.fromARGB(255, 255, 255, 255), Icons.search),
                label: "Search",
                activeIcon: Icon(Icons.search, color: Colors.red),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    color: Color.fromARGB(255, 255, 255, 255), Icons.favorite),
                label: "Favorite",
                activeIcon: Icon(Icons.favorite, color: Colors.red),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    color: Color.fromARGB(255, 255, 255, 255), Icons.person),
                label: "Profile",
                activeIcon: Icon(Icons.person, color: Colors.red),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "image/IMG_18.JPG",
                    //width: 400,
                  ),
                  Positioned(
                    top: 35, // Adjust the position as needed
                    left: 16, // Adjust the position as needed
                    child: Text(
                      "NETFLIX",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class _Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Color.fromARGB(255, 255, 255, 255),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuTheme(
            data: PopupMenuThemeData(
              color: const Color.fromARGB(255, 28, 27, 27),
            ),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.red),
              onSelected: (String value) {
                print("Selected: $value");
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'item1',
                    child: Container(
                      child: Text(
                        "Action",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item2',
                    child: Container(
                      child: Text(
                        "Anime",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item3',
                    child: Container(
                      child: Text(
                        "Comedies",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item4',
                    child: Container(
                      child: Text(
                        "Critically Acclaimed",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item5',
                    child: Container(
                      child: Text(
                        "Documentaries",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item6',
                    child: Container(
                      child: Text(
                        "Dramas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item7',
                    child: Container(
                      child: Text(
                        "Fantasy",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item8',
                    child: Container(
                      child: Text(
                        "Hollywood",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item9',
                    child: Container(
                      child: Text(
                        "Horror",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item10',
                    child: Container(
                      child: Text(
                        "K-Dramas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item11',
                    child: Container(
                      child: Text(
                        "Kids and Family",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item12',
                    child: Container(
                      child: Text(
                        "Music and Musicals",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item13',
                    child: Container(
                      child: Text(
                        "Romance",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item14',
                    child: Container(
                      child: Text(
                        "Sci-Fi",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'item15',
                    child: Container(
                      child: Text(
                        "Thrillers",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
        title: const Center(
          child: Text("NETFLIX",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 30)),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "image/IMG_4985.JPG",
                  //height: 400,
                  width: 400,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      '     We move under cover and we move as one',
                    ),
                    const Text(
                        '     Through the night, we have one shot to live another day'),
                    const Text(
                        '     We cannot let a stray gunshot give us away'),
                    Text('  Rochambeau!',
                        style: DefaultTextStyle.of(context)
                            .style
                            .apply(fontSizeFactor: 2.0)),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10.0),
                child: Text(
                  "Upcoming Soon",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage("image/IMG_7.JPG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage("image/IMG_8.JPG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage("image/IMG_10.JPG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage("image/IMG_11.JPG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(top: 10, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(90),
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                      image: AssetImage("image/IMG_12.JPG"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10.0),
                child: Text(
                  "New Movies",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_5.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_9.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_6.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_15.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_14.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_13.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10.0),
                child: Text(
                  "Animations",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_15.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_14.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_13.JPG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 150,
                        margin: const EdgeInsets.only(top: 10, right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          image: const DecorationImage(
                            image: AssetImage("image/IMG_13.JPG"),
                            fit: BoxFit.cover,
                          ),
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
    );
  }
}
