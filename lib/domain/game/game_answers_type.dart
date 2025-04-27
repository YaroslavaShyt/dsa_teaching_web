enum GameAnswersType {
  row('row'),
  card('card');

  const GameAnswersType(this.apiString);

  final String apiString;

  static GameAnswersType apiToType(String api) {
    return switch (api) {
      'row' || '1' => GameAnswersType.row,
      'card' || '2' => GameAnswersType.card,
      _ => GameAnswersType.row,
    };
  }
}
