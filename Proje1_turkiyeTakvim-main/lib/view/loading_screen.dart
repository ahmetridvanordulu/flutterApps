import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:turkiyetakvimi/model/yaprakModel.dart';

import '../components/error_dialog.dart';
import '../constant.dart';
import '../model/model.dart';
import '../service/get_data.dart';
import '../service/location.dart';
import 'home_screen.dart';
// gunun olayından sonra erkek kız çek
// //container genişlesin malum duruma göre

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Vakit _prayerTimeModel = Vakit();
  final DataService _dataService = DataService();
  late Position _location;

  Yaprak _arka = Yaprak(miladiTarih: '', hicriSemsi: 0, hizirKasim: '');

  @override
  void initState() {
    super.initState();
    getLocationPrayerTime();
  }

  void getLocationPrayerTime() async {
    try {
      _location = await getCurrentLocation();
      search(_location).then(
        (value) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return
                  InteractiveViewer(
                    panEnabled: false, // Set it to false to prevent panning.
                    boundaryMargin: EdgeInsets.all(80),
                minScale: 0.5,
                maxScale: 4,
                child: HomeScreen(
                  prayerTimeModel: _prayerTimeModel,
                  cityName: _dataService.locName,
                  arkayuzModel: _arka,
                ));
              },
            ),
          ),
        },
      );
    } on PermissionDeniedException catch (e) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage: e.toString(),
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    } on PlatformException {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage:
              'We couldn\'t get the location. This error can be caused by bad internet. Please restart the application.',
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage: e.toString(),
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    }
  }

  Future<Vakit> search(Position loc) async {
    Vakit prayerTimeModel = await _dataService.getData(loc);
    Yaprak arka = await _dataService.getArka();
    _arka=arka;
    _prayerTimeModel = prayerTimeModel;
    return _prayerTimeModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              height: MediaQuery.of(context).size.width / 2.5,
              image: const AssetImage(
                  "assets/a1.png")),
          const SizedBox(
            height: 30,
          ),
          SpinKitSpinningLines(size: 167, color: Colors.red),
        ],
      ),
    );
  }
}
