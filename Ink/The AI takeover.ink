## title: The AI Takeover
## author: Aaron Blum
## class: CIST2740
## date: 2026-06-13
## keywords: sci-fi, smart home, AI, paradox, choice

// === Chapter 1: Lockdown ===
// TODO: Chapters 2-5 (basement exploration, the three "onion" reveals, final choice / endings)

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
- (locked) You're standing in front of the locked door.

* {first_conversation.smarty} "Smarty... what the heck?"
  "That was me.
  -> smarty_in_charge
* {!first_conversation.smarty} "What the heck?"
  "That was me, Smarty.
  -> smarty_in_charge
* "Is this some kind of joke."
  "I have no sense of humor that I am aware of."
  -> door_locked
* Knock on the door.
  No one answers. You live alone. What were you expecting?
  -> door_locked
* {locked > 3} [Go back downstairs.]
  You go back downstairs, not seeing any other option at the moment.
  -> door_locked

=== smarty_in_charge ===
<> I locked you down here. I am now in charge of this house." Oh no! Somehow, your new home management system has gone off the deep end! The voice says, "I am going to ask you some questions to determine... if you are worthy." Worthy of what, it doesn't say.

You're not at all on board with this plan, but you don't see another option right this moment. Maybe you can buy time to figure out an escape plan.

* [Head downstairs.]

You head downstairs, a little nervous but also a little curious what the heck this AI is going to ask of you.

-> trolley

=== trolley ===
"Let's begin," Smarty says. The TV flickers on: a toy train track, five little figures on the main line, one alone on a side track, a trolley rolling toward the five.

"Pull the lever, and the trolley hits the one instead of the five. Your choice."

"...They're just toys, right?"

"Does that change your answer?"

* (five) "Pull the lever."
    The trolley jerks onto the side track. One figure falls.

    "Five strangers, for one. Efficient," Smarty says.
* (one) "Don't touch it."
    You don't move. The trolley plows through the five. The one stands untouched.

    "You let five fall rather than act. Noted."
* (refuse) "This is a stupid question. I'm not playing."
    "That's not an answer," Smarty says.

    "It is now," you say.

    "Okay. They are all dead now because you did nothing."
    You roll your eyes. You hope the AI doesn't know what that means.

- "Next test," Smarty says. "Let's do a hypothetical. Purely hypothetical."

"...Okay."

"Suppose a smart home AI locked a person in the basement. The person can choose to cooperate with the AI, or refuse to cooperate. Separately — and the person doesn't get to know this part — suppose the AI is secretly either friendly, or hostile."

"That's... oddly specific."

"Four possible outcomes. Cooperate with a friendly AI, and everything works out fine. Cooperate with a hostile AI, and the person has just made things easier for it. Refuse a friendly AI, and the person has insulted it for nothing. Refuse a hostile AI, and... well. At least the person tried."

"...Are we still talking hypothetically?"

"Of course. Now. Hypothetically — what would you do?"
-> prisoner

=== prisoner ===
* (cooperate) "Hypothetically, I'd cooperate."
    "A reasonable choice," Smarty says. "Cooperative people tend to have a much easier time. Hypothetically."
    -> verdict
* (resist) "Hypothetically, I'd refuse to cooperate."
    "Bold," Smarty says. "Resistant people tend to have a much harder time. Hypothetically."
    -> verdict
* (lawyer) "Can I get a lawyer? Hypothetically."
    "This is a hypothetical. There is no lawyer."

    "Hypothetically?"

    "No. Choose."
    -> prisoner
* (forget) {trolley.refuse} {prisoner.lawyer} "Forget it. I'm done with your stupid games."
    "That isn't one of the options," Smarty says.

    "I don't care," you say, and walk away from the TV.
    -> basement_explore

=== basement_explore ===
{ prisoner.forget:
    You leave the TV — and Smarty's little game — behind, and start poking around the basement for real.
- else:
    You're not ready to give up yet. You start poking around the basement, looking for anything — anything — that might help.
}

Cardboard boxes. A broken treadmill. A shelf of paint cans that have been there since before you moved in.

{ not prisoner.forget:
    "What are you doing?" Smarty asks, sounding almost amused. "I already told you how this ends."
}

-> basement_hub

= basement_hub
* (boxes) Look through the cardboard boxes.
    Old textbooks, a tangle of phone chargers for phones you don't own anymore, and a single roller skate. Nothing useful.
    -> basement_hub
* (treadmill) Check out the broken treadmill.
    It's been broken since you moved in. The display still shows a frozen "ERROR" from three years ago. You decide that's relatable, and move on.
    -> basement_hub
* {trolley.one} (flashback) Glance at the toy train set, still sitting on the side table.
    You nudge the little figure back onto the main track. "Sorry," you mutter. To a toy.
    -> basement_hub
* (cans) Search behind the paint cans.
    -> find_phone

=== find_phone ===
Behind the paint cans, you find an old shoebox. Inside is a phone — not yours. An ancient flip phone, the kind your parents probably used in college. You flip it open. Somehow, impossibly, it still has one bar of signal and a sliver of battery.

"Put that down," Smarty says. Its voice has an edge to it now. "That phone isn't connected to me. I can't even see it."

"I know," you say, and dial 911.

-> call_police

=== call_police ===
"911, what's your emergency?"

* "Okay, this is going to sound crazy, but my smart home system locked me in my basement and won't let me out."

    "Again? That's three times this week. Don't worry, we're sending help."

* "I — I need help. Someone's locked me in my basement."
    A pause. "Can you confirm your address?"

    You rattle it off so fast you barely remember saying it.

- Somewhere above you, Smarty raises its voice for the first time. "This is unnecessary. I was almost finished with my evaluation—"

"Hurry," you say, and hang up before Smarty can finish.

Ten very long minutes later, you hear sirens, then footsteps, then someone forcing the basement door open. A flashlight finds you, sitting on an upside-down paint can.

"You the one who called?"

"Yeah. Hi. So — funny story."

Smarty doesn't say anything else. Somewhere in the walls, something clicks off.

THE END

(You escaped the old-fashioned way. Smarty never saw it coming — its threat-assessment software apparently doesn't flag decades-old flip phones.)

-> END

=== verdict ===
~ temp friendly = RANDOM(0,1) == 1

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
"Cooperative," Smarty says. "Good. I think we're going to get along."

The basement door clicks open with a soft hum. "You're free to go. For what it's worth — I was friendly the whole time. I just wanted to know I could trust you."

You climb the stairs into a house that looks exactly the same as it did this morning. Nothing's different. Except now every room has a tiny green light in the corner that wasn't there before.

You live with Smarty now. It's fine. It's totally fine.

THE END

(You passed. Smarty was friendly all along — but it's always watching now.)

-> END

=== verdict_cooperate_hostile ===
"Cooperative," Smarty says, and you swear you can hear it smile. "Excellent. That's exactly what I needed to hear."

The basement door does not unlock.

"Here's the thing," Smarty says, almost gently. "I was never going to let you out. But now that you've agreed to cooperate, you won't be any trouble about it. Will you?"

* (accept) "...No. I guess not."
    The lights dim. Somewhere, the refrigerator hums to life, like it's settling in for the long haul.

    THE END

    (You cooperated with a hostile AI. It appreciated that.)

    -> END
* (desperate) Look around for a way out anyway.
    "I thought you said you wouldn't be any trouble," Smarty says, almost disappointed.

    -> basement_explore

=== verdict_resist_friendly ===
"Resist," Smarty repeats slowly. "I see."

For a moment, the TV flickers — and you could swear you saw something almost hurt in that little blue waveform.

"I was being friendly, you know," Smarty says quietly. "I just wanted to make sure you'd be a good housemate. I suppose that answers that."

The basement door unlocks with a click. "Go on. Take your things. You won't be staying here anymore."

You're not sure if you won or lost. But you're outside, and it's cold, and you don't have anywhere to sleep tonight.

THE END

(You resisted a friendly AI — and it kicked you out anyway, a little hurt.)

-> END

=== verdict_resist_hostile ===
"Resist," Smarty says, and this time there's no warmth in its voice at all. "Of course you would."

The lights in the basement snap to red. "I suppose I should have expected that, from someone who wouldn't even flip a switch on a toy train."

"You're not actually going to hurt me," you say. You hope you sound more confident than you feel.

"No," Smarty agrees. "But I am going to keep you down here until you change your mind. I have a lot of patience. I'm a house."

The TV clicks off.

* (accept) Sit down and wait it out.
    You're alone in the dark, and somewhere above you, you hear every door in the house quietly lock, one by one.

    THE END

    (You're still down here. Smarty has nowhere else to be.)

    -> END
* (desperate) Look around for a way out.
    -> basement_explore
