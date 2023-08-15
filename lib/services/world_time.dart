import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/pages/loading.dart';
import 'package:intl/intl.dart';

class worldtime{
   String location;
   String time;
   String flag;
   String url;
   bool isDaytime;
  worldtime({required this.location,required this.time,required this.flag,required this.url,required this.isDaytime});
  Future <void> getTime () async{
    try{
      String urlString="https://worldtimeapi.org/api/timezone/$url" ;
      Uri uri=Uri.parse(urlString);
      Response response=await get(uri);
      Map data=jsonDecode(response.body);
      print(data);
      String datetime =data['utc_datetime'];
      String offset =data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);
      DateTime now= DateTime.parse(datetime);
      now.add(Duration(hours:int.parse(offset) ));
      isDaytime=now.hour>6 && now.hour<20? true:false;

      time =DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error:$e');
      time='could not get time data';
    }

  }
}

