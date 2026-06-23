# title: The Poor Shepherd
# author: Aaron Blum
# class: CIST2740
# date: 2026-06-22
# keywords:

VAR warrior = false
VAR wizard = false
VAR thief = false
VAR debug = true

-> act_1

=== act_1 ===
Act 1: Lord and Shepherd

Once upon a time, in a kingdom far, far away, there was a poor shepherd who was struggling to keep his farm going. And that shepherd was YOU.

You've had a bad year, some of your sheep got sick and died. You haven't made a lot of money lately. But at least you have best friend, an adorable, fluffy, loyal, loving sheep dog named Willow. Willow makes you happy when times are tough, and she's the best sheep dog you've ever seen in your whole life.

One terrible day, the local lord, Lord Don, comes to your farm and demands a tax payment.

"But sire," you protest, "I've had a terrible year. I haven't made any money. I have nothing to pay you with."

"That is not my problem," says Lord Don. He notices Willow sitting beside you and seems to make a sudden decision. "I'll be taking this dog. We'll see if that motivates you to find the gold you owe me. You can have her back when you've paid me what is due."

You start to protest, but Lord Don waves his hand, and his henchmen surround Willow and start trying to collar and leash her. Willow starts fighting, and you realize that she's about to get hurt. "Willow, sit! Calm!" Willow eyes you doubtfully, but she obeys, and before long she's walking sadly away with Lord Don and his goons.

* [What now?]

* {debug} [DEBUG: Act 2 Warrior]
    ~ warrior = true
    -> act_2
* {debug} [DEBUG: Act 2 Wizard]
    ~ wizard = true
    -> act_2
* {debug} [DEBUG: Act 2 Thief]
    ~ thief = true
    -> act_2
* {debug} [DEBUG: Act 3 Warrior]
    ~ warrior = true
    -> act_3
* {debug} [DEBUG: Act 3 Wizard]
    ~ wizard = true
    -> act_3
* {debug} [DEBUG: Act 3 Thief]
    ~ thief = true
    -> act_3

- You are devastated, and also you're afraid because you know you're not going to be able to run your farm very well without Willow around to help.

Then you remember that there are some adventurer's guilds in town. Perhaps one of the guilds would take pity on you and be willing to help?
-> choose_guild

= choose_guild
{ stopping: You consider your options. | What now? }

* (warrior_once) [Go to the warriors' guild.]
-> guild_warrior
+ {warrior_once} [Go back to the warriors' guild.]
-> guild_warrior_again
* (wizard_once) [Go to the wizards' guild.]
-> guild_wizard
+ {wizard_once} [Go back to the wizards' guild.]
-> guild_wizard_again
* (thief_once) [Go to the thieves' guild.]
-> guild_thief
+ {thief_once} [Go back to the thieves' guild.]
-> guild_thief_again

= guild_warrior

The Warriors' Guild is the biggest building on the main street. Inside, warriors are sparring and sharpening their blades. It feels like the kind of place where tough people get tougher.

Near the back, a large man sits at a heavy wooden table. He has a grey beard, arms as thick as tree branches, and a long scar across his chin. He looks up as you walk in.

"I'm Captain Aldric. What do you need?"

You explain everything — Lord Don, the tax, Willow. The whole terrible story. Aldric listens with his arms crossed.

"I know Lord Don," he says. "Going after him is a real fight. How much gold are you offering?"

"That's the problem," you say. "I don't have any."

Aldric is quiet for a moment. He studies you carefully.

"I can't risk my people without pay. But... I'll tell you what I can do instead. I see potential in you. It will be hard, but I can train you, teach you to fight. Teach you to be brave, to stand up for yourself and the ones you love. I can make you strong, so that you'll be able to face Lord Don. What do you say?"

* [Accept Aldric's offer. You'll become a warrior.]
    "It's not right for Lord Don to bully people like this, and I would do anything for Willow. I want to be be a warrior."
    -> warrior_accept
* [Thank him and try another guild.]
    "Thank you, Captain. I need some time to consider though."
    He nods curtly as you leave.
    -> choose_guild

= guild_warrior_again
You return to the Warrior's Guild. Captain Aldric remembers you. "Have you changed your mind, shepherd? Are you ready to become a warrior?"

* [Accept Aldric's offer. You'll become a warrior.]
    "It's not right for Lord Don to bully people like this, and I would do anything for Willow. I want to be be a warrior."
    -> warrior_accept
* [Thank him and try another guild.]
    "Thank you, Captain. I need more time to consider though."
    He nods curtly.
    -> choose_guild

= warrior_accept
~ warrior = true

Captain Aldric wastes no time. Training begins the very next morning.

It is brutal. Every day, you wake before sunrise to work the farm, then spend your evenings at the guild learning to fight. Your arms ache. Your legs ache. There are nights you fall asleep at the dinner table. Without Willow, the sheep are harder to manage, and you worry about them constantly.

But you don't stop. You think of Willow's face as she walked away, and you get back up.

Time passes.

Slowly, the ache in your arms turns to strength. Your footwork grows steady. Captain Aldric says less and less, which — you've learned — means you're doing well.

One morning, he hands you a sword.

"You're ready," he says.

-> act_2

= guild_wizard

The Wizards' Guild is a tall, narrow tower at the edge of town. Inside, books and scrolls are stacked from floor to ceiling. Strange jars line the shelves. It smells like herbs, paper, and candle smoke.

At a desk near the window, a woman with silver hair and keen purple eyes looks up from a heavy book.

"I am Archmage Lyra," she says. "Speak."

You explain everything — Lord Don, the tax, Willow. Archmage Lyra listens without saying a word.

"Dealing with Lord Don requires careful planning... and resources," she says when you finish. "How much gold are you offering?"

"None," you admit. "I have nothing."

She nods slowly, as if this is exactly what she expected.

"I cannot send my wizards without payment. But... there is something about you, and I want to help you." She closes her book. "A wizard doesn't need to be the strongest person in the room. A wizard just needs to be the smartest. I can teach you to think, to plan, and to solve problems that others can't. When I'm done with you, you won't have to fight Lord Don. You can outsmart him. What do you say?"

* [Accept Archmage Lyra's offer. You'll become a wizard.]
    "That sounds like a smart plan, and I'll do anything for Willow. I want to be a wizard."
    -> wizard_accept
* [Thank her and try another guild.]
    "Thank you, Archmage. I need some time to think."
    She nods and returns to her book as you leave.
    -> choose_guild

= guild_wizard_again
You return to the Wizards' Guild. Archmage Lyra barely glances up from her book. "Ah, yes, I predicted that you would return. Are you ready to drink from the cup of knowledge?"

* [Accept Archmage Lyra's offer. You'll become a wizard.]
    "That sounds like a smart plan, and I'll do anything for Willow. I want to be a wizard."
    -> wizard_accept
* [Thank her and try another guild.]
    "Thank you, Archmage. I still need some time to think."
    She nods and returns to her book as you leave.
    -> choose_guild
    
= wizard_accept
~ wizard = true

Archmage Lyra sets you to work immediately. A tall stack of books lands on the table in front of you before you've even sat down.

It is exhausting in ways you didn't expect. Your days are spent on the farm, struggling without Willow to keep the sheep in line. Your nights are spent at the tower, reading by candlelight until your eyes ache. There are words you don't know, ideas that make your head spin, and more than once you wonder if you've made a terrible mistake.

But you think of Willow, and you keep reading.

Time passes.

Slowly, the words start to make sense. Patterns emerge. You begin to see problems the way Lyra does — not as walls, but as puzzles. One evening, you solve an exercise that has stumped you for a week, and Lyra allows herself a small smile.

"You are beginning to think like a wizard," she says.

-> act_2

= guild_thief

The Thieves' Guild is not easy to find. There's no sign above the door, which is hidden at the back of a dark alley. You knock three times, like the man at the inn told you to.

After a long pause, the door swings open.

Inside, a lean man with quick eyes and an easy smile leans back in his chair with his boots on the table. He looks like the kind of person who always knows where all the exits are.

"Guildmaster Rook," he says, without getting up. "And you are...?"

You explain everything — Lord Don, the tax, Willow. Rook listens with a small smile, as if he's heard stories like this a hundred times before.

"Lord Don. Nasty piece of work." He tilts his head. "What are you paying?"

"Nothing," you say. "I have nothing."

He laughs — not unkindly. "Of course you don't." He swings his boots off the table and leans forward. "My guild doesn't work unless there's gold. That's just how it is. But..." He looks you over. "I can tell you're the kind of person who doesn't give up easily, which is a very useful quality in a thief. Thieves don't win by being the biggest or the smartest. They win by being patient, quiet, sneaky. They go places they aren't supposed to go — without anyone knowing they were there." He strokes his chin. "I could teach you some tricks, and some real skills. You could slip past Lord Don's guards, find Willow, and be gone before anyone notices. That sounds a lot better than fighting, doesn't it?"

"What do you say?"

* [Accept Rook's offer. You'll become a thief.]
    "I like the idea of getting in and out with no trouble, and I'd do anything for Willow. Teach me."
    -> thief_accept
* [Thank him and try another guild.]
    "Thank you. I'll think about it."
    Rook shrugs. "You know where to find us. Maybe."
    -> choose_guild

= guild_thief_again
Guildmaster Rook smiles when he sees you again. "I had a feeling you'd be back. Are you ready to learn our ways?"

* [Accept Rook's offer. You'll become a thief.]
    "I like the idea of getting in and out with no trouble, and I'd do anything for Willow. Teach me."
    -> thief_accept
* [Thank him and try another guild.]
    "Thank you. I'll think about it some more."
    Rook shrugs. "You know where to find us. Maybe."
    -> choose_guild

= thief_accept
~ thief = true

Rook doesn't waste a moment. "First lesson," he says. "Patience."

It turns out patience is harder than it sounds. You spend long hours practicing how to move without making a sound, how to watch without being seen, how to wait. Meanwhile, the farm still needs running, and without Willow the sheep wander where they like. Some days it feels like everything is falling apart at once.

But you think of Willow, and you stay the course.

Time passes.

Slowly, it starts to click. Your footsteps grow quiet. You learn to read a room before you enter it, to notice things others miss. One evening you slip past two guild members on watch without either of them blinking, and Rook greets you on the other side with a grin.

"There you are," he says. "I almost didn't see you."

Coming from Rook, that's high praise.

-> act_2

=== act_2 ===
Act 2: Castle

Night has fallen by the time you reach the hill above Lord Don's castle.

You stand in the shadow of a clump of trees and look down. Castle might be too strong a word. It's smaller than you expected — more like a big, walled house than a fairy tale fortress. But it does have a wall, and you're going to have to get past it somehow.

Two torches flicker at the front gate, where you can make out a pair of guards standing watch. There could be more inside, out of sight.

To one side of the castle, a small river catches the moonlight as it flows past. You notice something odd — part of the river has been diverted, and a dark channel runs right into the base of the castle wall. The water supply, most likely. The channel is narrow and the water looks cold and black. But it goes in.

Then there's the wall itself. Rough stone, with plenty of handholds. It's not small, exactly. But it's not as tall as you feared.

You take a slow breath. Three ways in. One chance to get Willow back.
-> choose_approach

= choose_approach

* (gate_once) [Approach the front gate.]
    -> scout_gate
+ {gate_once} [Go back to the front gate.]
    -> scout_gate_again
* (river_once) [Check out the river.]
    -> scout_river
+ {river_once} [Check out the river again.]
    -> scout_river_again
* (wall_once) [Investigate the wall.]
    -> scout_wall
+ {wall_once} [Investigate the wall again.]
    -> scout_wall_again

= scout_gate
You stroll down the hill toward the torchlight in plain sight. The two guards eye you as you approach.

"Hey! Stop there!" One of them steps forward. "What's your business?"

You study them for a moment, noticing their worn, shabby leather armor. They're each armed with a club. You don't see any other guards around right now... you'd sort of expected more.

{ warrior: These guards might be the same ones who were there the day Lord Don took Willow, you think you might even recognize one. But somehow, they look different now. They terrified you before, but today you notice their poor posture, dirty uniforms, and shuffling steps. They don't look anything like trained soldiers, just cheap thugs Lord Don must have hired off the street. You've sparred with better fighters than these in the guild yard. }
{ wizard: Guards spent all their time standing around doing nothing. They're probably not that bright. Maybe you can fool them and get them to let you pass? }
{ thief:
You take in the scene quickly. Two guards, torchlight, open ground around the gate. If you were going to do this, you'd probably have to slink along the wall in the darkness and then either wait for them to leave their post, or else create a distraction and slip past. Your hand drifts to your dagger. Rook always said to avoid a fight when you can — but if it came to it, you could maybe handle them.

You wave and smile, "Sorry just passing by!" and conspiciously walk away until you're back in darkness. You consider whether to go through with this plan.
}

+ {warrior} [Try to fight your way past the guards.]
    -> fight_guards
+ {wizard} [Try to talk your way past the guards.]
    -> fool_guards
+ {thief} [Try to sneak past the guards.]
    -> sneak_guards
+ [Back away and reconsider.]
    { !thief: "Sorry, just passing by!" you shout, and walk away from the gate. }
    -> choose_approach

= scout_gate_again
The guards are still at their posts. One of them squints as you approach.

"You again. What do you want?"

{ warrior: Same two men. Still sloppy. You're not worried. }
{ !warrior: Nothing has changed. }

+ {warrior} [Try to fight your way past the guards.]
    -> fight_guards
+ {wizard} [Try to talk your way past the guards.]
    -> fool_guards
+ {thief} [Try to sneak past the guards.]
    -> sneak_guards
+ [Back away and reconsider.]
    { !thief: "Sorry, I seem to be a bit lost! I'm sure I'll find my way!" They eye you suspiciously. Thankfully, they are probably too lazy to bother chasing you down. }
    -> choose_approach

= fight_guards
You walk straight up towards the gate.

The guards tense as you approach, hands moving to their clubs. You stop a few feet away, look them both in the eye, and tell them everything. Who you are. What Lord Don did. That you've spent months training for this moment, and that you're here to find Willow and take her back home.

The guards listen. They don't interrupt. Their eyes move to your sword, to your posture, to the calm, steady way you're standing. You can see them doing the math.

When you finish, one of them clears his throat.

"I'm sorry, sir," he says, and he actually does sound a little apologetic. "That's a very sad story. But you know we can't let you by."

You draw your sword. Your voice comes out flat and quiet.

"I'm not leaving without Willow."

Nobody moves. The torches crackle. The two guards look at your sword. They look at each other. One of them shifts his weight.

Then the other one breaks eye contact and looks down at the ground. "I'm not dying over a stupid dog!" he mutters.

And they run. Not back into the castle, but away, toward the road. They don't even sound the alarm, they just turn and sprint off into the darkness. In a few moments, they're gone entirely. 

You step through the open gate and look around an empty courtyard. No shouts. No bells. Just silence and shadows.

You shake your head slowly. You'd always assumed Lord Don was a powerful, wealthy noble with an army at his back. But a man with a real army doesn't hire guards who run away from a shepherd with a sword. Things must be in very bad shape around here.

* [Proceed into the castle proper.]
    -> act_3

= fool_guards
You straighten up, put on your most confident expression, and stride toward the gate.

"Good evening, gentlemen. I am Magister Aldous Pemberton, Royal Inspector of Tax Revenues, here on urgent business from the capital." You wave your hand airily. "I trust Lord Don is expecting me. You may stand aside."

The guards exchange a look.

"At this hour?" one of them says.

"Tax emergencies," you say gravely, "do not keep business hours."

They squint at you. You keep talking, deploying every long word and official-sounding phrase Archmage Lyra ever taught you. The guards look uncertain for a while. But uncertainty isn't the same as convinced. Eventually the bigger one folds his arms.

"No one does legitimate business in the middle of the night, friend. I don't care who you say you are."

You reach for your magic — a bolt of light, something, anything — but your nerves are too frayed and nothing comes. The guards don't wait to find out what you were doing with your hands. A moment later you're face-down in the dirt, and they're dragging you toward the dungeon.

GAME OVER

+ [Try again.]
    -> act_2

= sneak_guards
You melt back into the shadows and wait.

And wait.

The guards don't move. An hour passes, maybe more. The torches burn steadily. These two, it turns out, actually take their jobs seriously.

Finally you get an idea. You gather a handful of stones and hurl them into the darkness on the far side of the road. They clatter loudly against something wooden. Both guards snap to attention, then head off to investigate, hands on their clubs.

You move. Staying low, hugging the wall, you slip through the gate and into the courtyard beyond.

And run directly into a third guard.

He doesn't hesitate. "HEY!" You swiftly draw your knife, but without the element of surprise, he's just as quick with his club. And a short knife is no match for a long club. By the time the other two come running back, you're already on the ground.

GAME OVER

+ [Try again.]
    -> act_2

= scout_river
You make your way around the side of the castle to where the river runs past. Up close, the diverted channel is narrower than it looked from the hill — just wide enough to swim through. The water is black and cold, and it disappears under a low stone arch at the base of the wall. Once you're past that arch, you'll be underwater in the dark, with no idea what's waiting on the other side.

{ warrior: You've worked hard your whole life and your lungs are good. You tell yourself that whatever's in there, you can power through it. }
{ wizard: And then, like a lamp switching on, you remember — Archmage Lyra's third week of lessons. The underwater breathing spell. You'd nearly forgotten it. Now it seems like the most important thing you've ever learned. }
{ thief: You're quick and nimble, and Rook always said a good thief knows how to move in tight spaces. You figure you can slip through whatever's in there and be out the other side before your lungs complain. }

+ {warrior} [Take a deep breath and swim through.]
    -> swim_warrior
+ {wizard} [Speak the spell, take a breath, and dive in.]
    -> swim_wizard
+ {thief} [Slip into the water and swim through.]
    -> swim_thief
+ [Back away and reconsider.]
    -> choose_approach

= scout_river_again
You return to the river's edge. The arch is just as low, the water just as dark.

{ warrior: You're strong. You can do this. }
{ wizard: The spell is right there in your memory. You're ready. }
{ thief: Quick and nimble. In and out. You can do this. }

+ {warrior} [Take a deep breath and swim through.]
    -> swim_warrior
+ {wizard} [Speak the spell, take a breath, and dive in.]
    -> swim_wizard
+ {thief} [Slip into the water and swim through.]
    -> swim_thief
+ [Back away and reconsider.]
    -> choose_approach

= swim_warrior
You take a deep breath, slip under the arch, and kick hard into the dark.

The water is shockingly cold. You push forward, blind, counting strokes.

About halfway through, your outstretched hands hit something solid. Branches. Mud. A tangle of debris packed tight across the channel. You shove at it with everything you have — your shoulders, your legs — but it barely shifts.

Your lungs are already burning. You turn back, but you've come too far. The current pushes against you.

The cold takes you.

GAME OVER

+ [Try again.]
    -> act_2

= swim_wizard
You speak the words of the spell quietly, feel the familiar tingle in your chest, and slip into the water.

The cold hits you immediately — but the desperate urge to breathe doesn't follow. The spell holds. You kick forward into the dark.

About halfway through, your hands find the obstruction. A mass of branches, mud, and debris, packed tight across most of the channel. You reach for a second spell — just a dim glow at your fingertips — and in the faint light you can make out the shape of it. Not completely solid. There are gaps, if you're patient.

You have all the time in the world.

Slowly, carefully, you shift a branch here, push aside a clump of mud there, find the seam in the tangle and work it open. No rush. No panic.

The gap widens. You pull yourself through.

You surface inside the castle walls, gasping quietly in the dark, dripping wet, and grinning.

You take a moment to catch your breath and look around. In the dim moonlight, the courtyard is not what you expected. The paving stones are cracked. Weeds push up between them. A barrel in the corner has rotted half through.

Your mind drifts back to the water channel — all that debris, all those branches and mud packed tight enough to nearly kill you. That didn't happen overnight... someone let that build up for a long time.

You'd always assumed Lord Don was wealthy and powerful, but powerful men don't let their water supply fill up with rubbish. Things must be worse here than you'd ever imagined.

* [Proceed into the castle proper.]
    -> act_3

= swim_thief
You ease into the water without a splash and kick off into the dark.

It's tight and cold and very black. You move quickly, the way Rook taught you — smooth, no wasted effort.

Then your hands hit something. A wall of branches, mud, and floating debris, dense and tangled. You try to squirm around the edges, looking for a gap, but there's no room to maneuver. You try pushing through. Nothing moves.

You've been under too long. You twist around to swim back, but you've drifted farther than you realized.

The darkness gets darker.

GAME OVER

+ [Try again.]
    -> act_2

= scout_wall
You circle around to a dark stretch of wall away from the torchlight. Up close, the stonework is old and uneven — plenty of cracks and ledges to grip. You press a hand against it and look up. It's maybe fifteen feet to the top. Not impossible.

{ warrior: You're no climber, but you press a hand to the stone and look up. Plenty of handholds. Fifteen feet, maybe a little more. It just might be manageable — if your sword doesn't get in the way. }
{ wizard: You wish, not for the first time, that Lyra had taught you a spell for flying. Or levitating. Anything, really. You look up at the wall and sigh. You're no climber. But the handholds are good, and it's not that high. You think you might be able to manage it even without magic. }
{ thief: Your eyes move quickly up the face of the wall, already picking out the route. That crack there, that ledge, that jutting stone near the top. Rook made you practice climbs like this in the dark. You could do this quietly, quickly, and be over before anyone knew you were there. }

+ {warrior} [Climb the wall.]
    -> climb_warrior
+ {wizard} [Climb the wall.]
    -> climb_wizard
+ {thief} [Climb the wall.]
    -> climb_thief
+ [Back away and reconsider.]
    -> choose_approach

= scout_wall_again
The wall is the same as before — old stone, plenty of handholds, fifteen feet to the top.

{ warrior: Still the same wall. You think you could manage it if you're careful with that sword. }
{ wizard: Still no flying spell. The wall hasn't gotten any taller. You think you could manage it. }
{ thief: You trace the route again in your mind. You've got it. You're ready whenever you decide to go. }

+ {warrior} [Climb the wall.]
    -> climb_warrior
+ {wizard} [Climb the wall.]
    -> climb_wizard
+ {thief} [Climb the wall.]
    -> climb_thief
+ [Back away and reconsider.]
    -> choose_approach

= climb_warrior
You start up the wall. The handholds are good — rough stone, plenty to grab. Six feet up, then eight. This might actually work.

Then your sword catches on a ledge.

Still in its sheath at your hip, but the hilt snags on a jutting stone and yanks you sideways. You scramble for your grip with one hand and reach down to free the sheath with the other. It pulls. You tug. For one long, wobbling moment you hang suspended in the air, and you have just enough time to think: Captain Aldric is going to laugh at this.

Then you're falling.

You hit the ground hard. Nothing broken — but the guard who comes running around the corner is a different problem entirely.

GAME OVER

+ [Try again.]
    -> act_2

= climb_wizard
You reach up, find a handhold, and start to climb.

It goes better than you expected. Hand over hand, foot by foot — you find a rhythm. Eight feet up. Ten feet up. You're almost surprised at yourself.

Then your arms start to burn.

You stop, gripping the stone, and realize the burning isn't going away. Your hands are shaking. Climbing a wall, it turns out, is hard work — the kind your studies never prepared you for. Even herding sheep was never this hard.

You look up. Five more feet to the top.

You look down. Ten feet back to the ground.

You were not aware, until this precise moment, that climbing down is even harder than climbing up. You freeze, grasping desperately to your hand holds, trying to decide what to do, but ultimately your fingers make the decision for you.

As you fall, you have just enough time to reflect that Archmage Lyra gave you access to the accumulated knowledge of centuries — and you have just been defeated by a stupid wall.

The ground arrives quickly. So does a guard.

GAME OVER

+ [Try again.]
    -> act_2

= climb_thief
You move before you've even finished deciding.

Hand over hand, quiet as shadow — except the wall turns out to be even easier than you expected. Much easier. Half the stones you mapped from the ground are cracked or missing entirely, and the ones that remain offer more handholds than you could ever need. You're at the top in seconds, almost embarrassed by how little effort it took.

You crouch there a moment in the dark, catching your breath — and look back down at the wall from above. It's falling apart. Chunks of mortar missing. A whole section near the corner looks like it could come down in a strong wind.

You drop onto the staircase built into the inside of the wall and walk down into the courtyard, shaking your head.

The courtyard isn't much better. The paving stones are cracked and weedy. A cart in the corner is missing a wheel. The place has the look of somewhere that hasn't been properly looked after in a long time.

You'd always pictured Lord Don as rich and powerful. But a rich, powerful man maintains his walls.

* [Proceed into the castle proper.]
    -> act_3

= game_over
GAME OVER

+ [Try again.]
    -> act_2

=== act_3 ===
Act 3: Confrontation

The keep's door is unlocked. You push it open and step inside.

The hallway beyond is dark and cold. Your footsteps echo on stone floors that haven't been swept in a long time. Some rooms you pass seem entirely bare, the rest look dusty and unused. The whole place is deathly silent, not a servant to be found.

This place wasn't abandoned all at once. It was let go slowly, piece by piece, like a fire going out.

You keep moving.

Near the far end of the hall, something changes. The floor has been swept here. A tapestry, faded but still hanging straight, covers one wall. Underneath a door at the end, a thin line of warm candlelight.

You open the door and walk inside.

The study beyond was grand once — high ceilings, floor-to-ceiling shelves lined with books, a wide stone fireplace. Now the fireplace is cold and the shelves are thick with dust. But the big oak desk in the center of the room is covered in papers and ledgers, and Lord Don is sitting behind it, writing by the light of a single candle. On a shelf near the wall, half-hidden behind old ledgers, a small iron box sits apart from the dust and clutter.

He looks up the moment the door opens. Not startled — just alert. He looks older than you remembered. Thinner. But not weaker, you think... his eyes feel cold and hungry.

He sets his pen down slowly.

"How did you get in?"

There is no fear in his voice. If anything, he sounds faintly interested. The question hangs in the air between you, and you become very aware that you are alone in a room with a man who seems to have nothing left to lose.

+ ["I've come to take back what is mine."]
    "Nevermind that, I've come to take back what is rightfully mine. By force, if necessary."
    -> force
+ ["I've come to reason with you."]
    "I'm here on official business," you say, as confidently as you can manage.
    -> reason
+ ["I've brought you the gold I owe you."]
    "Why, I've brought you the gold I owe you. I need Willow back." You glance around meaningfully. "And I can see you need the gold."
    -> gold


= force
{ warrior: You draw your sword. }
{ wizard: You ready your most potent spell. }
{ thief: You draw your knife. }

"What you did to me was wrong," you say. "I'm not leaving without Willow."

Don is out of his chair before you finish the sentence.

His sword is in his hand as if it had always been there — one smooth motion, no fumbling, no panic. Faster than you would have imagined a man his age could move.

{ warrior: -> warrior_force }

{ wizard:
You start casting your spell. It's not a deadly one, but it should knock him out for a while and give you some time to look around better.

Unfortunately, Lord Don doesn't have even a speck of hesitation- or of mercy. He crosses the room faster than you can get the next word out. Your spell dies on your lips.
-> game_over
}

{ thief:
You ready your dagger and fall back into a fighting stance. Lord Don does not hesitate. He crosses the room in the blink of an eye, and it's all you can do to sidestep his first thrust. Rook warned you that honest fighting was a last resort... you'd better end this as fast as you can.

You make a lunge towards Lord Don to get close enough to strike with your knife. But he's just as fast as you, and he counters your lunge with a step backwards, well outside the range of your knife. But still in range of his sword...
-> game_over
}

// ERROR: no class set — should not reach here
-> game_over

= warrior_force

Unlike the guards at the gate, you know immediately that this man can fight.

But you can see him making the same calculation about you. He's on his feet, sword out — and then he stops. The heavy wooden desk sits between you, and he makes no move to come around it.

You watch each other.

You're not sure what to do next. You had expected him to either give in or come at you, and instead you have this — an impasse. You're not about to strike first. He seems to know it. But he hasn't moved either.

Finally you demand: "Where is she? Where is Willow?"

At that moment, you hear a sound coming from the doorway. A young girl is standing there. Her face is very still. "What is going on in here?" she asks.

"Mira, this man is trespassing, he came here to kill me. Run! I will deal with this."

"Rubbish!" you shout. "Your father stole my beloved dog, Willow."

Mira's face turns red with shame as she realizes the truth. She turns to her father with the saddest, most disappointed eyes you've ever seen.

"You said Willow's owners were giving her up," she says. "You said she didn't belong to anyone anymore." Her voice drops. "How would this man know her name?"

Lord Don has no response, but now his own face is turning red with shame.

Mira turns to the open doorway and calls loudly, "Willow!"

-> epilogue

= reason
"Official business," Don says flatly.

"That's right." You pull a folded paper from your coat and set it on his desk. "I have a sworn letter here — signed, witnessed, and stamped by a notary — proving I made no money this year. My flock got sick. I had nothing to sell. No money made means no tax owed. The law says so, even in your district."

Don looks at the paper without picking it up. He looks back at you.

"I am the law in this district."

"For now," you say. "There's a copy of that letter with a friend in town. If I don't make it home by morning, she delivers it straight to the regional lord."

A silence stretches between you. Don's eyes are cold and steady, and you can see him weighing his options. You wait.

{ wizard: -> wizard_reason }
-> fail_reason

= wizard_reason
Then he opens his mouth to speak.

And the words that come out are not what he meant to say.

"The dog was taken before the debt was confirmed," he says slowly, like each word is being pulled from him against his will. "The seizure was... not lawful." His jaw clamps shut. He stares at his desk. He can't take the words back.

That happens, when a truth-telling spell has been placed on you. You cast it quietly, in the hallway, before you ever opened the door.

A sound from behind you. A small voice.

"Papa...?"

A young girl is standing in the doorway. Her face is very still.

"You said Willow's owners were giving her up," she says. "You said she didn't belong to anyone anymore." Her voice drops. "Did you steal her?"

"Mira... I can explain." he says.

"Tell me the truth."

He can't help it. The spell is still working. "...Yes. I did."

Mira looks away, her face turning red with shame. Her eyes suddenly seem watery. Nevertheless, she turns to the open doorway and calls loudly, "Willow!"

-> epilogue

= fail_reason
Don looks at you for a long moment.

"The tax is on your property, not your income," he growls. "And speaking of property, you are trespassing on mine, in the middle of the night!"

"With respect, Lord Don, the law is very clear about—"

Before you realize what is happening, he's out of his chair.

He's flying across the room at you with his sword already drawn, and you don't have time to move — much less finish your sentence.

-> game_over

= gold
Don's eyes move from your face to your coat pocket, then back.

"You have gold," he says. Not quite a question. "Show me."

"Yes." You hold his gaze. "But I'm not showing you anything until I see Willow — alive and unharmed."

The silence stretches. You can see the calculation happening behind his eyes: the suspicion weighed against greed.

He gets up. "Stay right there," he orders. He walks out the door into the hallway.

"Mira!" you hear him call. "Bring the dog."

{ thief: -> thief_gold }
-> fail_gold

= thief_gold
The moment his back is to you, you move.

Three steps to the shelf — quick and quiet. Your hand finds the iron box. The latch lifts without a sound — Rook would have been proud of that latch — and a few small coins come with you when your hand returns to your side. Not much, but enough.

Lord Don returns only an instant later. Your heart thumps. If you'd been only slightly slower, he would have caught you for sure.

The moments pass in silence, until footsteps sound in the hall. Mira enters with Willow on a lead.

Willow sees you. She loses her mind entirely. You hold out the coins to Don with one hand and try to keep Willow from climbing you with the other.

Mira watches all this with growing confusion and fear. "Papa," she says. "Why are you selling my dog?"

Don opens his mouth. "I'm not. I'm collecting a debt. The shepherd owed—"

"You told me she came from a farm where they didn't want her anymore." Mira's voice trembles just a little. "You said her owners had given her up."

"I'm sorry," he says. But there's a sadness in his face, too, and perhaps... some shame? You get the idea that he's not entirely happy with the trade.

-> epilogue_choice

= fail_gold
The moment his back is to you, you move. If you can just get to that iron box, you're pretty sure there's going to be money in there. What Lord Don did to you was unjust. You're just balancing the scales, right?

Your hand finds the latch. You fumble slightly, and then it's open. No need to be greedy, all you need is a few coins...

You don't know whether something gave you away, or if you just have the worst luck, but as you pull your hand away, Lord Don walks back into the room. And the look on his face is rage beyond anything you've ever seen in your life.

{ warrior:

You drop the coins and draw your sword as fast as you've ever drawn it, but Lord Don is already almost on top of you. Your training takes over and your arm moves, striking faster than a conscious thought.

The problem is, all the people you've ever fought before didn't want to get injured. But at least in this moment, Lord Don does not care. You strike him, and he strikes you. It seems ironic that after all that's happened, the two of you are about to die in each other's arms.

- else:

You freeze in shock and panic. Lord Don doesn't hesitate even an instant.
}

-> game_over

= epilogue

Willow hits you like a small furry storm.

She barks and spins and throws herself against you, and you hold on tight and let her. It takes a while for her to calm down. Honestly, it takes a while for you to calm down too.

When you finally look up, Mira is still in the doorway, watching.

"I didn't know," she says.

"I know," you say. "Thank you."

She nods, and you can tell she means it.

-> epilogue_choice

= epilogue_choice

You have what you came for. Willow is right here. The door is right there.

+ [Get out of here while you have the chance.]
    -> walk_away
+ [Wait. You need to understand something.]
    -> ask_why

= walk_away
You nod once and go.

Through the cold hallway, through the courtyard, out the gate. Willow trots at your side, bumping against your leg every few steps as if to make sure you're still there.

The sky is starting to lighten in the east. You don't look back.

THE END

-> END

= ask_why
"Why Willow?" you say. "She's not worth anything — not in gold, anyway. You could have taken a lamb. A tool. But you took a dog. And you kept her."

Don doesn't answer right away.

"Mama died," Mira says quietly. Not to you. To the room.

Don's hands go still on the desk.

"We've had bad years," he says finally, not looking at anything in particular. "The whole district. I had tributes to pay and not enough to pay them with." He pauses. "I tried to make up the difference. At cards." A shorter pause. "I lost."

He doesn't say how much. He doesn't need to.

"After her mother passed," he continues, "Mira stopped eating. Stopped going outside. She just sat." His voice is very flat and careful — the voice of someone keeping themselves tightly together. "I thought a dog would help. Something to take care of. Something that needed her."

He looks at Mira.

"It worked," Mira says softly.

"Yes," he says. "It did."

The room is quiet.

What he did was wrong. You know that. The months without Willow were real, and so was the grief. But so is this — a man who made terrible choices for a reason you understand, even if you can't forgive it.

You look at Mira.

"Willow's going to have puppies someday," you say. "I'll make sure you get one. I promise."

For a moment Mira's face doesn't change. Then something in it opens, just a little.

"Okay," she says.

You walk out into the morning with Willow at your side.

[Epliogue.]

A few weeks later, Lord Don and his daughter arrive at your farm.

Don looks different. He stands straighter, and the tightness around his eyes has eased a little. He doesn't say much, but when he helps Mira down from the cart, there's something careful and deliberate about it — the way someone moves when they're trying to do things right.

Mira goes straight to the pen where Willow is lying in the straw, a small wriggling pile of puppies tucked against her side.

She picks the smallest one up, and it immediately starts licking her face.

"This one," she says.

Don stops beside you and watches her for a moment.

"Things have been a little better lately," he says quietly. "Settled some old debts. Started repairs on the east wall." He pauses. "I wanted to say — making that promise, you didn't have to do that."

You watch Mira sitting cross-legged in the straw, the puppy in her lap.

"It worked out," you say.

Willow presses against your leg, warm and solid. You reach down and scratch her ears.

THE END

-> END

= game_over
GAME OVER

+ [Try again.]
    -> act_3
