String timeFormatter(String time) {
  String hours = time.substring(11, 13);
  String mins = time.substring(14, 16);
  String timeStamp = '';

  if (int.parse(hours) > 12) {
    switch (time) {
      case '13':
        timeStamp = '01:$mins PM (LOCAL TIME)';
        break;
      case '14':
        timeStamp = '02:$mins PM (LOCAL TIME)';
        break;
      case '15':
        timeStamp = '03:$mins PM (LOCAL TIME)';
        break;
      case '16':
        timeStamp = '04:$mins PM (LOCAL TIME)';
        break;
      case '17':
        timeStamp = '05:$mins PM (LOCAL TIME)';
        break;
      case '18':
        timeStamp = '06:$mins PM (LOCAL TIME)';
        break;
      case '19':
        timeStamp = '07:$mins PM (LOCAL TIME)';
        break;
      case '20':
        timeStamp = '08:$mins PM (LOCAL TIME)';
        break;
      case '21':
        timeStamp = '09:$mins PM (LOCAL TIME)';
        break;
      case '22':
        timeStamp = '10:$mins PM (LOCAL TIME)';
        break;
      case '23':
        timeStamp = '11:$mins PM (LOCAL TIME)';
        break;
      case '24':
        timeStamp = '12:$mins PM (LOCAL TIME)';
        break;
    }
  } else {
    timeStamp = '$hours:$mins AM (LOCAL TIME)';
  }
  return timeStamp;
}
