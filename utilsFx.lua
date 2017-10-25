-- utilsFx code

function bloomFx( object )
	object.fill.effect = "filter.blurGaussian"
	object.fill.effect.horizontal.blurSize = 18
	object.fill.effect.horizontal.sigma = 140
	object.fill.effect.vertical.blurSize = 18
	object.fill.effect.vertical.sigma = 140
end