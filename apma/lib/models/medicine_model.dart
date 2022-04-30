class Medicine {
  late String name;
  late String doseUnit;
  late double dosage;
  late DateTime expiryDate;
  late int frequency;

  Medicine(medicName, unitDose, dose, date, freq){
    name = medicName;
    doseUnit = unitDose;
    dosage = dose;
    expiryDate = date;
    frequency = freq;
  }
}