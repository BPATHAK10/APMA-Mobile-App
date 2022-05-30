class Movement{
  late DateTime date;
  late String type;
  late String moodBefore;
  late String moodAfter;
  late String timeFor;
  late double painBefore;
  late double painAfter;

  Movement(DateTime d, String t, String mb, String ma,String tf,double pb,double pa){
    date = d;
    type = t;
    moodBefore = mb;
    moodAfter = ma;
    timeFor = tf;
    painBefore = pb;
    painAfter = pa;
  }
}