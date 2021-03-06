import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/generated/l10n.dart';
import 'package:mobile_component/src/view/routes/routes.dart';
import 'package:mobile_component/src/logic/provider/graphql_provider.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/.env_dev");
  //Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  //final Map<String, String> env;
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GraphqlClass graphqlClass = GraphqlClass();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClass.client,
      child: Provider(
        create: (context) => ProviderBlocs(),
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: '/',
            routes: getAppRoutes(),
            builder: (context, child) {
              EasyLoading.init();
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!);
            },
          );
        }),
      ),
    );
  }
}
