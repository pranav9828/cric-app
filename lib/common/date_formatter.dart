String dateFormatter(String date) {
  String month = date.substring(5, 7);
  String day = date.substring(8, 10);

  String timeStamp = '';
  switch (month) {
    case '01':
      timeStamp = '$day, Jan';
      break;
    case '02':
      timeStamp = '$day, Feb';
      break;
    case '03':
      timeStamp = '$day, Mar';
      break;
    case '04':
      timeStamp = '$day, Apr';
      break;
    case '05':
      timeStamp = '$day, May';
      break;
    case '06':
      timeStamp = '$day, Jun';
      break;
    case '07':
      timeStamp = '$day, Jul';
      break;
    case '08':
      timeStamp = '$day, Aug';
      break;
    case '09':
      timeStamp = '$day, Sep';
      break;
    case '10':
      timeStamp = '$day, Oct';
      break;
    case '11':
      timeStamp = '$day, Nov';
      break;
    case '12':
      timeStamp = '$day, Dec';
      break;
  }
  return timeStamp;
}
