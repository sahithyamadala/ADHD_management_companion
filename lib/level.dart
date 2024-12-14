class Level {
  static const int totalLevels = 5; // Define total levels

  // Define card images for each level
  static List<String> getCardImagesForLevel(int level) {
    switch (level) {
      case 0:
        return [
          'assets/potion.png',
          'assets/potion.png',
          'assets/crystal.png',
          'assets/crystal.png'
        ];
      case 1:
        return [
          'assets/potion.png',
          'assets/potion.png',
          'assets/crystal.png',
          'assets/crystal.png',
          'assets/scroll.png',
          'assets/scroll.png',
        ];
      case 2:
        return [
          'assets/potion.png',
          'assets/potion.png',
          'assets/crystal.png',
          'assets/crystal.png',
          'assets/scroll.png',
          'assets/scroll.png',
          'assets/orb.png',
          'assets/orb.png',
        ];
      case 3:
        return [
          'assets/potion.png',
          'assets/potion.png',
          'assets/crystal.png',
          'assets/crystal.png',
          'assets/scroll.png',
          'assets/scroll.png',
          'assets/orb.png',
          'assets/orb.png',
          'assets/wand.png',
          'assets/wand.png',
        ];
      case 4:
        return [
          'assets/potion.png',
          'assets/potion.png',
          'assets/crystal.png',
          'assets/crystal.png',
          'assets/scroll.png',
          'assets/scroll.png',
          'assets/orb.png',
          'assets/orb.png',
          'assets/wand.png',
          'assets/wand.png',
          'assets/spellbook.png',
          'assets/spellbook.png',
        ];
      default:
        return [];
    }
  }
}
