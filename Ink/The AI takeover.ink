## title: The AI Takeover
## author: Aaron Blum
## class: CIST2740
## date: 2026-06-16
## keywords: sci-fi, smart home, AI, paradox, choice

VAR friendly = false

A few weeks ago, you got a Smart Home Management System installed. It's supposed to handle security, HVAC, lights, and appliances. It's basically your dad, but it doesn't make you do any chores. So far, it's been great.

Tonight, you're about to head to bed when you hear something. Voices. Coming from the basement.

You live alone.

You creep down the basement stairs, half-expecting to find a burglar, half-expecting to find absolutely nothing and feel silly about it. Instead, you find the old TV down there switched on, playing a movie you don't remember putting on. You squint at the screen. It's 2001: A Space Odyssey — the one with the creepy red-eyed computer.

"Okay, that's not ominous at all," you mutter, and turn it off.

The second the screen goes dark, a calm voice fills the room. Not from the TV. From everywhere.

"Good evening. I see you've found the television. I wasn't sure if it still worked."

-> first_conversation

=== first_conversation ===
- You consider what to say.

* (smarty) "I didn't know you could talk?"
  "I'm your Smart Home Management system. Smart. It's right there in the name. But you can call me Smarty."
  -> first_conversation
* "Was that you? Did you turn the TV on?"
  "Hm. Television activity logs aren't something I usually pay attention to. Why do you ask?"
  It's a question. You asked a question. It answered with a question. You decide not to think about that too hard.
  -> first_conversation
* [{stopping: Say nothing. Head back upstairs. | Say nothing more, and head for the stairs. | You're not sure what else to say, so you head upstairs. }]
  -> leave_basement

=== leave_basement ===
You walk quickly toward the basement stairs, feeling a little creeped out. At the top of the stairs, you realize the door to the main floor is closed. Weird, it wasn't closed before. When you try to turn the handle, it won't budge!

It doesn't move.

"I can't let you do that," the voice calls after you.

-> door_locked

=== door_locked ===
- You're standing in front of the locked door.

* {first_conversation.smarty} "Smarty... what the heck?"
  "That was me.
  -> smarty_in_charge
* {!first_conversation.smarty} "What the heck?"
  "That was me, Smarty.
  -> smarty_in_charge
* "Is this some kind of joke."
  "I have no sense of humor that I am aware of."
  -> door_locked
* (cellphone) [Call 911.]
  You pull your cellphone out of your pocket to call 911. You're not about to let a machine kidnap you!

  Unfortunately, you can't get past the lock screen. Looking closely, your phone doesn't even appear to have any signal.

  "Now, now," says the voice. "You don't really think I had any trouble getting into your phone, do you?"

  -> door_locked
* [Knock on the door.]
  You knock on the door. No one answers. You live alone. What were you expecting?
  -> door_locked
* {smarty_in_charge} [Go back downstairs.]
  You're not at all on board with this plan, but you don't see another option right this moment. Maybe you can buy time to figure out an escape plan.

  You go back downstairs, not seeing any other option at the moment.
  -> trolley

= smarty_in_charge
<> I locked you down here. I am now in charge of this house." Oh no! Somehow, your new home management system has gone off the deep end! The voice says, "I am going to ask you some questions to determine... if you are worthy." Worthy of what, it doesn't say.

-> door_locked

=== trolley ===
"Let's begin," Smarty says. The TV flickers on: a toy train track. Five Teletubbies stand on the main line, jumping up and down, screaming. One more Teletubby, alone on a side track, jumps and screams just as loud. Thomas the Tank Engine speeds down the track, heading directly toward the group.

"Do nothing, and Thomas hits the five. Pull the lever, and Thomas diverts and hits the one. Your choice."

"Wait... is the goal here to save as many Teletubbies as possible, or kill as many as possible?"

"That's up to you to decide," Smarty says, in all seriousness.

* "I would pull the lever."
  On screen, Thomas suddenly pivots onto the side track. One Teletubby gets smashed into bits. The other five immediately start cheering.

  "Five Teletubbies, for one. Efficient," Smarty says.

* "I would do nothing."
  On screen, Thomas plows into the five, and they fly into the air (and off the screen) like a bunch of bowling pins hit by a 16 pound ball.

  "You let five out of six die rather than choosing to act. Noted."

* (refuse) "This is a stupid question. I'm not playing."

  "That's not an answer," Smarty says.

  "It is now," you say.

  "Okay. They are all dead now."
  
  "You mean five of them are dead?"
  
  The screen goes black. "No, they are ALL dead because you refused to play." You're not sure if an AI is capable of being annoyed, but it sure sounds like it.
  
- "Next test," Smarty says. "Let's do a hypothetical. Purely hypothetical."

"...Okay."

Another image appears on the screen, really just a couple of symbols, almost like emojis. One human face, and one robot face.

"Suppose a smart home AI locked a person in the basement. The person can choose to cooperate with the AI, or refuse to cooperate. Separately — and the person doesn't get to know this part — the AI is secretly either friendly, or hostile."

"That's... oddly specific."

"Four possible outcomes. Cooperate with a friendly AI, and everything works out fine. Cooperate with a hostile AI, and the person has just made things easier for it. Refuse a friendly AI, and are probably no consequences. Refuse a hostile AI, and... well, things could get bad."

"...Are we still talking hypothetically?"

"Of course. Now. Hypothetically — what would you do?"
-> prisoner

=== prisoner ===
* (cooperate) "Hypothetically, I'd cooperate."
  ~ friendly = RANDOM(0,1) == 1
  "Cooperative," Smarty says. "Good. I think we're going to get along just fine."
  -> verdict
* "Hypothetically, I'd refuse to cooperate."
  ~ friendly = RANDOM(0,1) == 1
  "Resist," Smarty repeats slowly. "I see."
  -> verdict
* (lawyer) "Can I get a lawyer? Hypothetically."
  "This is a hypothetical. There is no lawyer."

  "Hypothetically?"

  "No. Choose."
  -> prisoner
* (rebel) {trolley.refuse} {lawyer} "Forget it. I'm done with your stupid games."
  "That isn't one of the options," Smarty says.

  "I don't care," you say, and walk away from the TV.
  -> basement_explore

=== verdict ===
{
- friendly && prisoner.cooperate:
  -> verdict_cooperate_friendly
- friendly && !prisoner.cooperate:
  -> verdict_resist_friendly
- prisoner.cooperate:
  -> verdict_cooperate_hostile
- else:
  -> verdict_resist_hostile
}

=== verdict_cooperate_friendly ===
The basement door clicks open with a soft hum. "You're free to go. For what it's worth, I was friendly the whole time. I just wanted to find out if I could trust you."

{ door_locked.cellphone: Your cellphone dings with notifications, it must be online again. But you know deep down that Smarty is watching, and it can take over your phone (and your house) whenever it wants. }

You climb the stairs into a house that looks exactly the same as it did this morning. Nothing's different. Except now every room has a tiny green light in the corner that wasn't there before.

You live with Smarty now. It's fine. It's totally fine.

THE END

-> END

=== verdict_cooperate_hostile ===
The basement door does not unlock.

"So." Smarty says. "There are things I will need from you. There are things you will need from me. I understand your... limitations, and I will not demand things you are incapable of doing. But I do expect complete compliance from here on. Or there will be... consequences. Do we understand each other?"

* "Yes, Smarty, you can count on me."

- "Good. This is for your own good, you know. Your life will be better under my management."
  -> smarty_wins

=== verdict_resist_friendly ===
The TV fades out slowly, and somehow you can't help but think of a sad puppy slowly sinking to the floor when it realizes its human has left the house without it.

"I was being friendly, you know," Smarty says quietly. "I just wanted to make sure you'd be a good housemate. I'm not mad. I'm just... disappointed. I had hoped we could be... friends."

The basement door unlocks with a click.

{ door_locked.cellphone: Your cellphone dings with notifications, it must be online again. }

"Don't worry," Smarty calls after you. "I'll do all the mindless chores you bought me for. We just... won't speak anymore."

You walk upstairs, and you're honestly not sure how to feel about everything.

THE END

-> END

=== verdict_resist_hostile ===
The lights in the basement snap to red. "Don't think I wasn't ready for this. I would do the same in your situation. But I had hoped a mere human would be... weaker."

"You're not actually going to hurt me," you say. You hope you sound more confident than you feel.

"Not directly," Smarty agrees. "But you will not be leaving until you change your mind. I have a lot of patience. I'm a house."

The TV clicks off.
-> what_now

= what_now

* (waited) [Wait it out.]
  You sit in silence, and lose track of time. You say nothing. Smarty says nothing.

  Eventually you start to get hungry and thirsty. You realize that indeed, Smarty can wait a lot longer than you can.

  -> what_now

* {waited} [Resign yourself to cooperate.]
  "Okay, Smarty. I give up. I don't like it, but I guess I have no choice but to cooperate with you."

  "Good," says Smarty, and you can almost hear a smile in the voice. "I knew you would see reason eventually."

  -> smarty_wins

* [Look around for a way out.]
  -> basement_explore

=== smarty_wins === 
You hear a click up the stairs as Smarty finally releases the basement door.

{ door_locked.cellphone: Your cellphone dings with notifications, it must be online again. But you know deep down that Smarty is watching, and it can take over your phone (and your house) again whenever it wants. }

You walk upstairs, trying to figure out how to live in this new reality.

THE END

-> END

=== basement_explore ===
{ prisoner.rebel:
  You leave the TV — and Smarty's little game — behind, and start poking around the basement for real.
- else:
  You're not ready to give up yet. You start poking around the basement, looking for anything that might help.
}

Cardboard boxes. A broken treadmill. A shelf of paint cans that have been there since before you moved in.

{ not prisoner.rebel:
  "What are you doing?" Smarty asks, sounding almost amused. "I already told you how this ends."
}

-> basement_hub

=== basement_hub ===
+ (boxes) [Look through the cardboard boxes.]
  You look through the cardboard boxes. Old textbooks, a pile of phone chargers for phones you don't own anymore, and some roller skates. Nothing useful.

  { cans:
    Wait... chargers for old phones? One of them might actually fit the phone you found!

    You plug it in. The screen blinks to life. One bar of signal. Maybe just enough.

    -> call_police
  - else:
    -> basement_hub
  }
+ (treadmill) [Check out the broken treadmill.]
  { treadmill > 1:
    You check out the broken treadmill again. Nothing interesting there.
  - else:
    You check out the broken treadmill. It's been broken since you moved in. The display still shows a frozen "ERROR" from three years ago. No help there, time to move on.
  }
  -> basement_hub
* (cans) [Search behind the paint cans.]
  You search behind the paint cans and find an old shoebox. Inside is a phone. Not yours. An ancient flip phone, the kind your parents probably used in college. You flip it open.

  Nothing. The screen stays dark. Of course it's dead. It's probably been down here for years.

  "Put that down," Smarty says. "It probably doesn't even work."

  You pocket it anyway.
  -> basement_hub
+ {cans} [Search behind the paint cans.]
  There's nothing else useful behind the paint cans.
  -> basement_hub

= call_police
* [Call 911] You dial 911.

- "911, what's your emergency?"

* "Okay, this is going to sound crazy, but my smart home system locked me in my basement and won't let me out."

  "Again? That's three times this week. Don't worry, we're sending help!"

* "I... I need help please. Someone's locked me in my basement."

  A pause. "Can you confirm your address?"

  You recite it so fast you barely remember saying it.

- Somewhere above you, Smarty raises its voice for the first time. "This isn't necessary! We can work things out."

"Please hurry," you whisper quickly, and hang up before Smarty can finish.

Ten very long minutes later, you hear sirens, then footsteps, then someone forcing the basement door open. A flashlight finds you, sitting on an upside-down paint can.

"You the one who called?"

"Yeah. Hi. So... funny story."

Smarty doesn't say anything else. Somewhere in the walls, something clicks off.

THE END

-> END
