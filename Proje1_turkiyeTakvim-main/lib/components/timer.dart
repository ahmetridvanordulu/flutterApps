class Time {
  String uptadeTime(String targetTime) {
    int targetHour;
    int targetMinute;
    int targetSecond;

    int currentHour = DateTime.now().hour;
    int currentMinute = DateTime.now().minute;
    int currentSecond = DateTime.now().second;

    targetHour = int.parse(targetTime.substring(0, 2));
    targetMinute = int.parse(targetTime.substring(3, 5));
    targetSecond = 60;

    String result = '';

    if (targetHour < currentHour) {
      if (targetMinute < currentMinute) {
        String q = ((targetHour + 24) - currentHour - 1).abs().toString();
        if (q == "0") {
          result = "";
        } else {
          result = q + " saat ";
        }
      } else {
        String q = ((targetHour + 24) - currentHour).abs().toString();
        if (q == "0") {
          result = "";
        } else {
          result = q + " saat ";
        }
      }
    } else {
      if (targetMinute < currentMinute) {
        String q = (targetHour - currentHour - 1).abs().toString();
        if (q == "0") {
          result = "";
        } else {
          result = q + " saat ";
        }
      } else {
        String q = (targetHour - currentHour).abs().toString();
        if (q == "0") {
          result = "";
        } else {
          result = q + " saat ";
        }
      }
    }

    if (targetMinute < currentMinute) {
      if (((targetMinute + 60) - currentMinute).abs() < 10) {
        String q = "0" + ((targetMinute + 60) - currentMinute).toString();
        result += q + " dakika ";
      } else {
        String q = ((targetMinute + 60) - currentMinute).toString();
        result += q + " dakika ";
      }
    } else {
      if ((targetMinute - currentMinute).abs() < 10) {
        String q = "0" + (targetMinute - currentMinute).toString();
        result += q + " dakika ";
      } else {
        String q = (targetMinute - currentMinute).toString();
        result += q + " dakika ";
      }
    }

    if ((targetSecond - currentSecond).abs() < 10) {
      String q = "0" +
          (targetSecond - currentSecond == 60
                  ? 0
                  : targetSecond - currentSecond)

              .toString();
      result += q + " saniye ";
    } else {
      String q = (targetSecond - currentSecond == 60
              ? 0
              : targetSecond - currentSecond)
          .abs()
          .toString();
      result += q + " saniye ";
    }
    return result;
  }
}
