abstract class TextEvent {}

class SubmitEvent extends TextEvent {
  final String _text;
  String get text => _text;

  SubmitEvent(this._text);
}
