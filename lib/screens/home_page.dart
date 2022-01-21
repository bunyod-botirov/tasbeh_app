import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  String zikr = "Subhan' Allah";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/i2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              zikr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                // color: Colors.black,
              ),
            ),
            Text(
              "$count",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                // color: Colors.black,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              child: const Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 100,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.all(0),
                shape: const CircleBorder(),
                fixedSize: const Size(120, 120),
              ),
              onPressed: () {
                if (count >= 99) {
                  count = 0;
                } else {
                  count += 1;
                }
                zikrOzgarishi();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.replay_outlined),
        onPressed: () {
          count = 0;
          zikrOzgarishi();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  void zikrOzgarishi() {
    if (count >= 0 && count < 33) {
      zikr = "Subhan' Allah";
    } else if (count >= 33 && count < 66) {
      zikr = "Alhamdulillah";
    } else if (count >= 66 && count < 99) {
      zikr = "Allah hu akbar";
    }
    setState(() {});
  }
}
