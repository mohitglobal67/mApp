import 'dart:async';
import 'dart:developer';

import '../home_reop/home_repo.dart';

class HomeDataBloc {
  late HomeRepository homeRepository;

  late StreamController<dynamic> _streamController;
  late StreamController<dynamic> gethomecontroller;
  late StreamController<dynamic> postmetrocontroller;

  HomeDataBloc() {
    _streamController = StreamController<dynamic>();
    gethomecontroller = StreamController<dynamic>();
    postmetrocontroller = StreamController<dynamic>();

    homeRepository = HomeRepository();
  }

  StreamSink<dynamic> get gethomeSink => gethomecontroller.sink;

  Stream<dynamic> get gethomeStream => gethomecontroller.stream;

  StreamSink<dynamic> get postmetrocontrollerSink => postmetrocontroller.sink;

  Stream<dynamic> get postmetrocontrollerStream => postmetrocontroller.stream;

  callhomeData() async {
    try {
      final response = await homeRepository.gethome();

      gethomeSink.add(response);
    } catch (e) {
      gethomeSink.add('error');
    }
  }

  //post Registration
  callPostRegistration(Map<String, String> parameter) async {
    try {
      dynamic chuckCats = await homeRepository.postRegistration(parameter);
      postmetrocontrollerSink.add(chuckCats);
    } catch (e) {
      postmetrocontrollerSink.add(e.toString());
      print(e);
    }
  }

  dispose() {
    _streamController.close();
    postmetrocontroller.close();
  }
}
