class Pain{
  late DateTime date;
  late String type;
  late double intensity;
  late bool hasMedication; 

  Pain(DateTime d, String t, double i, bool m){
    date = d;
    type = t;
    intensity = i;
    hasMedication = m;
  }
}