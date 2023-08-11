package states;

import flixel.input.keyboard.FlxKey;

class OutdatedState extends MusicBeatState
{
	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Sup players, please note that this mod contains spoilers\n
			for the CHANGED SE game. We recommend that you play the\n
			original game by DragonSnow. Press ENTER to open the Steam\n
			page for CHANGED SE or press ESCAPE to proceed anyway.\n
			\n
			Thank you for playing the Mod!",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			CoolUtil.browserLoad("https://imgur.com/DmgsHat");
		}
		else if(controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxTween.tween(warnText, {alpha: 0}, 1, {
				onComplete: function (twn:FlxTween) {
					MusicBeatState.switchState(new MainMenuState());
				}
			});
		}
		else if (FlxG.keys.justPressed.TAB)
		{
			FlxTween.tween(warnText, {alpha: 0}, 1, {
				onComplete: function (twn:FlxTween) {
					MusicBeatState.switchState(new PuroSpeen());
				}
			});
		}
		super.update(elapsed);
	}
}
