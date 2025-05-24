enum Lango {
  en,
  am;

  String get name => switch (this) {
    Lango.en => 'English', // English
    Lango.am => 'Amharic',
  };

  String get code => switch (this) {
    Lango.en => 'en',
    Lango.am => 'am',
  };
}
