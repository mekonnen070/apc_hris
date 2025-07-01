enum Lango {
  en,
  am;

  String get name => switch (this) {
    Lango.en => 'English',
    Lango.am => 'አማርኛ',
  };

  String get code => switch (this) {
    Lango.en => 'en',
    Lango.am => 'am',
  };
}
