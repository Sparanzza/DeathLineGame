-- utilsFx code

function bloomFx( object )
	object.fill.effect = "filter.bloom"

	object.fill.effect.levels.white = 0.8
	object.fill.effect.levels.black = 0.4
	object.fill.effect.levels.gamma = 1
	object.fill.effect.add.alpha = 1
	object.fill.effect.blur.horizontal.blurSize = 20
	object.fill.effect.blur.horizontal.sigma = 140
	object.fill.effect.blur.vertical.blurSize = 20
	object.fill.effect.blur.vertical.sigma = 240

end