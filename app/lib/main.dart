import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'glassfill.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GlassFill(),
    );
  }
}

class GlassFill extends StatefulWidget {
  @override
  _GlassFillState createState() => _GlassFillState();
}

class _GlassFillState extends State<GlassFill> {
  GlassLoadingController _flareController;
  static const int totalGlass = 8;
  int currentGlass = 0;
  @override
  void initState() {
    _flareController = GlassLoadingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: FlareActor(
              "assets/fillWater.flr",
              controller: _flareController,
              artboard: "Artboard",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: addWater,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                    child: Text(
                  "Add",
                  style: TextStyle(
                      letterSpacing: 1.2, color: Colors.black, fontSize: 20),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: subWater,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                    child: Text(
                  "Sub",
                  style: TextStyle(
                      letterSpacing: 1.2, color: Colors.black, fontSize: 20),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: resetWater,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                    child: Text(
                  "Reset",
                  style: TextStyle(
                      letterSpacing: 1.2, color: Colors.black, fontSize: 20),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addWater() {
    setState(() {
      if (currentGlass <= totalGlass) {
        currentGlass = currentGlass + 1;
        double percentToadd = currentGlass / totalGlass;
        _flareController.updateWaterPercent(percentToadd);
      }
    });
  }

  void subWater() {
    setState(() {
      currentGlass = currentGlass - 1;
      double percentToadd = currentGlass / totalGlass;
      _flareController.updateWaterPercent(percentToadd);
    });
  }

  void resetWater() {
    setState(() {
      currentGlass = 0;
      _flareController.resetWater();
    });
  }
}
