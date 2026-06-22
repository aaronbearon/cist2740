# title: The Poor Shepherd
# author: Aaron Blum
# class: CIST2740
# date: 2026-06-22
# keywords:

VAR warrior = false
VAR wizard = false
VAR thief = false

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

- You are devastated, and also you're afraid because you know you're not going to be able to run your farm very well without Willow around to help.

Then you remember that there are some adventurer's guilds in town. Perhaps one of the guilds would take pity on you and be willing to help?

-> choose_guild

= choose_guild
What now?

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
// TODO: guards challenge you, describe the situation in full
+ [Fight your way past the guards.]
    -> fight_guards
+ [Back away and reconsider.]
    -> choose_approach

= scout_gate_again
// TODO: abbreviated — guards are still there, same situation
+ [Fight your way past the guards.]
    -> fight_guards
+ [Back away and reconsider.]
    -> choose_approach

= fight_guards
{ warrior:
    -> fight_success
- else:
    -> game_over
}

= fight_success
// TODO
-> act_3

= scout_river
// TODO: describe peering into the dark water in full
+ [Take the plunge and swim in.]
    -> swim_in
+ [Back away and reconsider.]
    -> choose_approach

= scout_river_again
// TODO: abbreviated — the river is still dark, still waiting
+ [Take the plunge and swim in.]
    -> swim_in
+ [Back away and reconsider.]
    -> choose_approach

= swim_in
{ wizard:
    -> swim_success
- else:
    -> game_over
}

= swim_success
// TODO
-> act_3

= scout_wall
// TODO: describe investigating the wall in full
+ [Climb the wall.]
    -> climb_wall
+ [Back away and reconsider.]
    -> choose_approach

= scout_wall_again
// TODO: abbreviated — the wall is just as tall as you remembered
+ [Climb the wall.]
    -> climb_wall
+ [Back away and reconsider.]
    -> choose_approach

= climb_wall
{ thief:
    -> climb_success
- else:
    -> game_over
}

= climb_success
// TODO
-> act_3

= game_over
GAME OVER

* [Try again.]
    -> act_2

=== act_3 ===
Act 3: Confrontation

-> END
