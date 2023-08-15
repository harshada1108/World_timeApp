import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time/services/world_time.dart';
class choose_location extends StatefulWidget {
  const choose_location({super.key});

  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
List<worldtime> locations=[
  worldtime(url:'Europe/London' ,location: 'London',flag:'uk.jpeg' ,isDaytime:true ,time:'' ),
  worldtime(url:'Europe/Berlin' ,location: 'Athens',flag:'greece.jpeg' ,isDaytime:true ,time:'' ),
  worldtime(url:'Asia/Jakarta' ,location: 'Jakarta',flag:'indonesia.jpeg' ,isDaytime:true ,time:'' ),

];
void updatetime(index) async{
  worldtime instance= locations[index];
  await instance.getTime();
  Navigator.pop(context,{
    'location':instance.location,'flag':instance.flag,'time':instance.time,
    'isDaytime':instance.isDaytime,
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location '),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.indigo.shade800,
              Colors.white,
              Colors.indigo.shade800,

            ],
                begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),

          child: ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Card(
            child: ListTile(
            onTap: (){
              updatetime(index);
            },
            title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            ),
            );

    }
          ),
        ),
      )
    );
  }
}
