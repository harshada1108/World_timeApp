import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 Map data={};
  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>;
   print(data);
    String bgimage =data['isDaytime']?'day_1.jpeg':'night1_1.jpeg';
    return Scaffold(
            body:Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/$bgimage'),
                  fit: BoxFit.cover,

                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(child: Center(
                  child: Column(
                    children: [
                    ElevatedButton.icon(onPressed: ()async {
                     dynamic result=await  Navigator.pushNamed(context, '/location');
                     setState(() {
                       data= {
                         'time': result['time'],
                         'location': result['location'],
                         'isDaytime': result['isDaytime'],
                         'flag': result['flag'],

                       };

                     });
                    }, icon:Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                      label: Text('Edit location'),
                    ),
                      SizedBox(height:40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       Text(
                          data['location'],
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           letterSpacing: 3,
                         ),
                       ),

                     ],
                      ),
                      SizedBox(height: 40,),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),

                      ),
                    ],

                  ),
                ),

                ),
              ),
            ),
          );



  }
}

