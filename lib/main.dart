import 'package:flutter/material.dart';
import 'package:pageview_onboarding/HomePage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Onboarding',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Onboarding title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  //all work

  final myController = PageController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<String> names = ["Abed","Reza","Mouneeta","Rafiq vai"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          //scrollDirection: Axis.vertical,
          controller: myController,
          children: [

            Container(
                //color: Colors.yellow,
                child: HomePage(),
            ),

            Container(
                color: Color(0xffFFE5DE),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.asset('assets/images/image2.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Stay organized with team",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "But understanding the contributions our colleagues make to our teams and companies.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],

                ),
            ),

            Container(
              color: Color(0xffDCF6E6),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('assets/images/image3.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Get notified when work happens",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Take control of notifications, collaborate live or on your own time.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],

              ),
            ),

            Container(
              color: Color(0xffDCF6E6),
              child: Column(
                children: names.map((e) => Text(
                  e,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                  ),
                ),).toList(),

              ),
            ),

          ],
        ),
      ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => myController.jumpToPage(2),
                child: Text("Skip"),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: myController,
                  count: 4,
                  effect: WormEffect(),
                  onDotClicked: (index) => myController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut
                  ),
                )
              ),
              TextButton(
                onPressed: () => myController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut
                ),
                child: Text("Next"),
              ),
            ],
          ),
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
