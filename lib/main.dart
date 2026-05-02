import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

void main() {
  runApp(GameWidget(game: TheLastEmberFullGame()));
}

class TheLastEmberFullGame extends FlameGame with HasCollisionDetection, HasTappables {
  @override
  Future<void> onLoad() async {
    // 1. الأصوات المحيطة (بداية الجو العام)
    FlameAudio.bgm.play('367125__jofae__air-hiss.mp3');

    // 2. تحميل "خريطة العالم" (الفصل الأول)
    add(BackgroundComponent());

    // 3. إضافة البطل "نور"
    final noor = NoorPlayer();
    add(noor);

    // 4. إضافة العدو الأول (الظل المتخفي)
    add(EnemyShadow(position: Vector2(800, size.y - 200)));

    // 5. إضافة عنصر القصة (نص البداية)
    add(StoryText("أين أنا؟ البرد ينهش عظامي... يجب أن أجد النار."));
  }
}

// --- هنا نبدأ تعريف "الأعداء" ---
class EnemyShadow extends SpriteComponent with HasGameRef, CollisionCallbacks {
  EnemyShadow({required Vector2 position}) : super(position: position, size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('icon.jpg'); // سنغيرها لصورة الوحش لاحقاً
  }

  @override
  void update(double dt) {
    // حركة بسيطة للعدو (مطاردة اللاعب)
    // سنضيف كود المطاردة هنا ليكون العدو ذكياً
  }
}

// --- هنا نظام النصوص والقصة ---
class StoryText extends TextComponent {
  StoryText(String text) : super(text: text, textRenderer: TextPaint(style: TextStyle(color: Colors.white, fontSize: 20)));
  
  @override
  void onMount() {
    position = Vector2(50, 50); // مكان النص في الأعلى
    super.onMount();
  }
}

// كود اللاعب (NoorPlayer) وسنضيف له التصادم مع الأعداء
class NoorPlayer extends SpriteComponent with HasGameRef, CollisionCallbacks {
  // هنا نضع كود الحركة والقفز الذي كتبناه سابقاً
}

class BackgroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('photo_1_2026-05-02_16-57-09.jpg');
    size = gameRef.size;
  }
}
