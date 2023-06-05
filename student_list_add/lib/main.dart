import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:student_list_add/home.dart';


import 'package:student_list_add/model.dart';


import 'provider/add_student_provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
if( !Hive.isAdapterRegistered(studentmodelAdapter().typeId)) 
{
Hive.registerAdapter(studentmodelAdapter());
}
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context)=> StudentAddProvider(),
         ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:const homescreen() ),
    );
  }
}
