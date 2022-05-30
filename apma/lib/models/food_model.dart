class Food{
  late DateTime date;
  late String time;
  late String mood;
  late String whom;
  late String symptoms;
  late double hunger;
  late double fullness;

  Food(DateTime d, String t,String w,String m,String s, double h, double f){
    date = d;
    time = t;
    mood = m;
    whom = w;
    symptoms = s;
    hunger = h;
    fullness = f;
    
  }
}