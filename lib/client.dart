
import 'package:influxdb_client/api.dart';
import 'statistique.dart';


Future clientHumiditysoil() async {
  var client = InfluxDBClient(
    url: 'http://52.51.92.31:8086',
    token: 'LoBSva8peD1pNKoYtg0pWqCkmgzysks1VUsbjcbS1jG-v5aQIOTvw1YR6P47-Sscx5pz4SYddodf_5xonz4wbw==',
    org: 'SWALP',
    bucket: 'Smart_Irrigation_Bucket',

  );
  var queryService = client.getQueryService();
  var rawCSV = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -30d)
        |> filter(fn: (r) => r._measurement== "device_frmpayload_data_humiditySensor_2" )     
         ''');
  List<String> list = [];
  var tab = rawCSV.split(':');
  var j=6;
  for (var i = 1; i < 16; i++) {
    var tab1 = tab[j].split(',');
    j=j+6;
    list.add((tab1[1]));
  }
  for(var i in list ) {
    print (i);
  }
  return list;
}

Future clientHumidity() async {
    var client = InfluxDBClient(
      url: 'http://52.51.92.31:8086',
      token: 'LoBSva8peD1pNKoYtg0pWqCkmgzysks1VUsbjcbS1jG-v5aQIOTvw1YR6P47-Sscx5pz4SYddodf_5xonz4wbw==',
      org: 'SWALP',
      bucket: 'Smart_Irrigation_Bucket',

    );
    var queryService = client.getQueryService();
    var rawCSV = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -30d)
        |> filter(fn: (r) => r._measurement== "device_frmpayload_data_humiditySensor_2" )     
         ''');
    List<String> list = [];
    var tab = rawCSV.split(':');
    var j=6;
    for (var i = 1; i < 16; i++) {
      var tab1 = tab[j].split(',');
      j=j+6;
      list.add((tab1[1]));
    }
    for(var i in list ) {
      print (i);
    }
  return list;
  }
Future clientPressure() async {
  var client = InfluxDBClient(
    url: 'http://52.51.92.31:8086',
    token: 'LoBSva8peD1pNKoYtg0pWqCkmgzysks1VUsbjcbS1jG-v5aQIOTvw1YR6P47-Sscx5pz4SYddodf_5xonz4wbw==',
    org: 'SWALP',
    bucket: 'Smart_Irrigation_Bucket',

  );
  var queryService = client.getQueryService();
  var rawCSV = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -30d)
        |> filter(fn: (r) => r._measurement == "device_frmpayload_data_barometer_0" )
         ''');
  var list = [];
  var tab = rawCSV.split(':');
  var j=6;
  for (var i = 1; i < 16; i++) {
    var tab1 = tab[j].split(',');
    j=j+6;
    list.add((tab1[1]));
  }
  for(var i in list ) {
    print (i);
  }
return list;
}

Future clientTemperature() async {
  var client = InfluxDBClient(
    url: 'http://52.51.92.31:8086',
    token: 'LoBSva8peD1pNKoYtg0pWqCkmgzysks1VUsbjcbS1jG-v5aQIOTvw1YR6P47-Sscx5pz4SYddodf_5xonz4wbw==',
    org: 'SWALP',
    bucket: 'Smart_Irrigation_Bucket',

  );
  var queryService = client.getQueryService();
  var rawCSV = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -5d )
        |> filter(fn: (r) => r._measurement == "device_frmpayload_data_temperatureSensor_1")
         ''');
  var list = [];
  var tab = rawCSV.split(':');
  var j=6;
  for (var i = 1; i < 16; i++) {
    var tab1 = tab[j].split(',');
    j=j+6;
    list.add((tab1[1]));
  }

return list;
}




Future clientlocaion() async {
  var client = InfluxDBClient(
    url: 'http://52.51.92.31:8086',
    token: 'LoBSva8peD1pNKoYtg0pWqCkmgzysks1VUsbjcbS1jG-v5aQIOTvw1YR6P47-Sscx5pz4SYddodf_5xonz4wbw==',
    org: 'SWALP',
    bucket: 'Smart_Irrigation_Bucket',

  );
  var queryService = client.getQueryService();
  var rawCSV = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -300000h )
        |> filter(fn: (r) => r._measurement== "device_frmpayload_data_gpsLocation_1_location" and  r._field == "latitude" )     
         ''');
  var rawCSV2 = await queryService.queryRaw('''
      from(bucket: "Smart_Irrigation_Bucket")
        |> range(start: -300000h )
        |> filter(fn: (r) => r._measurement== "device_frmpayload_data_gpsLocation_1_location" and  r._field == "longitude" )     
         ''');
  var list = [];
  var tab = rawCSV.split(':');
  var tab2 = rawCSV2.split(':');
  var j=6;
  for (var i = 1; i < 16; i++) {
    var tab1 = tab[j].split(',');
    j=j+6;
    list.add((tab1[1]));
  }
   j =6;
  for (var i = 1; i < 16; i++) {
    var tab3 = tab2[j].split(',');
    j=j+6;
    list.add((tab3[1]));
  }
  for(var i in list ) {
    print (i);
  }
  var list1 =[];
  print(list[0]);
  print(list[22]);
  list1.add(list[0]);
  list1.add(list[22]);
return list1;
}


List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData(1,1),
    SalesData(2,1)
  ];
  for(var i=0;i>-6;i--) {
    chartData.add(SalesData(6*i.toDouble(), 1));
    chartData.add(SalesData(6*i.toDouble(), 0));
    chartData.add(SalesData(6*i.toDouble(), 0));
  }

  return chartData;
}