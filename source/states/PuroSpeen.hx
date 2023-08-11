package states;

class PuroSpeen extends MusicBeatState
{
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		var spinSpr:FlxSprite = new FlxSprite(0, 0);
		spinSpr.frames = Paths.getSparrowAtlas('puroCHOPTER');
		spinSpr.antialiasing = ClientPrefs.data.antialiasing;

		spinSpr.animation.addByPrefix('fgaCool', 'logo bumpin', 24, true);
		spinSpr.animation.play('fgaCool');
		spinSpr.updateHitbox();

		add(spinSpr);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			MusicBeatState.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
