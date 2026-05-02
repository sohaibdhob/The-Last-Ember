import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

void main() {
  runApp(GameWidget(game: LastEmberGame()));
}

class LastEmberGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // تشغيل صوت الرياح المحيطة فور بدء اللعبة
    // تأكدنا من استخدام اسم الملف الذي رفعته بدقة
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('367125__jofae__air-hiss.mp3');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    
    // رسم نص اسم اللعبة في منتصف الشاشة
    final textStyle = TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Arial');
    final textPainter = TextPainter(
      text: TextSpan(text: 'The Last Ember', style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.x / 2 - textPainter.width / 2, size.y / 2));
  }
}
