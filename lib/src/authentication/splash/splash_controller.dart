import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../auth_repository.dart';
import 'splash_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SplashController {
  final AuthRepository repository;
  ValueNotifier<SplashState> state = ValueNotifier(SplashStateLoading());
//  late IHttpService prefs;
  SplashController({required this.repository}) {
    init();
  }

  Future<void> init() async {
    await dotenv.load();
    await initFirebase();
    hasUser();
//    final client = await SharedPreferences.getInstance();
//    final sharedService = SharedPreferencesClient(instance: client);
//    prefs = sharedService;

//    state.value = await isAuthenticated();
  }

  Future<FirebaseApp> initFirebase() async {
    String apiKey = dotenv.env['apiKey']!;
    String appId = dotenv.env['appId']!;

    String messagingSenderId = dotenv.env['messagingSenderId']!;
    String projectId = dotenv.env['projectId']!;

    return await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
    ));
  }

  void hasUser() {
    final user = repository.hasUser();

    if (user != null) {
      state.value = SplashStateAuthenticated(user: user);
    } else {
      state.value = SplashStateUnauthenticated();
    }
  }

  // void isAuthenticated() async {
  //   var user;
  //   await prefs.get(SharedPreferencesKeys.currentUser).then((value) {
  //     if (value != null && value.isNotEmpty) {
  //       log("init->usuário encontrado->decodificando");
  //       var userJson = jsonDecode(value);
  //       user = UserModel.fromJson(userJson);
  //     }
  //   });
  //   if (user.runtimeType == UserModel) {
  //     log("autentidado (user==UserModel)");
  //     log("init->nome do usuário  ${(user as UserModel).nome}");
  //     return SplashStateAuthenticated(user: user);
  //   }
  //   log("não autentidado (user!=UserModel)");
  //   return SplashStateUnauthenticated();
  // }
}
