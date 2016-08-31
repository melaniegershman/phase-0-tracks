#rappers > albums > song names > lyric

rappers = {
	drake: {
		take_care: {
			take_care: ["My only wish is I die real", "You ain't the only one", "One time, been in love one time"],
			well_be_fine: "Am I down, am I down? Yea I'm all the way down, we'll be fine"
			},
		nothing_was_the_same: {
			worst_behavior: ["Do it look like we stressin'?", "Look at you, look at you, and look at you", "Hold up, hold my phone"],
			started_from_the_bottom: "started",
			hold_on: ["I got my eyes on you", "You're everything that I see", "I want your hot love and emotion, endlessly"]
			},
		thank_me_later: {
			fancy: ["Hair done, nails done, everything did", "Oh you fancy, huh?"],
			miss_me: "Every time you see me I look like I hit the lotto twice",
			up_all_night: ["They opinion doesn't count", "We the only thing that matters", "I be up all night, whole crew's in here"]
			}
		},
	outkast: {
		atliens: {
			two_dope_boys: ["Comin up on ya from the South", "the A-T-Liens aint changed", "Cooler than most players claim to be" ],
			atliens: ["Cause I'm cooler than a polar bear's toenails", "Now throw your hands in the air", "And wave 'em like you just don't care"],
			elevators: ["Me and you", "Your momma and your cousin too", "Rolling down the strip on Vogues"]
			},
		speakerboxxx: {
			the_way_you_move: ["But I know y'all wanted that 808", "can you feel that B-A-S-S", "bass"] ,
			},
		the_love_below: {
			hey_ya: ["Shake it", "shake it like a Polaroid picture"],
			rose: "mighty fine only got you somewhere half the time"
			}
		},
	nas: {
		it_was_written: {
			if_i_ruled_the_world: ["If I ruled the world", "Still livin' for today", "in these last days and times"],
			},
		gods_son: {
			i_can: ["I know I can", "Be what I wanna be", "If I work hard at it", "I'll be where I wanna be"],
			made_you_look: ["Stay laced in the best", "well dressed with finesse"]
			}
		},
}

#print lyrics to screen
puts rappers[:drake][:nothing_was_the_same][:worst_behavior]
puts "-" * 10 #breaks up my commands in IRB for better visibility
#what reason does nas give to make you look?
puts rappers[:nas][:gods_son][:made_you_look][0]
puts "-" * 10
#how does nas show he has a growth mindset?
puts rappers[:nas][:gods_son][:i_can]
rappers[:nas][:gods_son]
puts "-" * 10
#Fill in the lyric: "But I know yall wanted that 808, can you feel that B-A-S-S, _____"
puts rappers[:outkast][:speakerboxxx][:the_way_you_move][2].upcase
puts "-" * 10
# where are you?
puts rappers[:drake][:nothing_was_the_same][:started_from_the_bottom].concat(" from the bottom now we here")