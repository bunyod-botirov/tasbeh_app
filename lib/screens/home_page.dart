import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _zikr = "Subhan' Allah";
  int _count = 0;
  bool _lightMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_lightMode
                ? "./assets/image_light.jpeg"
                : "./assets/image_dark.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              _zikr,
              style: TextStyle(
                color: color(),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                // color: Colors.black,
              ),
            ),
            Text(
              "$_count",
              style: TextStyle(
                color: color(),
                fontSize: 50,
                fontWeight: FontWeight.bold,
                // color: Colors.black,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              child: Icon(
                Icons.fingerprint,
                color: color(),
                size: 100,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
                onPrimary: Colors.grey,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.all(0),
                shape: const CircleBorder(),
                fixedSize: const Size(120, 120),
              ),
              onPressed: () {
                if (_count >= 99) {
                  _count = 0;
                } else {
                  _count += 1;
                }
                zikrOzgarishi();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          const Spacer(flex: 1),
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            splashColor: Colors.grey,
            highlightElevation: 0,
            child: Icon(
              Icons.replay_outlined,
              color: color(),
            ),
            onPressed: () {
              _count = 0;
              zikrOzgarishi();
            },
          ),
          const Spacer(flex: 8),
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            splashColor: Colors.grey,
            highlightElevation: 0,
            child: Icon(
              _lightMode ? Icons.light_mode : Icons.dark_mode,
              color: color(),
            ),
            onPressed: () {
              _lightMode = !_lightMode;
              setState(() {});
            },
          ),
          const Spacer(flex: 1),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void zikrOzgarishi() {
    if (_count >= 0 && _count < 33) {
      _zikr = "Subhan' Allah";
    } else if (_count >= 33 && _count < 66) {
      _zikr = "Alhamdulillah";
    } else if (_count >= 66 && _count < 99) {
      _zikr = "Allah hu akbar";
    }
    setState(() {});
  }

  Color color() {
    if (_lightMode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
