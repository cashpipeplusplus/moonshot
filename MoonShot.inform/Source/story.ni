"MoonShot" by "Joey & Charity Parrish".


[Bibliographic Information]
The story genre is "Comedy".
The release number is 1.
The story description is "A NASA intern in the 1960s scrambles to make Apollo 11 a success."
The story creation year is 2020.



[
===== ===== ===== Before reading further ... ===== ===== =====

If you intend to play through the game,
please do so before you read the source code, to avoid spoilers.

===== ===== ===== Thanks for your attention! ===== ===== =====
]



[Configuration]
Include the Standard Rules by Graham Nelson.
Include Punctuation Removal by Emily Short.
Include Locksmith by Emily Short.
Include Exit Lister by Gavin Lambert.
Include Vorple Screen Effects by Juhana Leinonen.
Include Concepts by Joey Parrish.
Include Drinks by Joey Parrish.
Include Strangers by Joey Parrish.
Include Better Asking by Joey Parrish.
Include Better Sitting by Joey Parrish.
Include Checklists by Joey Parrish.
Include Help by Joey Parrish.
Include Options by Joey Parrish.
Release along with a "Custom" website. [See MoonShot.materials/Templates/Custom]
Release along with the "Vorple" interpreter.
Release along with the style sheet "moonshot-custom-styles.css".
Release along with the file "pause.js".
Release along with the file "KBKinderWrite.woff".
Release along with the file "KBKinderWrite.woff2".
Release along with the file "Icon.png".
Release along with the file "unicorn.jpg".
Release along with cover art ("An camera reflected in an astronaut's helmet").
[The text associated with the cover art is a description for the blind.]
Use American dialect.
Use serial comma.



[Styling]
blockquote is a Vorple style.
room-heading is a Vorple style.
room-name is a Vorple style.
direction-name is a Vorple style.
author-line is a Vorple style.
title-line is a Vorple style.
copyright-line is a Vorple style.
created-with-line is a Vorple style.
hint is a Vorple style.
plaque-card is a Vorple style.
ending-card is a Vorple style.
personnel-file-card is a Vorple style.
nameplate-card is a Vorple style.
continue is a Vorple style.

This is the fancy room description heading rule:
	say "[room-heading style][bold type][Location][roman type][end style]".
The fancy room description heading rule substitutes for the room description heading rule.

Rule for printing the name of a room (called the place):
	say "[room-name style][printed name of place][end style]";

Rule for printing the name of a direction (called whither):
	say "[direction-name style][printed name of whither][end style]".

The print obituary headline rule is not listed in any rulebook.
To show ending (N - number):
	say paragraph break;
	[NOTE: ending-card is centered in CSS.  See CSS for an explanation.]
	say ending-card style;
	say "You have discovered ending #[N] of 7 after [turn count] turns!";
	say end style;
	end the story.



[Other tweaks]
After reading a command:
	Resolve punctuated titles.
[This is so that things like "examine Mr. Furtwangler" are understood.
Otherwise, the period ends the player's command command.]

[I don't like how Emily Short's "pause the game" rule clears the screen after continuing. Here's my own definition built on some of hers.]
To pause:
	if Vorple is supported:
		center "[continue style](click or tap to continue)[end style]";
		execute JavaScript code "pauseGame()";
		wait for any key;  [This doesn't work somehow with the keyboard, but the pauseGame() function can simulate a keypress directly into the prompt to unblock the interpreter.]
	otherwise:
		say "[paragraph break]Please press SPACE to continue[line break]";
		wait for the SPACE key;
	say line break;

[One play tester kept using "exa" instead of "x" or "examine" because that alias works in some common MUD games.  Support it here.]
Understand "exa [thing]" as examining.



[Intro]
This is the fancy banner rule:
	if Vorple is supported:
		[The HTML-based Vorple interpreter can handle centering a large block of text very well.]
		center "[blockquote style]'We choose to go to the moon in this decade... because that goal will serve to organize and measure the best of our energies and skills, because that challenge is one that we are willing to accept, one we are unwilling to postpone...'[line break][line break]-- U.S. President John Fitzgerald Kennedy[end style]";
	otherwise:
		[In other interpreters, it looks better broken up into explicit lines, with each one centered.]
		center "'We choose to go to the moon in this decade...";
		center "because that goal will serve to organize and";
		center "measure the best of our energies and skills,";
		center "because that challenge is one that we are";
		center "willing to accept, one we are unwilling";
		center "to postpone...'";
		center "[line break]";
		center "-- U.S. President John Fitzgerald Kennedy";
	say paragraph break;
	say paragraph break;
	[Note that there is a requirement in the Inform license that we mention Inform somewhere, so we do so here.]
	if Vorple is supported:
		center "[blockquote style][title-line style][italic type]MoonShot[roman type][end style][line break][author-line style]Story by Joey & Charity Parrish[end style][line break][copyright-line style]Copyright (C) 2020[end style][line break][created-with-line style]Created with Inform 7[end style][end style]";
		say line break;
	otherwise:
		center "[italic type]MoonShot[roman type]";
		center "Story by Joey & Charity Parrish";
		center "Copyright (C) 2020";
		center "Created with Inform 7";
	pause;
	say paragraph break;
	say paragraph break.

The display banner rule is not listed in the startup rulebook.
The fancy banner rule is listed before the start in the correct scenes rule in the startup rulebook.
[Subtle difference in timing: we want our intro shown first, not right before the initial room description where the typical banner rule goes.  This means that our intro happens before "when play begins", which is when our first scene begins.  It was really tricky to work out how to time this correctly.]

The detect interpreter's Vorple support rule is listed before the fancy banner rule in the startup rulebook.
[This would normally happen when play begins, but we need to detect Vorple support earlier for use in the fancy banner.]



[General]

The weather is a concept.
[We can talk about it or ask about it in any room.  But if you try to look at it...]
Instead of examining the weather, say "Hrm... why are there no windows in this building?"

[You can ask anyone about their name.  It's only polite.]
Name is a concept.

NASA is a concept.
Understand "second a" and "second a in NASA" as NASA.

Apollo is a concept.
[Handle variations, including misspellings that I myself (JCP) am prone to:]
Understand "Apollo", "Apollo 11", "Apollo 11 project", and "Apollo project" as Apollo.
Understand "Appollo", "Appollo 11", "Appollo 11 project", and "Appollo project" as Apollo.
Understand "Appolo", "Appolo 11", "Appolo 11 project", and "Appolo project" as Apollo.

The command module is a physical concept.
Understand "CSM" as the command module.

The rocket is a physical concept.
Understand "rocket", "Saturn", "Saturn V", "Saturn V rocket", and "rockets" as the rocket.

Work is a concept.

The crew is a concept.
Understand "candidates", "crew candidates", "choosing the crew", "astro nots", and "astronots" as the crew.
[We'd like Inform to understand "astronauts" as "crew", but instead, it asks the player which astronaut they mean.  This pre-emptive manipulation of the command text is the only workaround I can find. -JCP]
After reading a command:
	let N be "[the player's command]";
	replace the regular expression "\bastronauts\b" in N with "crew";
	change the text of the player's command to N.

Equations is a concept.
Rocket-equations is a concept.
Understand "rocket equations" as rocket-equations.  [If I give the object its natural name instead of using "understand", then "equations" results in a disambiguation prompt between "equations" and "rocket equations", which is confusing.]

[The built-in default for asking someone about an unknown thing is "There is no reply."  We'd prefer a different default for topics we haven't coded explicitly.  Sadly, this has to be repeated for both the built-in "asking" (for arbitrary text) and for "quizzing" (for objects/people).]

Instead of quizzing someone (called person) about:
	say "'[one of]Oh, I don't know anything about that[or]Let's talk about something else[or]I'm not sure what to say about that[purely at random],' says [the person]."

[By default, only "sorry" triggers this action.]
Understand "say sorry", "apologize", "apologise", and "console" as saying sorry.
[Some folks naturally want to apologize to the person specifically.]
Saying sorry to is an action applying to one thing.
Understand "say sorry to [someone]", "apologize to [someone]", "apologise to [someone]", and "console [someone]" as saying sorry to.
Instead of saying sorry:
	say "What is there to apologize for?"
Instead of saying sorry to a person:
	say "What is there to apologize for?"


[By default, we don't get to see what people are carrying.  This changes that.]
After examining a person (called Bob):
	let stuff be the list of things carried by Bob;
	repeat with X running through stuff:
		if X is worn by Bob, remove X from stuff;
		if X is uninteresting, remove X from stuff;
	if stuff is not empty:
		say "[The Bob] is carrying [stuff].";

[By default, we don't seem to get a description of what rooms are adjacent to the current room, and in what direction.  This is something I'm used to seeing in IF, and I'd like to avoid writing it explicitly in every room.  Including the "Exit Lister" extension solves that.  But it needs a little configuration for this game.  We want to always tell the user what the names of nearby rooms are, even if we have not yet been to them.  For this, we use:]
A room memory rule:
	rule succeeds.

Things can be critical.
Instead of dropping something critical:
	say "No, you're going to need that."

[This seems unlikely to come up in practice, but now that we are creating "enterable" game objects such as chairs, I thought I'd throw this in.  You can get this by the phrases "enter" or "sit on".]
Instead of entering a person:
	say "[The noun] looks shocked that you should even try it!  [bold type][italic type]'SECURITY!'[roman type]  NASA security arrives shortly, hauls you carelessly to the building exit, and then tosses you into the street.  You have been fired for sexual harassment in 1969, in spite of the term not being coined until 1975.  But then, you always [italic type]did[roman type] consider yourself ahead of your time.";
	show ending 2.

[As if the above wasn't risque enough...]
Instead of entering yourself:
	let occupants be the list of people in the location;
	remove yourself from occupants;
	if occupants is empty:
		[At least the player is alone, but still...]
		say "Please don't.  This is a place of business.";
	otherwise:
		try entering entry 1 of occupants.  [Chain to the ending above for harassment.]

A person can be asleep.
Understand "wake [someone]" and "wake [someone] up" and "wake up [someone]" as waking.
The block waking rule is not listed in any rulebook.  [Override the built-in rule, which is not useful.]
Carry out waking:
	if the noun is not asleep:
		say "[The noun] appears to be awake already.";
		stop the action;
	else:
		[Don't print anything in particular.  Add specific rules for specific people to describe the act.]
		now the noun is not asleep;

[Sometimes, we have a piece of scenery that is technically portable, but that we don't want the player to take.  The default for taking scenery is "that's hardly portable", but sometimes, that isn't true.  So this type prints a different message.]
Portable-scenery is a kind of thing.
Portable-scenery is scenery.
Instead of taking portable-scenery:
	say "It's probably best if you leave that alone."

[Clothing that is repeated among multiple characters must be a "kind" first.]
A tie is a kind of wearable thing.
A short-sleeved shirt is a kind of wearable thing.
A lab coat is a kind of wearable thing.

[We'd like to add a door as scenery, in case the player wants to examine the door.  However, "door" is a built-in kind in Inform, so we give it a hyphenated name in the source.]
The-door is a backdrop.  Understand "door" and "the door" as the-door.  The printed name of the-door is "the door".
The-door is everywhere.  [Every room has a door, but they are not interesting.]



[---------- DAY 1 ----------]
Day one is a scene.
Day one begins when play begins.
When day one begins:
	say "[room-heading style]NASA Headquarters, 1969[end style]";
	say line break;
	say "You did it!  You finally landed an internship at NASA, the National Aeronautics and Space ... Association?  Agency?  Authority?  You're not really sure what the last A stands for, but it's only your first day.  You're pretty certain you'll figure it out soon enough.[paragraph break]";
	say "After a whirlwind tour of NASA headquarters, which you are sure you've already [italic type]completely[roman type] forgotten, you are ushered into the office of your new boss: the director of NASA's Apollo program.  You heard recently that we're ready to send [italic type]a man to the moon[roman type].  You can scarcely believe it!  It's like something out of science fiction.  Nervously, you wait to be called into the inner office.[paragraph break]";

Intro hints shown is initially false.  [Sadly, if the first command fails, the turn count stays at 1, and the intro hints get shown over and over.  This boolean condition allows us to prevent that.]
Before reading a command while the turn count is 1:
	if intro hints shown is false:
		show hint "If you have never played interactive fiction before, you can type 'help' to get some basic instruction.";
		show hint "This game comes with a few options.  You can type 'options' to find out about them.";
		show hint "You can type 'verbs' to get a very brief reference of useful verbs.";
		show hint "You can talk to everyone.  Try 'talk to so-and-so' for suggestions on topics.";
		now intro hints shown is true;



The director's waiting room is a room.  "The tiny waiting room barely has enough room for you, [the secretary], and her [interesting]desk[/interesting].  [if the houseplant is in the waiting room]There's a [interesting]houseplant[/interesting] in a pot, hanging from the ceiling in elaborately knotted macrame.  [end if][The secretary] is chewing bubblegum and sporadically blowing bubbles as large as her face that startle you when they pop."
The printed name of director's waiting room is "NASA Director's Waiting Room".

The bubblegum is portable-scenery in the waiting room.  Understand "gum" as the bubblegum.
The macrame is portable-scenery in the waiting room.

In the waiting room is a stranger called the secretary.  The real name of the secretary is "Donna".
Understand "Donna", "her", "herself", and "woman" as the secretary.  The secretary is female.
The secretary can be mad.  When day one begins, now the secretary is not mad.

The secretary's desk is scenery in the waiting room.  "A simple teak desk with a light stain, and unusually spartan."
The secretary's desk is an enterable supporter.  [You can put things on it or sit on it.]

The orange chair is a chair in the director's waiting room.
The description of the orange chair is "A simple office chair, with classy orange upholstery.  Not too comfy, though."

The potted houseplant is in the waiting room.  "It's some kind of... ivy?  Maybe?"
Understand "plant" and "pot" as the houseplant.
The houseplant is undescribed.  [We already talked about it in the room description, so don't list it again.]

Instead of dropping the houseplant:
	say "You carefully hang the [houseplant] from the ceiling again, eliciting strange looks from [the secretary].";
	now the houseplant is in the waiting room;
	now the houseplant is undescribed.  [Don't mention it again as in the room.  The room description covers it.]

The houseplant is edible.
Instead of eating the houseplant:
	say "The houseplant tastes terrible, and your stomach quickly begins to cramp.  Before long, you're unable to walk.  You die on the way to the emergency room, [if day one is happening]Apollo 11 fails miserably,[otherwise]Operation Glitter fails and is exposed,[end if] and NASA becomes a worldwide laughing-stock.  Russia conquers the globe by 1972.  Your tombstone in Arlington National Cemetery reads 'Intern.'";
	show ending 1.

A phone is on the secretary's desk.  The description of the phone is "A black rotary telephone.  It looks brand new."
Understand "telephone" as the phone.

Phone-number is a concept.  Understand "phone number" and "number" as phone-number.
Instead of quizzing the secretary about phone-number:
	say "[The secretary] blushes.  With a sly look, she says 'Klondike-five, thirteen thirty-seven.'"

Instead of taking the phone:
	say "[The secretary] stands up quickly and snatches it back from you.  'What is the matter with you?' she yells.  It takes her a minute or so to get the [phone] plugged back in.";
	now the secretary is mad.

Instead of saying sorry while the player is in the waiting room and the secretary is mad:
	say "She doesn't look ready to forgive you."

The description of the secretary is "[if the secretary is mad]She glares at you and says 'Keep your eyes to yourself, you nut job.'[otherwise][The noun] is a youngish woman, possibly in her 30s, with a beehive haircut and horn-rimmed glasses.  She notices you looking and smiles."

The secretary wears a beehive haircut and horn-rimmed glasses.

Instead of talking to the secretary:
	say "Perhaps you could ask [the noun] about the weather, NASA, the Apollo 11 project, or her name."

Instead of quizzing the secretary about name:
	say "'It's Donna,' she says.  'Nice to meet you!'";
	now the secretary is known.

Instead of quizzing the secretary about the secretary:
	try quizzing the secretary about name.

Instead of quizzing the secretary about the weather:
	say "'Oh, it's lovely this time of year, don't you think?'"

Instead of quizzing the secretary about NASA:
	say "'I love working here at the National Aerospace and Space Anonymous.  I feel like I've really worked through so many of my issues about space and aeronautics since starting my job.'"

Instead of quizzing the secretary about Apollo:
	say "'Between you and me, the director really needs a win on this one.  Apollo 10 was a disaster.  His eyebrows still haven't grown back.  He's a little gunshy now and the word around the watercooler is, he's been a nervous wreck ever since.'"

Instead of talking to the secretary while the secretary is mad:
	say "She doesn't look like she wants to talk to you."

Instead of quizzing the secretary about anything while the secretary is mad:
	say "She harrumphs at you and continues to scowl."


When day one begins:
	secretary warns in 0 turns from now;
	director yells-1 in 4 turns from now.

Yourself can be told-to-wait.
At the time when secretary warns:
	if yourself has not been told-to-wait:
		say "[The secretary] catches your attention and says, 'The director will be with you shortly.  Please make yourself comfortable while you wait.'";
	now yourself is told-to-wait.

Before waiting in the waiting room:
	say "[one of]You sit awkwardly, wondering when this whole thing is supposed to get started.[or]Maybe there's something you can do, or something you should be talking about while you wait?[or]The waiting is the hardest part, isn't it?[purely at random]".

At the time when director yells-1:
	say "A booming voice comes from the director's office: 'Donna!  Where the hell is that kid?  They're late!'[paragraph break][The secretary] looks embarrassed and says quietly, 'You'd better go on in.  He [italic type]hates[roman type] tardiness.'";
	now the director is ready.

[Give periodic reminders to get into the director's office if the player misses the first yell.]
Every turn when the remainder after dividing the turn count by 5 is 0 and the director is ready and the director is not visited during day one:
	director yells-1 in 0 turns from now.

Instead of quizzing the secretary about the director:
	say "'Oh, Mr. Furtwangler is a visionary!' she says.  'He is completely on top of every aspect of this project.  I don't know how he does it!'";
	now the director is known.

Instead of going to the director's office while the director is not ready:
	say "[The secretary] jumps up and runs for the door, stopping you in your tracks.  'You can't go in there!  Just wait, please, and the director will be with you as soon as he is ready.'";
	if yourself is told-to-wait:
		[If the player has been told at least once before, they are perhaps having trouble with this waiting thing, so offer a hint.]
		say line break;
		show hint "You can explore the room, talk to [the secretary], examine things, or just type 'wait' to wait patiently.";
	now yourself is told-to-wait.

[In this language "in/inside" is actually a direction you could use to relate places to one another.  But in context of this room, we'd like "go in" to send you into the director's office.]
Instead of going inside while in the waiting room:
	try going north.



The director's office is north of the waiting room.  "The director's office has a full wall of [interesting]windows[/interesting] overlooking the hangar.  [The director] is drumming his fingers on the [interesting]desk[/interesting] and humming 'California Dreamin' in double time.  He's wearing a baby-blue, collared, short-sleeved shirt and about 8 oz of hair pomade.[if the triangular nameplate is on the director's desk]  On his desk is a small, triangular [interesting]nameplate[/interesting].[end if]".
The printed name of the director's office is "NASA Director's Office".

The director wears a baby-blue collared short-sleeved shirt, a tie, and pomade.
The printed name of the baby-blue collared short-sleeved shirt is "the shirt".  [We want the player to be able to refer to it by all of these things, but it's a mouthful when we print something about it.]
Understand "blue shirt", "blue collared short-sleeved shirt", and "blue short-sleeved shirt" as the baby-blue collared short-sleeved shirt.


[Since this is the only room with windows...]
Instead of examining the weather in the director's office:
	say "You glance out the windows, but you can't see much other than the hangar."
The windows are scenery in the director's office.
Instead of examining the windows, try examining the weather.

In the director's office is a stranger called the director.  The real name of the director is "Mr. Furtwangler".  The director is male.

Understand "director", "dirk", "mr furtwangler", "mister furtwangler", "furtwangler", "boss", "him", "himself", and "man" as the director.

The director can be agitated or relaxed.  When day one begins, now the director is agitated.

The director can be ready.  When day one begins, now the director is not ready.
The director can be visited.  When day one begins, now the director is not visited.

After going to the director's office:
	now the director is visited;
	continue the action.

The director's desk is scenery in the director's office.  "An expansive desk covered in whirring desk gadgets that roll chrome metal balls back and forth endlessly on balanced tracks, as well as several bobblehead dolls.[if the triangular nameplate is on the director's desk]  On the desk is a small, triangular [interesting]nameplate[/interesting].[end if]".
The director's desk is an enterable supporter.  [You can put things on it or sit on it.]

The gadgets are scenery in the director's office.
The tracks are scenery in the director's office.
The balls are portable-scenery in the director's office.
The bobblehead dolls are portable-scenery in the director's office.

The triangular nameplate is an openable, closed, undescribed thing on the director's desk.
Instead of examining the triangular nameplate:
	say "A small, wooden, triangular prism with an engraved metal plate attached that reads:[line break]";
	if Vorple is supported:
		center "[nameplate-card style][bold type]Dirk Furtwangler[roman type][line break]Director[end style]";
	otherwise:
		center "[bold type]Dirk Furtwangler[roman type]";
		center "Director";
	now the director is known;
	if the player has the triangular nameplate:
		if a random chance of 3 in 10 succeeds:
			say "The nameplate rattles a bit as you turn it."

Rule for printing the name of the triangular nameplate:
	say "triangular nameplate";
	omit contents in listing.  [So that we don't give away the secret that it can be opened.]

After taking the triangular nameplate:
	now the triangular nameplate is described;
	continue the action.

After putting the triangular nameplate on the director's desk:
	now the triangular nameplate is undescribed;  [It goes back to being described in the room and desk descriptions, so don't duplicate it in the room's contents.]
	continue the action.

The wooden armchair is a chair in the director's office.
Understand "chair" as the wooden armchair.  [Duh.]
The description of the wooden armchair is "A comfy-looking wooden armchair, with dark, mulberry-colored upholstery."

There is a checklist on the director's desk called checklist-1.
The printed name of checklist-1 is "Apollo 11 checklist".
The description of checklist-1 is "The checklist is [if checklist-1 is on the director's desk]laying on the desk, [end if]scribbled out in childish print."
Checklist-1 can be ready.  When day one begins, now checklist-1 is not ready.
Understand "Apollo 11 checklist" as checklist-1.

The description of the director is "[if the director is relaxed]He gazes dreamily out the window and asks, 'Do you think Johnny Cash is his real name?'[otherwise][The noun] is a man in his 60s with a hawkish nose and an absent air, like a man who can't seem to remember why he's here.  He's holding a comically large cup of coffee in one hand and the other keeps pawing through the jumble of knick knacks on his desk, like he's lost something."

The director is holding a coffee-cup.  The printed name of the coffee-cup is "coffee cup".  Coffee-cup is uninteresting.
The description of the coffee-cup is "Where does someone even find such a gigantic cup?"
Understand "cup", "coffee cup", "cup of coffee", "large cup", "large cup of coffee", "comically large cup", "comically large coffee cup", and "comically large cup of coffee" as the coffee-cup.

Instead of talking to the director:
	say "Perhaps you could ask [the director] about the internship, what the second A in NASA stands for, the Apollo 11 project, or his name."

Instead of quizzing the director about name:
	try quizzing the director about the director.

Instead of quizzing the director about the director:
	say "'Furtwangler.  Dirk Furtwangler.  Boy am I glad you're here!'";
	now the director is known.

The internship is a concept.  The internship is everywhere.
Instead of taking the internship:
	say "(You've already been hired.)"

Instead of quizzing the director about the internship:
	say "'Well you know how these things are.  We're terribly busy here at NASA.  Just an unreasonable amount of space out there.  Downright oppressive, when you start to think about how much of it there is!  So much space to analyze....' His voice trails off into a troubled hum until he notices you looking at him.  He continues, 'Which is exactly why we need you, the intern, to take care of this whole messy Apollo 11 business.'  He indicates the [interesting]checklist[/interesting][if checklist-1 is on the director's desk] on his desk[end if].  'Get started, kid!'";
	now checklist-1 is ready.

Instead of quizzing the director about NASA:
	say "The director looks surprised by your question.  'NASA?  Well, of course, everyone knows about the National Aeronautics and Space...  uhh... It's about space.  That's the important bit.  [bold type]LOTS[roman type] of space out there.'"

Instead of quizzing the director about anybody:
	say "He stares blankly for a second, then says, 'Who?'"

Instead of quizzing the director about Apollo:
	say "'I'm definitely not scared of getting started.  Definitely not.  There's no reason that Apollo 11 won't be a raging success.  No reason whatsoever.'  He looks very uncertain and his hands are quivering as he speaks."

Instead of quizzing the director about checklist-1:
	say "'Oh, I'm glad you asked about that,' he says.  'This is a detailed and highly technical checklist of the things I need you to do today.  Now, I wrote this myself, so please don't hesitate to ask me if you need help with any of these things'.";
	now checklist-1 is ready.

Instead of quizzing the director about crew:
	say "[The director] beams proudly.  'Fine folks, those astronauts.  Finest, best, most American astronauts that America ever produced.'  His brow furrows for a moment before adding, [if day one is happening]'Well, most of [']em.  Anyway, you can get all the particulars down in personnel.'[otherwise]'Well, most of [']em.  I shouldn't get into it.'[end if][line break]".

Instead of quizzing the director about blueprints:
	say "[The director] starts shaking his head before you even finish asking.  'No, no, not my department.  Go down to engineering, talk to that what's-his-name.  The one who's too cool for school.'";

Instead of quizzing the director about rocket-equations:
	say "'Uh, yeah.  Of course I know about those,' he says with a scared look on his face.  'But you go ask the eggheads in the lab about that.  They like to show off.'";
Instead of quizzing the director about equations:
	try quizzing the director about rocket-equations.

[Keep the player from leaving without the checklist.]
Instead of going from the director's office during day one:
	if checklist-1 is carried by the player:
		continue the activity;
	otherwise if checklist-1 is not ready:
		try taking checklist-1;  [So that the director will ask you to stop and talk first.]
	otherwise:
		say "'Hang on!' says [the director].  'You're gonna need this!'.  He indicates the checklist[if a checklist is on the director's desk] laying on his desk[end if].  'Get all of that done, ASAP.'"

[Keep the player from taking the checklist until you've talked to the director first.]
Instead of taking checklist-1:
	if checklist-1 is ready:
		say "[The director] looks relieved and drawls, 'Oh, thank you, wasn't sure how I was gonna get all that done!'";
		show hint "You can examine the [interesting]checklist[/interesting] to see the details.";
		now the director is relaxed;
		continue the action;
	else:
		say "'Not so fast!' says [the director].  'We need to talk first.'";
		show hint "You can 'talk to director' for suggestions on topics.";

Reporting to is an action applying to one thing.  Understand "report to [someone]" as reporting to.
Check reporting to someone:
	if the player has checklist-1:
		try giving checklist-1 to the noun;
	otherwise if the player has checklist-2:
		try giving checklist-2 to the noun;
	otherwise:
		say "You don't have anything to report."

Instead of giving a checklist (called proof of your good work) to the director:
	if proof of your good work is not complete:
		say "'Whoa,' says [the director], 'what is this?  You've still got work to do, kid!  Get back out there, and don't come back until it's all done!'";
	otherwise:
		say "[The director] scrutinizes the list, then smiles at you and drawls, 'Good job, kid.  Come back tomorrow for your next assignment!'";
		now the director has proof of your good work.



Checklist-1 is critical.  [You can't drop it.]
Get-blueprints is a checklist-item.  The printed name of get-blueprints is "Get command module blueprints".
Get-equations is a checklist-item.  The printed name of get-equations is "Get rocket equations".
Choose-crew is a checklist-item.  The printed name of choose-crew is "Choose astro nots (sp?)".
TBD is a thing.  The printed name of TBD is "__________".  TBD is uninteresting.
The sub-items of choose-crew are {TBD, TBD, TBD}.
The items of checklist-1 are {get-blueprints, get-equations, choose-crew}.



The Main Hallway is east of the director's office.  "A long, blank hallway, with several doors branching off in various directions and a stairwell leading down.  A bronze [interesting]plaque[/interesting] is hanging on the wall in the center of the hallway."

A bronze plaque is scenery in the hallway.
Instead of taking the bronze plaque:
	say "The plaque is bolted to the wall."

Instead of examining the plaque:
	say "Engraved in bronze, the plaque says:[line break]";
	if Vorple is supported:
		center "[plaque-card style][bold type]Apollo[roman type][line break]Never give up, never surrender![end style]";
	otherwise:
		center "[bold type]Apollo[roman type]";
		center "Never give up, never surrender!"



The engineering department is east of the hallway.  "It's filled with grey upholstered cubicles and smells like pencil shavings and burned coffee.  At the end of the room is a large whiteboard, at the top of which is written APOLLO 11.  Underneath the heading are some inscrutable diagrams, and in the bottom right corner, someone has drawn a unicorn."
The printed name of the engineering department is "NASA Engineering Department".

The unicorn is scenery in the engineering department.
Instead of examining the unicorn:
	if Vorple is supported:
		place an "img" element called "unicorn";
	otherwise:
		[Many thanks to https://www.asciiart.eu/mythology/unicorns]
		[The escaping ruins the effect in the source code.  :-( ]
		say fixed letter spacing;
		say "                    /[line break]";
		say "               ,.. /[line break]";
		say "             ,[']   ['];[line break]";
		say "  ,,.__    _,['] /['];  .[line break]";
		say " :['],[']  ~~~~    [']. [']~[line break]";
		say ":['] (   )         )::,[line break]";
		say "[']. [']. .=----=..-~  .;['][line break]";
		say " [']  ;[']  ::   [']:.  ['][quotation mark][line break]";
		say "   (:   [']:    ;)[line break]";
		say "    \\   ['][quotation mark]  ./[line break]";
		say "     ['][quotation mark]      ['][quotation mark][line break]";
		say variable letter spacing.

Instead of taking the unicorn:
	say "Only the pure of heart may approach a unicorn."

The diagram is scenery in the engineering department.
Understand "diagrams" as the diagram.
Instead of examining the diagram:
	if Vorple is supported:
		place a link to web site "https://xkcd.com/730/" reading "You can't make any sense of it.";
		say line break;
	otherwise:
		say "You can't make any sense of it."

The cubicles are scenery in the engineering department.  "These are standard cubicles for standard engineers.  They are precisely measured, in imperial units.  America!"

The whiteboard is scenery in the engineering department.  "At the top of the whiteboard, someone has written 'APOLLO 11'.  Underneath the heading are some inscrutable [interesting]diagrams[/interesting], and in the bottom right corner, someone has drawn a [interesting]unicorn[/interesting]."




In the engineering department is a stranger called the engineer.  The real name of the engineer is "Rick".  The engineer can be sad.  When day one begins, now the engineer is not sad.  The engineer is male.

The engineer is carrying the blueprints.  The description of the blueprints is "The blueprints, which are distinctly white, say '[bold type]Apollo 11 Command Module[roman type]' on the top.  [if the player has the blueprints]They are looking a little worse for wear, to say the least.[otherwise]The drawing of the command module is surprisingly lifelike.  You've never seen a more beautiful rendering of a truncated cone."

The blueprints can be discussed.  [Only when you've asked about them can you take them.]
The blueprints are critical.  [You can't drop them.]
The blueprints are plural-named.  [Don't call them "a blueprints".]

In the engineering department is a liquid-safe container called a coffee-pot.  The printed name of coffee-pot is "coffee pot".
[Accept a few misspellings of coffee.]
Understand "coffee pot", "cofee pot", "coffe pot", "cafe pot", "cofe pot", and "pot" as the coffee-pot.

The coffee is a drink in the coffee-pot.  The amount of coffee is 1000 ml.  The indefinite article is "some".
[Accept a few misspellings of coffee.]
Understand "cofee", "coffe", "cafe", and "cofe" as coffee.

Instead of taking the coffee:
	say "Most of it slips through your fingers, but you manage to get some of it to stain your pockets, too.";



The description of the engineer is "[if the engineer is not sad]He is tall and thin, with slicked-back ginger hair and a short-sleeved shirt and tie.  He is wearing a pocket protector and a [interesting]name badge[/interesting].  What a nerd![otherwise][The noun] is just about the saddest thing you've ever seen.  His hair is a mess, and he appears to have been wiping his tears on his tie."

The engineer wears a tie, a short-sleeved shirt, and a pocket protector.
The tears are scenery in the engineering department.



Instead of saying sorry while the player is in the engineering department and the engineer is sad:
	say "He sniffs a little, then says 'Um, yeah, okay.  Apology accepted.'";
	now the engineer is not sad.

Understand "ginger", "nerd", "man", "him", "himself", and "Rick" as the engineer.

The engineer is wearing a name-badge.  The printed name of the name-badge is "name badge".
Understand "badge" and "name badge" as name-badge.  [To disambiguate with the "name" concept.]

The description of the name-badge is "It says 'Rick' at the top.  The bottom says 'Apollo Systems Technician, Launch Enablement Yroup.'  ... Huh.  Must be a typo."

After examining the name-badge, now the engineer is known.

Rule for writing a paragraph about the engineer:
	if the engineer is unknown, say "An engineer is standing around[if the coffee-pot is in the location] by the [interesting]coffee pot[/interesting][end if], [if the engineer is sad]crying.[otherwise]doing nothing.";
	otherwise say "Rick is still here, still [if the engineer is sad]crying.[otherwise]doing nothing.";

Instead of talking to the engineer:
	say "Perhaps you could ask [the noun] about the weather, the command module blueprints, or himself."

Instead of quizzing the engineer about name:
	say "The engineer taps his [interesting]name badge[/interesting] and says, 'Can't you read?'"

Instead of quizzing the engineer about the weather:
	say "[The noun] glances up at the ceiling for a moment before replying, 'Maybe a bit cloudy, but we should still be clear for launch.  Besides, we're never gonna give this up.'"

Instead of quizzing the engineer about the engineer:
	say "[The noun] looks a bit embarrassed by the question, maybe even flattered.  He looks at his feet for a moment before replying, 'Well...  We're no strangers to love.'  Then he raises his eyes and gives you a look that makes you... distinctly uncomfortable."

Instead of quizzing the engineer about the blueprints:
	say "[The noun] looks both smug and offended at once.  '[bold type]ACTUALLY[roman type], they aren't blue at all!  The cyanotype [italic type]blueprint[roman type] began to be supplanted by [italic type]diazo prints[roman type], also known as [italic type][interesting]whiteprints[/interesting][roman type].'";
	now the printed name of get-blueprints is "Get command module whiteprints".

[Give this concept a location, so we can have rules about "taking" it.]
The whiteprints is a concept in the engineering department.
Instead of quizzing the engineer about the whiteprints:
	say "[The noun] rolls his eyes.  'Ha!  Nobody calls them whiteprints.' His laughter quickly devolves into snorts.  Wiping his eyes, he adds, 'It's okay.  Go ahead and take them if you need them so badly.'";
	now the blueprints are discussed;
	now the printed name of get-blueprints is "Get command module drawings formerly known as blueprints".

[If the player tries "take whiteprints", it should behave the same as above, when asking about "whiteprints".]
Instead of taking the whiteprints:
	try quizzing the engineer about the whiteprints.

Instead of taking the blueprints:
	if the blueprints are discussed:
		say "[The engineer] says, 'Here you go.'  He hands you a large roll of white paper which is not even slightly blue.  You cram the 3-foot roll of paper into your pocket, taking no care whatsoever to keep it neat or undamaged.  [The engineer] appears to be crying.";
		now the engineer is sad;
		now get-blueprints is checked;
		now the player has the blueprints;
	otherwise:
		say "Taken aback, [the engineer] says, 'Hold on, there!  You don't know the first thing about these.'"

Persuasion rule for asking the engineer to try giving the blueprints to the player:
	persuasion succeeds.

Instead of the engineer giving the blueprints to the player:
	try taking the blueprints;
	rule succeeds.

Instead of quizzing the engineer about NASA:
	say "The engineer beams, 'I am [bold type]so[roman type] proud to serve my country in the National Aeronautics and Space... um... anyway, I design rockets.  NASA rockets.  Big, blasting, noisy hard rockets!  It's the best.'"

Instead of quizzing the engineer about rocket:
	try quizzing the engineer about NASA.

Instead of quizzing the engineer about the command module:
	say "[The noun] chuckles and grins broadly.  '[bold type]That[roman type] is my pride and joy!  Officially, it's the 'Command and Service Module', or 'CSM', a truncated cone, 10 feet and 7 inches tall (which is about 1.814285 Buzz Aldrins tall), and 12 feet 10 inches across the base (which is about 0.8675309 Florida gators).  Really, it's one of the top... 30 truncated cones in engineering, at least!'"

Instead of quizzing the engineer about Apollo:
	say "[The noun] shudders and says, 'Gotta get this one right. How was I supposed to know that the sulphurous smell of the rocket fuel would cause the astronauts to vomit nonstop for the whole flight?  Commander Stafford needed three liters of fluids when he got back.  He still hasn't forgiven me.  Said they never could get the smell out of his favorite spacesuit.' [The noun] hangs his head, but then brightens and says, 'Apollo 11[']s gonna be different!'"

Instead of talking to the engineer while the engineer is sad:
	say "He doesn't look like he wants to talk, though he might be convinced to sing."

Asking it to sing is an action applying to one thing.
Understand "ask [someone] to sing" and "convince [someone] to sing" as asking it to sing.

Check asking it to sing:
	say "[The noun] [one of]looks at you like you're crazy[or]looks flattered, but politely declines[or]presents you with a contract containing a long list of specific candies that must be present in [their] dressing room[purely at random]."

Instead of asking the engineer to sing:
	say "'No!' [the noun] says.  'Why would you even ask me that?'"

Instead of quizzing the engineer about anything while the engineer is sad:
	say "He is too busy weeping."



The propulsion lab is north of the hallway.  "The propulsion lab is as large as a warehouse, and your footsteps echo throughout the space.  The skeleton of a moon buggy looms at one end, and on the other, someone is welding.  Along one wall are a series of wheeled [interesting]chalkboards[/interesting].  In the corner, there's [if the tapir is in the cage]a metal [interesting]cage[/interesting] with what appears to be a [interesting][tapir-aardvark][/interesting].[otherwise]an empty metal [interesting]cage[/interesting].[end if]  You can smell sparks and animal waste."
The printed name of the propulsion lab is "NASA Propulsion Lab".


The moon buggy skeleton is scenery in the propulsion lab.  The description of the moon buggy skeleton is "It looks like every other moon buggy skeleton you've ever seen."


The chalkboard is in the propulsion lab.  The description of the chalkboard is "A large, slate black, wheeled chalkboard covered in inscrutable [interesting]equations[/interesting]."
The chalkboard is undescribed.  [Mentioned in the scenery, but not in the room.]
The chalkboard is pushable between rooms.
Understand "chalk board" and "board" as the chalkboard.

Equations and rocket-equations are parts of the chalkboard.
[To allow them to be examined while you're in any room with the chalkboard.]
Instead of examining equations:
	say "You can't make heads or tails of them, but the [interesting]wheeled chalkboards[/interesting] are covered in them.";
Instead of examining rocket-equations:
	try examining equations.

Instead of taking the chalkboard:
	if the player has alien-equations:
		say "You have the paper that [tapir] gave you, so you don't think you'll need the chalkboards any more.";
	otherwise if the location is the propulsion lab:
		say "You hurriedly start pushing one of the wheeled [interesting]chalkboards[/interesting] out of the room.  [The head scientist] screams after you, '[bold type]SCHWEINHUND!  [italic type]HALT!!![roman type]'[line break]";
		now the head scientist is enraged;
		now the chalkboard is described;  [It will show up in room descriptions again.]
		now the chalkboard is critical;  [You can't leave it behind; see below]
		now get-equations is checked;  [Woohoo!]
		if the tapir is in the hallway:
			now the tapir is in purgatory;  [Never to be seen again.]
		now the chalkboard is in the hallway;
		try going south;
	otherwise:
		say "You've already brought that with you into the room, and there's no way it would fit in your pockets."

Instead of going to anywhere (called the destination):
	if the chalkboard is critical:
		say "([one of]You push the massive [chalkboard] along with you[or]As you drag the [chalkboard] over the threshold into [the destination], one of the wheels catches on the door jam and the giant board falls to the ground.  It takes you a minute or two to get it upright again[or]You drag the [chalkboard] along, and hope like hell that it turns out to be worth the effort[purely at random].)[line break]";
		now the chalkboard is in the destination;
	continue the action.

Every turn when a random chance of 1 in 10 succeeds and the player is in the propulsion lab and the chalkboard is not critical:
	say "[The head scientist] grumbles under his breath and erases half of the equations on one of the [interesting]mobile, wheeled chalkboards[/interesting], then starts furiously scribbling new ones."

Every turn when the remainder after dividing the turn count by 5 is 0 and the player is in the propulsion lab and the chalkboard is not critical:
	show hint "Look around the room for something you need for your checklist."



The cage is scenery in the propulsion lab.
The cage is an openable, transparent, lockable, locked container in the propulsion lab.
The brass key unlocks the cage.  The head scientist carries the brass key.
The brass key can be noticed or unnoticed.  When day one begins, now the brass key is unnoticed.
The description of the cage is "It's a wide cage made of thick metal bars, with a locking mechanism built into the door.[if the tapir is in the cage]  [interesting]The [tapir-aardvark][/interesting] inside looks distressed.[end if]".

The locking mechanism is scenery in the propulsion lab.
Understand "lock" as the locking mechanism.

The welder is scenery in the propulsion lab.  "You try to watch them working, but you don't have one of those protective helmets, so you quickly think better of it."

The waste is scenery in the propulsion lab.  "Eww."  Understand "animal waste" as the waste.

[This will say tapir or aardvark, but never Brizzleby.]
To say tapir-aardvark:
	if the tapir is known:
		say "aardvark";
	otherwise:
		say "tapir".

After examining the head scientist:
	now the brass key is noticed;
	continue the action.

Understand "steal [something]" as taking.
Understand "steal [something] from [someone]" as removing it from.
Instead of removing the brass key from the scientist:
	try taking the brass key.
The brass key has a number called steal-attempts.  [Third time's the charm.  Let's not be too mean.]
Instead of taking the brass key:
	if the brass key is unnoticed:
		say "You can't see any such thing.";
		show hint "The key must be here somewhere... Try examining things in the room.";
	otherwise if the head scientist does not have the brass key:
		continue the action;
	otherwise if the head scientist is enraged:
		say "You try to sneak over and reach into [the head scientist]'s coat pocket, but at your first step, his head snaps around and he stares you down until you take a step back again.";
	otherwise if a random chance of 5 in 10 succeeds or the steal-attempts of the brass key is 2:
		say "You sneak up on [the head scientist] carefully, and reach into his coat pocket.  You manage to lift the brass key out of his pocket without him noticing!";
		now the player has the brass key;
	otherwise:
		say "You sneak up on [the head scientist] carefully, and reach into his coat pocket.  You fumble the key, and he whips around at the clanging sound.  There is a brief moment of shock upon his face, but it rapidly dissolves into rage as he screams '[bold type]SCHWEINHUND![roman type]' and chases you from the room.";
		increase the steal-attempts of the brass key by 1;
		now the head scientist is enraged;
		now the player is in the hallway.

After opening the cage while the tapir is in the cage:
	if the tapir is not revealed:
		if a random chance of 1 in 10 succeeds:
			say "As soon as the cage door opens, the [tapir] darts through, trampling you to death in the process.  You are buried with full honors in the 'bizarre animal tragedies' section of Arlington National Cemetery.  Your tombstone reads, 'Intern.'";
			show ending 5;
		otherwise:
			say "As soon as the cage door opens, the [tapir] darts through and out into the hallway.  You narrowly avoid being trampled by the thing.[paragraph break]";
			say "Noticing the commotion, [the head scientist] turns around and becomes apoplectic at what has happened.  '[bold type]MEIN ERDFERKEL!  What have you done?![roman type]'";
			now the head scientist is enraged;
			now the tapir is in purgatory;  [never to be seen again]
	otherwise:
		say "As you open the door, the [tapir-aardvark] gives you a wink and quietly slips out of the room.";
		if get-equations is checked:
			now the tapir is in purgatory;  [You didn't need him.]
		otherwise:
			now the tapir is in the hallway;  [There's an alternate way to get the equations.]



The tapir is a stranger [animals are people, too, in Inform] in the cage.
The description of the tapir is "[The tapir] is a bit larger than your average [tapir-aardvark], with intelligent eyes, rabbit-like ears, strong front claws, and a flat, round nose that protrudes from its head.  [if the tapir is in the cage]It lays sadly on the bottom of [the cage], looking distinctly sad and uncomfortable.[otherwise]It stands upright on its rear legs, thought it doesn't look like it has much practice.[end if]".

The real name of the tapir is "aardvark".
Understand "aardvark", "aardvarks", "ardvark", "ardvarks", and "animal" as the tapir.

Every turn when a random chance of 3 in 10 succeeds and the player is in the propulsion lab and the tapir is in the cage:
	say "[one of]The [tapir-aardvark] makes a snuffling sound.[or]A long, sad groan comes from [the cage].[or]Something in here smells distinctly like a [tapir-aardvark] fart.  (You definitely know what those are like.)[purely at random]".



[You can talk _to_ the tapir without opening the cage first.]
Rule for reaching inside the cage while talking to:
	rule succeeds.
Rule for reaching inside the cage while quizzing:
	rule succeeds.
[You can talk _about_ the tapir without opening the cage first.]
Rule for reaching inside the cage while quizzing generally:
	rule succeeds.

[If there isn't a topic for this with a specific person, that person will not know about the tapir.]
Instead of quizzing someone about the tapir:
	say "[The noun] looks confused.  'Who?'";

Instead of talking to the tapir:
	say "The [tapir-aardvark] says in a low whisper: 'Hey, kid!  You gotta get me out of here.'"

Instead of quizzing the tapir about anything while the tapir is in the cage:
	say "The [tapir-aardvark] shakes his head rapidly from side to side, and whispers, 'Not here!  It's not safe to talk around the others.  Get me out, and I'll tell you everything!'"

The tapir can be revealed.  When day one begins, now the tapir is not revealed.
Instead of quizzing the tapir about name while the tapir is in the cage:
	say "The [tapir-aardvark] glances side to side to make sure the scientists are distracted before hissing in a low voice, 'Brizzleby, of the Galactic Federation of Aardvarks.  Now get me the hell out of here!'";
	now the real name of the tapir is "Brizzleby";
	now the tapir is revealed;
	now the tapir is known.
Understand "Brizzleby", "space-aardvark", "space-ardvark", and "Brizzleby the space-aardvark" as the tapir.

Instead of quizzing the tapir about name:
	say "'Brizzleby, of the Galactic Federation of Aardvarks, at your service.'";
	now the real name of the tapir is "Brizzleby";
	now the tapir is revealed;
	now the tapir is known.

After printing the name of the tapir while the tapir is revealed:
	say " (the space-aardvark)".

Instead of quizzing the tapir about the tapir:
	try quizzing the tapir about name.

Instead of quizzing the tapir about equations:
	try quizzing the tapir about rocket-equations.

Alien-equations is a critical thing.
The description of alien-equations is "A small slip of paper written in an alien language, or possibly in English as written by the hand of an aardvark.  You have been told that these are extremely advanced rocket equations."
Understand "alien equations" as alien-equations.  [If I give the object its natural name instead of using "understand", then "equations" results in a disambiguation prompt between "equations" and "alien equations", which is confusing.]
The printed name of alien-equations is "alien equations".
Understand "paper" as alien-equations.


Instead of quizzing the tapir about rocket-equations:
	say "Brizzleby gives you a satisfied smile.  'I knew you were something special.  Yes, [']rocket equations['] are indeed a thing.  Here.  Take these.  They are the Galactic Federation's most advanced rocket equations.'  He hands you a small slip of paper written in an alien language, or possibly in English as written by the hand of an aardvark.[paragraph break]";
	now the player has alien-equations;
	now get-equations is checked;
	say "He glances at the ceiling for a long moment, then adds, 'It's time for me to get back to my people.  Thank you, noble intern, for freeing me.'  Before you can react, he licks your face, then quickly lopes down the hallway and vanishes from sight.";
	now the tapir is in purgatory.

Instead of quizzing the tapir about NASA:
	try quizzing the tapir about Apollo.

Instead of quizzing the tapir about the head scientist:
	say "The space-aardvark shudders.  'That man... he's a menace to aardvark-kind.  Let's not talk about it.'"

Instead of quizzing the tapir about Apollo:
	say "'Bah', he begins.  'The Apollo program is a joke.  It'll never get off the ground.  You monkeys have no idea what you're doing.'"



In the propulsion lab is a stranger called the head scientist.
The real name of the head scientist is "Dr. von Braun".
The head scientist is male.

[This guy has way too many names.  Give players a fair amount of latitude.]
Understand "doctor", "dr", "dr von braun", "von braun", "braun", "doktor", "herr doktor", "Herr Doktor Wernher Magnus Maximilian Freiherr von Braun", "Wernher", "Magnus", "Maximilian", "Freiherr", "Wernher von Braun", "Werner", "Werner von Braun", "head", "the scientist", "head scientist", "rocket scientist", "him", "man", and "himself" as the head scientist.

The head scientist can be enraged.

Rule for writing a paragraph about the head scientist:
	if the head scientist is enraged:
		say "[The head scientist] huffs about the room, scribbling on [interesting]chalkboards[/interesting], sparing you only the occasional angry glance.";
	otherwise:
		say "[The head scientist] moves smoothly through the room from one [interesting]chalkboard[/interesting] to another, making minor changes to complex [interesting]equations[/interesting].  He does not seem to notice you."

The description of the head scientist is "[The noun] is a man of average height, his hair graying at the sides, wearing a white lab coat over a dark gray suit and tie.[if the head scientist is enraged]  His anger toward [italic type]you specifically[roman type] is practically a physical presence of its own, hanging about his temples like a fog."

The head scientist wears a white lab coat, a dark gray suit, and a tie.
The anger is scenery in the propulsion lab.
Instead of taking the anger:
	say "Anger is a weapon only to one's opponent."



Instead of talking to the head scientist:
	if the head scientist is enraged:
		say "You open your mouth to speak to [the noun], but he shoots you a rageful glare of such silent violence that you think better of it and shut your mouth again.";
	otherwise:
		say "Perhaps you could ask [the noun] about the equations, his work, the [tapir-aardvark], or himself."

Instead of quizzing the head scientist about name:
	say "He stops what is doing and considers you as if noticing you for the first time.  'Herr Doktor Wernher Magnus Maximilian Freiherr von Braun, chief scientist of the NASA propulsion lab.'  Then, without making it a true question and without any apparent interest in the answer, adds, 'How do you do.'";
	now the head scientist is known.

Instead of quizzing the head scientist about the head scientist:
	try quizzing the head scientist about name.

Before quizzing the head scientist about the tapir:
	if the player's command includes "Brizzleby":  [This name is secret.]
		say "[The noun] looks confused.  'Who?'";
		stop the action;
	otherwise if the head scientist is enraged:
		say "He looks relieved at this topic.  [run paragraph on]";
		now the head scientist is not enraged.  [He loves that thing.]

Instead of quizzing the head scientist about the tapir:
	if the player's command includes "Brizzleby":  [This name is secret.]
		say "The scientists don't seem to know who that is.";
	otherwise if the tapir is not in the cage:
		say "He looks profoundly upset at the question.  'Ruined.  Everything is ruined now.  My life's work...'";
	otherwise if the player's command includes "tapir":
		say "'Ist no tapir', replies [the head scientist] cooly.  'Ist an [interesting]aardvark[/interesting], obviously.  What else would you find here at the National Agency of Space Aardvarks?'";
		now the tapir is known;
	otherwise:
		say "[The head scientist] looks at you quizzically.  'What else would you find here at the National Agency of Space Aardvarks?'";

Instead of quizzing the head scientist about NASA:
	if the tapir is not in the cage:
		say "He looks profoundly upset at the question.  'Ruined.  Everything is ruined now.  My life's work...'";
	otherwise:
		say "He considers thoughtfully before replying, 'It's a job.  But at least here at the National Agency of Space Aardvarks, I work to bring about true emancipation of the [interesting]aardvarks[/interesting] by returning them to their home in outer space.'  He looks up at the ceiling of the lab for a long moment.  You look up as well, but see nothing other than a white painted lab ceiling, about 40 feet high."

Instead of quizzing the head scientist about rocket:
	say "'Well,' he begins, looking quietly pleased with himself, 'My rockets are simply the best.  As you can plainly see, even enemies of the Reich were forced to acknowledge the greatness of my work.'  He turns to consider the [interesting]chalkboards[/interesting] behind him and adds dreamily, 'I have spent years perfecting this new one...'"

Instead of quizzing the head scientist about work:
	try quizzing the head scientist about rocket.

Instead of quizzing the head scientist about equations:
	say "'What about them?' he snaps.  'I'm very busy.'  [The noun] turns back to the [interesting]chalkboards[/interesting]."

Instead of quizzing the head scientist about rocket-equations:
	say "He turns to you very suddenly.  '[italic type]Rocket equations?[roman type]  You sound ridiculous!  What buffoon would say such a thing?  [bold type]Stop wasting my time![roman type]'[line break]";
	now the head scientist is enraged.

Instead of quizzing the head scientist about Apollo:
	if the tapir is not in the cage:
		say "He looks profoundly upset at the question.  'Ruined.  Everything is ruined now.  My life's work...'";
	otherwise:
		say "Apollo ist my greatest work.  Finally I achieve my greatest glory in my career and achieve the highest aims of NASA, the National Agency of Space Aardvarks: to deliver the [interesting]aardvark[/interesting] back into space.  Apollo 11 will deliver the [interesting]aardvarks[/interesting] to their true home.";

Instead of quizzing the head scientist about anything while the head scientist is enraged:
	say "[The noun] throws an eraser at you and screams [bold type]'GET OUT!'[roman type][line break]";

Instead of saying sorry while the player is in the propulsion lab and the head scientist is enraged:
	say "[The head scientist] stares at you angrily for the space of a breath, then rips off one shoe and chases you out of the room with it.[paragraph break]";
	if a random chance of 9 in 10 succeeds:
		say "You barely escape un-swatted.[line break]";
		now the player is in the hallway;
	otherwise:
		say "Just before you reach the doorway to the hall, [the head scientist] manages to clock you on the side of the head with his shoe.  You suffer a freak hemorrhage and die on the spot.  You are the first NASA employee in the agency's (administration's?) history to die in such a pointless and embarrassing way.  Apollo 11 fails miserably, NASA becomes a worldwide laughing-stock, and Russia conquers the globe by 1972.  Your tombstone in Arlington National Cemetery reads 'Intern.'";
		show ending 3;



In the propulsion lab is a person called the other scientists.
The other scientists are plural-named.
Understand "others", and "them" as the other scientists.
The description of the other scientists is "They scurry around busily in white lab coats, occasionally looking back at [the head scientist] to see if he is noticing their industriousness.  (He is most certainly not.)"

The other scientists wear white lab coats.

[NOTE: Something really odd is happening, and the only people who understand Inform in enough detail to debug this are Graham Nelson and gray aliens.  For whatever reason, "other scientists", which is the _EXACT NAME_ of the character, resolves to "the head scientist", which is _MADDENING_.  This is a hacky workaround, in which we just edit the user's commands as they come in and replace the thing that _should_ work with an explicit alias that _does_ work.]
After reading a command:
	let N be "[the player's command]";
	replace the regular expression "\bother scientists?\b" in N with "the others";
	change the text of the player's command to N.

Instead of quizzing the other scientists about the head scientist:
	say "The other scientists glance warily in the direction of [the head scientist], who [if the head scientist is enraged]glares at them with fire in his eyes[otherwise]looks back with calm surety[end if].  In unison, the scientists chant, 'Dr. von Braun is the best boss a scientist could ask for.  His work in the field is unparalleled, and we are lucky to be in his lab.'  [The head scientist] looks pleased about this, and turns back to his work at the [interesting]chalkboards[/interesting].";
	now the head scientist is known;
	now the head scientist is not enraged;

Instead of quizzing the other scientists about the tapir:
	if the player's command includes "Brizzleby":
		say "The scientists don't seem to know who that is.";
	otherwise:
		say "The scientists throw each other sideways glances, then look to see if [the head scientist] is watching.  Then one of them says under her breath, '[if the tapir is not known]It's an [interesting]aardvark[/interesting], actually.  [end if]He's obsessed.  Nobody around here gets it.  He raves about the [interesting]aardvarks[/interesting] all the time, ever since the war.  Director Furtwangler only convinced him to come work here by telling him we were the National Agency of Space Aardvarks.'  She grimaces and gives [the head scientist] a look that is both mystified and compassionate.";
		now the tapir is known.

Instead of quizzing the other scientists about anything:
	try talking to the other scientists.

Instead of talking to the other scientists:
	say "They all look incredibly busy and smart in those white lab coats.  You can't seem to get their attention."



Purgatory is a room.  [It is inaccessible, but we need the astronauts to be in some room initially.  Not giving them an initial location causes the rules for "choosing crew" to fail with a built-in message about them being "unavailable".  Putting them in literally any room fixes this.  We don't want the player to meet them yet, so they begin here.]

An astronaut is a kind of person.  [They don't have special properties, but they are unique for the game.  Other kinds of people are ineligible for the mission.]

Buzz Aldrin is a male astronaut in purgatory.
Neil Armstrong is a male astronaut in purgatory.
Michael Collins is a male astronaut in purgatory.
Lisa Nowak is a female astronaut in purgatory.
Ijon Tichy is a male astronaut in purgatory.
Clifford McBride is a male astronaut in purgatory.

[Unless someone has a specific response for a specific astronaut, treat questions about individuals as questions about the crew in general.]
Instead of quizzing someone (called the interrogated) about Buzz Aldrin:
	try quizzing the interrogated about crew.
Instead of quizzing someone (called the interrogated) about Neil Armstrong:
	try quizzing the interrogated about crew.
Instead of quizzing someone (called the interrogated) about Michael Collins:
	try quizzing the interrogated about crew.
Instead of quizzing someone (called the interrogated) about Lisa Nowak:
	try quizzing the interrogated about crew.
Instead of quizzing someone (called the interrogated) about Ijon Tichy:
	try quizzing the interrogated about crew.
Instead of quizzing someone (called the interrogated) about Clifford McBride:
	try quizzing the interrogated about crew.



The personnel department is south of the hallway.  "This tiny room feels like the sort of place careers go to die.  [The head of personnel] [if the head of personnel is asleep]is reclined behind a cheap [interesting]desk[/interesting], snoring softly with his feet up[otherwise]is staring at you impatiently from behind the [interesting]desk[/interesting], waiting for you to state your business.  He does not look pleased[end if].  To the left of the [interesting]desk[/interesting] is a tan, metallic [interesting]filing cabinet[/interesting]."
The printed name of the personnel department is "NASA Personnel Department".

The cheap desk is scenery in the personnel department.  The description of the cheap desk is "You have never seen less thought or money put into furniture before.  The desk has four legs and a surface, but everything else about it looks like an accident."
The cheap desk is an enterable supporter.

The metallic filing cabinet is scenery in the personnel department.  The description of the metallic filing cabinet is "The filing cabinet is short, tan-colored and metallic, with one [interesting]drawer[/interesting] in it, which is labeled 'Crew Candidate Personnel Files'.  The cabinet looks like the only thing in this room that NASA cares about."
The metallic filing cabinet is an enterable supporter.

An openable closed container called the drawer is part of the metallic filing cabinet.  "The drawer is labeled 'Crew Candidate Personnel Files'."
[We don't get told automatically what is inside an open container if it's part of another thing.  Fix this for the open drawer.]
Before listing exits:
	if the player is in the personnel department:
		if the drawer is open:
			say "In the open cabinet drawer, you can see [list of things in the drawer].[paragraph break]";
	continue the action.

[This mapping will allow us to enable the player to type both "choose Buzz Aldrin" and "choose file 1".]
A personnel-file is a kind of thing.  A personnel-file has a person called the employee.
personnel file 1 is a critical personnel-file in the drawer.
personnel file 2 is a critical personnel-file in the drawer.
personnel file 3 is a critical personnel-file in the drawer.
personnel file 4 is a critical personnel-file in the drawer.
personnel file 5 is a critical personnel-file in the drawer.
personnel file 6 is a critical personnel-file in the drawer.

The personnel puzzle is a concept.  The personnel puzzle can be ready.  When day one begins, now the personnel puzzle is not ready.

The head of personnel is a stranger in the personnel department.
The real name of the head of personnel is "Franklin".
The head of personnel is male.

Understand "head", "Franklin", "Franklin Stanford", "Stanford", "him", "man", and "himself" as the head of personnel.

When day one begins, now the head of personnel is asleep.  [Aren't we all?]

The description of the head of personnel is "[The noun] is a short, balding man wearing black eyeglasses, a short-sleeved shirt, and a plain tie.  He is [if the head of personnel is asleep]snoring softly with his feet up, occasionally twitching in his chair[otherwise]staring at you impatiently.  He must not enjoy having his nap interrupted[end if]."

The head of personnel wears black eyeglasses, a short-sleeved shirt, and a plain tie.




Instead of waking the head of personnel:
	if the head of personnel is asleep:
		say "You say 'Excuse me,' and [the head of personnel] snorts and snaps awake, practically falling out of his chair.  'Wha?!' he exclaims, then adds testily, 'What is it?  What do you want?'";
	continue the action.

Instead of talking to the head of personnel:
	if the head of personnel is asleep:
		try waking the head of personnel;
	otherwise if the personnel puzzle is ready:
		say "Perhaps you could ask [the noun] about the crew candidates, various employees, or himself.";
	otherwise:
		say "Perhaps you could ask [the noun] about the crew candidates, the personnel files, or himself."

Instead of quizzing the head of personnel about name:
	say "'Franklin, Franklin Stanford.  What the hell do you want?  Spit it out.'";
	now the head of personnel is known.

Instead of quizzing the head of personnel about the head of personnel:
	try quizzing the head of personnel about name.

[NOTE: Unlike other concepts, this one must be in a room, since we can use it with "take".  And since we have a rule for "drop", which needs to work no matter where you go, let's make the files "everywhere".]
The personnel files is a concept.  The personnel files are everywhere.
Understand "files" as the personnel files.

Instead of quizzing the head of personnel about anything while the head of personnel is asleep:
	try waking the head of personnel.

[TODO: talk to Franklin about NASA
Instead of quizzing the head of personnel about NASA:
	say "";
]

[TODO: talk to Franklin about Apollo
Instead of quizzing the head of personnel about Apollo:
	say "";
]


Instead of quizzing the head of personnel about the secretary:
	say "'Oh, Donna?  She's the real brains of this operation.  Furtwangler couldn't get a damn thing done without her.'";
	now the secretary is known.

Instead of quizzing the head of personnel about the director:
	say "'Furtwangler... more like SkirtTangler!' he exclaims, looking at you to see if you're laughing. 'He's more interested in Earth women than extraterrestrial glory.  Word around the Tang cooler is that he's in trouble with the Missus on account of the Miss, if you know what I mean.'";
	now the director is known.

Instead of quizzing the head of personnel about the engineer:
	say "'Now that's a guy who's never gonna tell a lie and hurt you.'  When Franklin notices your confusion, he goes on, 'Well, he certainly never let [bold type]me[roman type] down.'";

Instead of quizzing the head of personnel about the head scientist:
	say "'Von Braun is a genius, and as you may know, 100% bazonkers.  He actually thinks that some anteaters are aliens.  Sure knows his way around a rocket, though.'";
	now the head scientist is known.

Instead of quizzing the head of personnel about the other scientists:
	say "'I call those empty headed lackeys [']The Chorus.[']  All they do is say [']Yes, Herr Doktor von Braun, whatever you say, sir!['] no matter what insanity he cooks up.  Sure, sometimes it's rocket equations and fuel formulations, but sometimes, it's combing through the genetic code of an anteater or whatever bizarro animal he's obsessed with.  They just smile and say [']Yes, Herr Doktor Frankenpants, whatever you say, sir![']  What a bunch of ninnies.'";

Instead of quizzing the head of personnel about Buzz Aldrin:
	say "'Don't get close enough to that guy to smell his breath, or you [italic type]will[roman type] regret it.'";

Instead of quizzing the head of personnel about Neil Armstrong:
	say "'Fun fact: his arms are notoriously weak.  Once, I saw him struggle to lift a can of Coke.'";

Instead of quizzing the head of personnel about Michael Collins:
	say "";

Instead of quizzing the head of personnel about Lisa Nowak:
	say "";

Instead of quizzing the head of personnel about Ijon Tichy:
	say "";

Instead of quizzing the head of personnel about Clifford McBride:
	say "";

Instead of saying sorry while the player is in the personnel department and the head of personnel is not asleep:
	say "[The head of personnel] grunts and pointedly props his feet back up on his desk.  Within a moment, he is snoring again.";
	now the head of personnel is asleep;

Instead of quizzing the head of personnel about the crew:
	if the personnel puzzle is not ready:
		say "[The noun] snorts.  'A bunch of prima donnas, every one of [']em.  You can have your pick.'  He reaches into the [interesting]filing cabinet[/interesting] and produces a set of six [interesting]files[/interesting] for you.  'Here you go,' he says, handing you the files.  'Anything else?'";
	otherwise:
		say "[The noun] snorts.  'A bunch of prima donnas, every one of [']em.  You can have your pick.  Just read the [interesting]files[/interesting].  Anything else?'";
	if the personnel puzzle is not ready:
		now the player has personnel file 6;
		now the player has personnel file 5;
		now the player has personnel file 4;
		now the player has personnel file 3;
		now the player has personnel file 2;
		now the player has personnel file 1;
		now the personnel puzzle is ready;

Instead of quizzing the head of personnel about the personnel files:
	if the personnel puzzle is not ready:
		say "[The noun] impatiently hooks a thumb at the [interesting]filing cabinet[/interesting].  'In there.  Go nuts.'  He starts drumming his fingers on his desk.  'Anything else?'";
	otherwise:
		say "'You've already got [']em!  Now get lost.'";

Instead of examining the personnel files:
	if the personnel puzzle is ready:
		say "Try examining a particular file instead.";
	otherwise if the player is not in the personnel department:
		say "You can't see any such thing.";
	otherwise:
		if the drawer is not open:
			try opening the drawer;
		say "Try examining a particular file instead.";

Instead of taking the personnel files:
	if the personnel puzzle is ready:
		say "You already have the personnel files.";
	otherwise if the player is not in the personnel department:
		say "You can't see any such thing.";
	otherwise:
		if the drawer is not open:
			try opening the drawer;
		now the player has personnel file 6;
		now the player has personnel file 5;
		now the player has personnel file 4;
		now the player has personnel file 3;
		now the player has personnel file 2;
		now the player has personnel file 1;
		say "You collect all the files from the drawer.";
		now the personnel puzzle is ready;

Instead of dropping the personnel files:
	say "You're going to need those."

Instead of opening the cabinet:
	try opening the drawer.

Instead of closing the cabinet:
	try closing the drawer.

Instead of opening the drawer:
	if the head of personnel is asleep:
		say "You pull open the drawer carefully, but the drawer gets stuck briefly in the track and makes a loud [italic type]CLANG[roman type] sound.  [The head of personnel] snorts and snaps awake, practically falling out of his chair.  'Wha?!' he exclaims.  'What do you think you're doing?'";
		now the head of personnel is not asleep;
	continue the action.

After going from the personnel department:
	now the head of personnel is asleep;
	continue the action.



The employee of personnel file 1 is Buzz Aldrin.
The description of personnel file 1 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: ALDRIN, EDWIN E. JR. ('BUZZ')[roman type]

Professional History:
[line break]   * Graduated 3rd in class, West Point, 1951, BS in mechanical engineering
[line break]   * US Air Force, 1952-
[line break]   * Korean War, 1952-53
[line break]   * Graduated MIT, 1963, Sc.D in Astronautics
[line break]   * NASA Gemini program, 1963-1966

Psychological profile:
[line break]   * Suffers from mood disorders, including space madness
[line break]   * Nicknamed 'Buzz' because of his propensity to eat carrion
[line break][end style][variable letter spacing]".


The employee of personnel file 2 is Neil Armstrong.
The description of personnel file 2 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: ARMSTRONG, NEIL ALDEN[roman type]

Professional History:
[line break]   * Graduated Purdue University, 1955, BS in Aeronautical Engineering
[line break]   * US Navy, 1949-1952
[line break]   * Korean War, 1951-1952
[line break]   * US Navy Reserve, 1952-1960
[line break]   * Test pilot, National Advisory Committee on Aeronautics, 1955-1958
[line break]   * Test pilot, NASA, 1958-1962
[line break]   * NASA Gemini program, 1965-1966

Psychological profile:
[line break]   * Humble about work, avoids publicity
[line break]   * Scottish heritage and sense of honor requires him to headbutt descendents of rival clans
[line break]   * Refuses to wear socks inside his spacesuit
[line break][end style][variable letter spacing]".


The employee of personnel file 3 is Michael Collins.
The description of personnel file 3 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: COLLINS, MICHAEL[roman type]

Professional History:
[line break]   * Joined the Irish Republican Brotherhood at age 19
[line break]   * Aide-de-camp, rebel headquarters, Easter Rising
[line break]   * Chairman of the Provisional Government, Irish Free State
[line break]   * Commander-in-Chief of the National Army, Irish Free State

Psychological profile:
[line break]   * Abrasive, fiercely proud
[line break]   * Does not consult with others on decisions
[line break]   * Has not attended official NASA meetings since his assassination in August 1922
[line break][end style][variable letter spacing]".


The employee of personnel file 4 is Lisa Nowak.
The description of personnel file 4 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: NOWAK, LISA MARIE[roman type]

Professional History:
[line break]   * Graduated US Naval Academy, Annapolis, BS in aerospace engineering
[line break]   * Served in US Navy Electronic Warfare Aggressor Squadron
[line break]   * US Naval Postgraduate School, Monterey, MS in aeronautical engineering

Psychological profile:
[line break]   * Enjoys long road trips
[line break]   * Refuses to use rest stops
[line break]   * Loves to plan elaborate surprises

[line break][end style][variable letter spacing]".


The employee of personnel file 5 is Ijon Tichy.
The description of personnel file 5 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: TICHY, IJON[roman type]

Professional History:
[line break]   * Experienced space pilot
[line break]   * Experienced diplomat
[line break]   * Took part in the Eighth World Futurological Congress in Costa Rica

Psychological profile:
[line break]   * Eager to explore
[line break]   * Generally amiable
[line break]   * Accident-prone
[line break]   * Lives in a messy, three-bedroom rocket

[line break][end style][variable letter spacing]".


The employee of personnel file 6 is Clifford McBride.
The description of personnel file 6 is "[fixed letter spacing][personnel-file-card style][bold type]NASA PERSONNEL FILE: MCBRIDE, H. CLIFFORD[roman type]

Professional History:
[line break]   * Undergrad degree from Purdue
[line break]   * Doctorate from MIT
[line break]   * Graduated US Air Force Academy
[line break]   * Experienced astronaut
[line break]   * Commander, NASA Lima program

Psychological profile:
[line break]   * Brilliant, obsessive, extremely driven
[line break]   * Willing to make sacrifices
[line break]   * Enjoys dehydrated food

[line break][end style][variable letter spacing]".



Choosing for crew is an action applying to one thing.  Understand "choose [anyone]" as choosing for crew.
[NOTE: "anyone" should match people who are not present.  But we still need this rule to allow it:]
Rule for reaching inside a room while choosing for crew:
	allow access.  ["Reaching inside a room" means that person is in literally any other room.]

Check choosing for crew:
	if day one has ended:
		say "It's much too late for that now.";
	otherwise if the personnel puzzle is not ready:
		say "You aren't ready to choose the crew.";
		show hint "You will need to have the personnel files for that.";
	otherwise if the noun is not an astronaut:
		say "[The noun] is not eligible for this mission.  Try choosing from the personnel files.";
	otherwise if the noun is listed in the sub-items of choose-crew:
		say "You've already selected [the noun] for the crew of Apollo 11.  Try choosing another astronaut from the personnel [interesting]files[/interesting].";
	otherwise if TBD is not listed in the sub-items of choose-crew:  [if the list is full, that is]
		say "It's too late!  You've already finished selecting the crew of Apollo 11.  Look at the checklist to see what else needs to be done.";
	otherwise:
		remove TBD from the sub-items of choose-crew;
		add the noun to the sub-items of choose-crew;
		now the noun is in the sound stage;  [Where they will be met on day two.]
		if the number of entries in the sub-items of choose-crew is 3:
			now choose-crew is checked;
		while the number of entries in the sub-items of choose-crew < 3:
			add TBD to the sub-items of choose-crew;
		say "You add [the noun] to the crew list for Apollo 11.";
		if choose-crew is checked:
			say "That should do it!  There was only room for three."


[Some players in testing wanted to "choose file 1".  This is reasonable, so we support it here.]
Choosing crew by is an action applying to one thing.  Understand "choose [personnel-file]" as choosing crew by.
Check choosing crew by personnel-file (called the particular-file):
	try choosing for crew the employee of the particular-file.



[Keep track of when the player looks at the files.  Only hint about the files when the player is doing something else for a while.]
The time since looking at files is a number which varies.
After reading a command:
	if the player's command matches the regular expression "\bfile\b":
		now the time since looking at files is 0;
	otherwise if the personnel puzzle is ready:
		increase the time since looking at files by 1.

Every turn when the remainder after dividing the turn count by 10 is 0 and the personnel puzzle is ready and choose-crew is not checked:
	[Skip this hint if the user just looked at one of the files.]
	if the time since looking at files is greater than 3:
		show hint "Use 'choose so-and-so' to choose someone for the Apollo 11 crew.  Read the personnel files for details on each crew candidate.";

Every turn when the remainder after dividing the turn count by 3 is 0 and a checklist (called X) held by the player is complete:
	say "[X] is complete now.  You should report back to [the director] and give him the checklist.";



[---------- DAY 2 ----------]

Day two is a scene.
Day one ends when checklist-1 is held by the director.
Day two begins when day one ends.
When day two begins:
	say "[room-heading style]Intermission: End of day one[end style]";
	say line break;
	say "You head home, exhausted from a long day at the most important agency (authority? association?) in America.  You collapse into a dreamless sleep, and wake refreshed, ready for you next challenge.[paragraph break]";
	say "[room-heading style]NASA Headquarters, day two of your internship[end style]";
	say line break;
	say "You return to NASA headquarters, brimming with pride over the good work you've done so far.  What challenges await today?  You can hardly contain your excitement as you wait to see the director again.[paragraph break]";
	pause;
	now checklist-1 is nowhere;
	now the blueprints are nowhere;
	now the chalkboard is nowhere;
	now the chalkboard is not critical;  [So you aren't traveling with it anymore]
	now checklist-2 is on the director's desk;
	now the director is not ready;
	now the director is not visited;
	now the director is not relaxed;
	now the secretary is not mad;
	now the player is in the waiting room;
	secretary warns in 0 turns from now;
	director yells-2 in 4 turns from now;
	[Work in progress - while getting feedback, end the story here, but only in the release build.  When we run the testing version, we will continue on into the incomplete day two.]
	maybe end the game.




At the time when director yells-2:
	say "A booming voice comes from the director's office: 'Donna!  Is that damned kid late again?!  Why did we even hire that punk?'[paragraph break][The secretary] shrugs at you and gestures toward [the director]'s office door.";
	now the director is ready.

[Give periodic reminders to get into the director's office if the player misses the first yell.]
Every turn when the remainder after dividing the turn count by 5 is 0 and the director is ready and the director is not visited during day two:
	director yells-2 in 0 turns from now.

Glitter is a concept.  The allowed-scene of glitter is day two.
Understand "operation glitter" as glitter.

Lunch is a concept.  The allowed-scene of lunch is day two.

Checklist-2 is a critical checklist.
The printed name of checklist-2 is "Operation Glitter checklist".
The description of checklist-2 is "The checklist is [if checklist-2 is on the director's desk]laying on the desk, [end if]scribbled out in childish print."
Checklist-2 can be ready.  When day two begins, now checklist-2 is not ready.
Understand "Operation Glitter checklist" as checklist-2.

[HACK: "checklist" is a type, so it could refer to any object of that type.  Sadly, when "asking about", because we are allowed to talk about things in other places, we get a disambiguation prompt for "ask about checklist", even before day two.  This causes a spoiler about Operation Glitter.  I have not managed to fix it with "understand" rules, or "reaching" rules, or anything else, because Inform is frustratingly opaque and has a syntax which is far too expansive for good solutions to be discoverable.  So this hack edits a user's commands to replace "checklist" with a scene-specific individual checklist.]
After reading a command:
	let T be "[the player's command]";
	if day one is happening:
		replace the regular expression "\b(?:check)?list\b" in T with "Apollo 11 checklist";
	otherwise:
		replace the regular expression "\b(?:check)?list\b" in T with "Operation Glitter checklist";
	change the text of the player's command to T.


[Keep the player from leaving without the checklist.]
Instead of going from the director's office during day two:
	if checklist-2 is carried by the player:
		continue the activity;
	otherwise if checklist-2 is not ready:
		try taking checklist-2;  [So that the director will ask you to stop and talk first.]
	otherwise:
		say "'Hang on!' says [the director].  'You're gonna need this!'.  He indicates the checklist[if a checklist is on the director's desk] laying on his desk[end if].  'Get all of that done, ASAP.'"

[Keep the player from taking the checklist until you've talked to the director first.]
Instead of taking checklist-2:
	if checklist-2 is ready:
		say "[The director] looks relieved and says, 'Now, you did good work for us yesterday.  Keep it up, and Nixon might let us all see our families again.  Heh heh.'  His chuckle is not at all comforting.";
		show hint "You can examine the [interesting]checklist[/interesting] to see the details.";
		now the director is relaxed;
		continue the action;
	else:
		say "'Not so fast!' says [the director].  'We need to talk first.'";
		show hint "You can 'talk to director' for suggestions on topics.";

Glitter can be known.
After examining checklist-2:
	now glitter is known;
	continue the action.

Instead of talking to the director during day two:
	say "Perhaps you could ask [the director] about Apollo, [if glitter is known]Operation Glitter, [end if]or the astronauts.";
[TODO: Are these the best Dirk topics for day two?]

Apollo can be day-two-discussed.  When day two begins, now Apollo is not day-two-discussed.
Instead of quizzing the director about Apollo during day two:
	if the player has alien-equations:
		say "'Now, listen, we haven't told anyone this, and we think this would be best kept within these four walls.'  He leans forward and lowers his voice.  'We did it.  We launched Apollo 11 last night, while everyone was asleep.  Those strange equations you showed us were... well... we don't know what they were exactly, but we were able to accomplish the trip much faster than we had originally planned.  But what we found was... disturbing.'[paragraph break]";
		say "[The director] shifts uncomfortably in his chair, as if trying to cope physically with the mental burden he's carrying.  'When we tried to touch down on the surface... it was all wrong.  Up close, the moon was flat, almost two-dimensional.  And then the command module just... went right through, like a ghost.  Now we know what no other human knows: it's not real.  The moon is a projection, put there for a reason, we think, but we could study it for a thousand more years and never truly understand.'[paragraph break]";
		say "'This,' he says somberly, 'is a secret we must keep at all costs.  The American people must not know.  The Ruskies must not know.  We need to show them a perfectly successful moon landing.  So that's exactly where Operation Glitter comes in.'";
	otherwise:
		say "'Now, we've got a bit of a change of plan on Apollo,' says [the director], his brow furrowed.  'You did good yesterday, but I had a little meeting with the folks in accounting yesterday.  Turns out we don't have $25.4 billion to spend on this shindig, so we're scrappin['] it and getting started on Operation Glitter.'  He grins from ear to ear.  'The Ruskies won't know what to think!'";
	now Apollo is day-two-discussed.

Instead of quizzing the director about checklist-2:
	say "'Good, you noticed that.  Same drill as before', he says, 'just follow my highly technical [interesting]checklist[/interesting] to get this operation going.  Ask about any of it if you need help!'";
	if Apollo is not day-two-discussed:
		try quizzing the director about Apollo;
	now checklist-2 is ready.

Instead of quizzing the director about glitter:
	if the player has alien-equations:
		say "'We need to film something convincing, and that's what Operation Glitter is all about.  The truth about the moon [bold type]must[roman type] be kept hidden.'  [The director] sighs a heavy sigh.  He looks years older than he did yesterday.[paragraph break]";
	otherwise:
		say "'It's cheap, and it pretties up just about anything.  Good name, huh?  They let me pick it myself this time!'  He is practically beaming with pride.[paragraph break]";
	if Apollo is not day-two-discussed:
		try quizzing the director about Apollo;
	say "'If you haven't seen the sound stage in the basement, you might want to start down there.  Get to know the photographer, the crew, and make sure everything goes smoothly.'  He leans forward across his desk and looks you directly in the eyes.  'I shouldn't have to say this, but if this project fails, we all go down with it.  Don't screw this up, kid.'";
	now checklist-2 is ready.

Instead of quizzing the director about the internship during day two:
	say "'Plenty more for you to do around here,' he chuckles.  'Just keep to that [interesting]checklist[/interesting] and everything will be fine.'"

Instead of quizzing the director about blueprints during day two:
	if the player has alien-equations:
		say "[The director] shakes his head.  'No, no, we're done with that.  We've got bigger fish to fry now.'";
	otherwise:
		say "[The director] shakes his head.  'No, no, we're done with that.  We gave those to the set designer, but they took a few liberties in the end.  I'm sure it'll look fine on the television.  Those folks are professionals.'"

Instead of quizzing the director about rocket-equations during day two:
	if the player has alien-equations:
		say "[The director] looks haunted.  '... What were those?'  He shakes his head.  'No time for that.  We can't afford to get distracted now.'";
	otherwise:
		say "'Who needs [']em?  Heh heh.  Those eggheads were just dead weight.'  He wipes his eyes.  'The only numbers I care about now are the Nielsens!'"



[TODO: checklist-2 items, sub-items, corresponding conversation topics with the director]



Get-lunch is a checklist-item.  The printed name of get-lunch is "Get lunch".

Drug-astronauts is a checklist-item.  The printed name of drug-astronauts is "'Prepare' astronauts for interviews".
The interview is a concept.  The allowed-scene of the interview is day two.  Understand "prepare", "brainwash", "brainwashing", "brain wash", and "brain washing" as the interview.
The interview can be discussed.
Instead of quizzing the director about the interview:
	say "'Yes, well, here's the thing,' he begins carefully.  'There are sure to be interviews with these astronauts after the operation is over, and well, loose lips sink ships.  So head downstairs to the [interesting]chemistry lab[/interesting] and get something to... [italic type]massage[roman type] the crew's memory a bit.  As far as they are concerned, today's photo shoot is [bold type]the real thing[roman type].'  [The director] looks a bit uncomfortable at the subject.  'Just ask [interesting]the chemist[/interesting] for details.'";
	now the interview is discussed.


The items of checklist-2 are {get-lunch, drug-astronauts}.



[Starting on day two, we lock the doors to these rooms.]
Instead of going to the propulsion lab while day one has ended:
	say "The door to the lab appears to be locked.  There is a sign on it which says 'closed for remodeling'."

Instead of going to the engineering department while day one has ended:
	say "The door to the engineering department appears to be locked.  There is a sign on it which says 'deserted'.  (You were [italic type]sure[roman type] they were never going to do that...)[line break]".


[TODO: describe all the astronauts]
The description of Buzz Aldrin is "".
The description of Neil Armstrong is "".
The description of Michael Collins is "".
The description of Lisa Nowak is "".
The description of Ijon Tichy is "".
The description of Clifford McBride is "".



The basement is below the hallway.  "A long, blank hallway, dimly lit, with doors at either end.  A stairwell in the middle leads back up.  A paper sign is hastily taped to the wall opposite the stairwell."
The printed name of the basement is "NASA Headquarters Basement Level".

The stairwell is a backdrop.  The stairwell is in the hallway and in the basement.

The paper sign is scenery in the basement.  "It says 'AUTHORIZED PERSONNEL ONLY', hand-drawn in black marker."

Instead of going to the basement during day one:
	say "The stairwell door appears to be locked.  You begin to wonder what they keep down there.";



[TODO: Describe the sound stage, add scenery.]
The sound stage is east of the basement.  "Another room!?"
The printed name of the sound stage is "NASA's Secret Underground Sound Stage".

[TODO: Do something with this person.]
The photographer is a stranger in the sound stage.  The photographer is male.
The real name of the photographer is "Stanley".
[TODO: Describe Kubrick.]




A truth-table-value is a kind of value.  The truth-table-values are T, F, X, and Z.
[T = True, F = False, X = Don't Care.  In the context of food, T is a thing a person _must_ have, F is a thing a person _must not_ have, and X is a thing which does not matter to this person.  Z is unused in the tables, but is the opposite of "don't care" for the purposes of generic processing of food properties.]
A truth-table-value has a truth-table-value called antonym.  ["Opposite" was taken already by built-ins.]
The antonym of T is F.  The antonym of F is T.  The antonym of X is Z.

Food is a kind of edible thing.
Kinds of food are defined by the Table of Ingredients.

Table of Ingredients
food			has-meat	has-fish	has-dairy	has-nuts	has-wheat	is-kosher
BLT			T		F		F		F		T		F
tuna sandwich		T		T		T		F		T		F
salad			F		F		T		F		F		T
almond chicken		T		F		F		T		F		T
candy			F		F		T		T		F		F

Table of Dietary Restrictions
person			vs-meat		vs-fish		vs-dairy	vs-nuts		vs-wheat	vs-kosher
the secretary		F		F		X		X		X		X
the director		X		F		X		X		X		F
the head of personnel	X		X		F		F		X		X
Buzz Aldrin		T		X		F		T		F		X
Neil Armstrong		X		X		X		F		F		X
Michael Collins		X		X		T		X		T		X
Lisa Nowak		X		T		X		F		X		X
Ijon Tichy		X		T		X		X		X		X
Clifford McBride	F		F		X		X		X		X
the photographer	X		X		F		X		X		T



Lunch can be day-two-discussed.
Instead of quizzing the director about lunch:
	say "'Lunch is the most important meal of the day,' he says with a serious scowl.  'Don't let doctors tell you otherwise.  And actors get hungry, even when they're astronauts.  You just need to head down to [interesting]the craft services table[/interesting] and get everybody's [interesting]food[/interesting].  Don't forget to ask around and get everyone's order, and don't take any crap about special orders from these prima donnas.  We're on a budget around here!  Tax payers, yadda yadda yadda.'";
	now lunch is day-two-discussed.

Food-preferences is a concept.  The allowed-scene of food-preferences is day two.
Understand "food" and "food preferences" as food-preferences.
Instead of quizzing someone about lunch:
	try quizzing the noun about food-preferences.
	[Unless they have a specific response for lunch.]



A person can be fed.  A person is usually not fed.
Before quizzing a fed person about food-preferences:
	say "'Oh,' says [the noun], 'you already gave me my lunch.  Thanks!'";
	stop the action.

Instead of quizzing the secretary about food-preferences:
	say "'Oh, well, I can't eat any meat or fish,' she says.  'You see, I'm what you call an [']herbivore['].'"

Instead of quizzing the director about food-preferences:
	if lunch is not day-two-discussed:
		try quizzing the director about lunch;
	say "'Now I'm glad you asked about food,' he begins.  'I can't have fish, because I simply don't like the smell.  Not the smell of the fish itself, but the way it makes [bold type]me[roman type] smell when I eat it.  Doctors don't know what it is, and I've just learned to change my diet.  Life gives you a weird-smelling disease, you make lemonade, dammit!'  He looks lost for a moment.  'Where was I?  Right.  Food!  I absolutely, under any circumstances, [bold type]cannot[roman type] eat [bold type]anything[roman type] Kosher.  Even one bite of anything blessed by a Rabbi, and I swell up like a beach ball.'"

Instead of quizzing the head of personnel about food-preferences:
	say "'I'm lactose-intolerant, and I'm allergic to nuts.  Now get lost!'"

Instead of quizzing Buzz Aldrin about food-preferences:
	say "'I've gotta have meat,' he begins, 'and nuts.  In every meal.  And no dairy or wheat!  You think our ancestors ate all this dairy and wheat all the time?  All this processed [bold type]garbage?![roman type]  No way!'  His eyes are becoming increasingly wide.  'Our ancestors foraged for nuts, and they found meat, just lying around or whatever, no biggie, and they ate [bold type]that![roman type]'  His breath is becoming labored, and it takes a visible exertion of effort for him to calm himself."

Instead of quizzing Neil Armstrong about food-preferences:
	say "'I can't have any gluten or nuts.  I'm not allergic to either one, I just... [bold type][italic type]hate[roman type] nuts and glutens.'  The seasoned astronaut looks haunted.  'Sticky, disgusting glutens, clinging to the body.  Dirty.  You can feel it, filling your body from the bottom up.  The more wheat a human being eats, the heavier his toes get.  Look it up!'"

Instead of quizzing Michael Collins about food-preferences:
	say "'Whatever's got dairy and wheat in it is fine.  There's nothing good on God's Green Earth that hasn't got good, preferably Irish, dairy and wheat.'  He gets a dreamy look talking about his homeland.  After a moment, he adds, 'Have you got any porridge?'"

Instead of quizzing Lisa Nowak about food-preferences:
	say "'Oh, what day is it?' she asks. '... Oh, right, it's Friday, isn't it?  It'll have to be something with fish, then.  Oh, and no nuts!'"

Instead of quizzing Ijon Tichy about food-preferences:
	say "He goes on at some length in a slavic-sounding language.  After realizing you haven't understood, he patiently draws a picture of a fish in the air with his finger, then raises his eyebrows meaningfully at you."

Instead of quizzing Clifford McBride about food-preferences:
	say "He give you a look filled with a calm intensity that scares you to your core.  'This is a one-way voyage.  I never cared about you, or any of your small ideas.  For 30 years...' he licks his lips, 'I've been breathing this air, eating this food... enduring these hardships... but I found my destiny.'  After a long moment of terrifying silence, he adds, 'No meat, no fish.  Nothing I couldn't take with me.'"

Instead of quizzing the photographer about food-preferences:
	say "'Kosher, no dairy,' he says, and then immediately turns back to his camera setup."



The toblerone is a candy inside the triangular nameplate.
Understand "candy" and "box" and "candy box" as the toblerone.
The description of the toblerone is "It's a pale yellow, triangular box that says 'TOBLERONE', 'THE FIRST PATENTED SWISS MILK CHOCOLATE [italic type]with[roman type] ALMONDS & HONEY'.".
After opening the triangular nameplate:
	if the toblerone is in the triangular nameplate:
		say "You open a small, concealed hatch on one side of the nameplate, and a pale yellow, triangular [interesting]candy box[/interesting] falls out.";
		now the toblerone is in the location;
	otherwise:
		say "You open a small, concealed hatch on one side of the nameplate."

The printed name of almond chicken is "plate of almond chicken".
Rule for printing the plural name of almond chicken: say "plates of almond chicken".
Understand "plate" and "plate of almond chicken" and "plate of chicken" as almond chicken.
[It's awkward to type "plates" and have only one plate be picked up.  It's even more awkward to solve it in Inform, since "understand" can't be used to map a phrase many objects.  Instead of making the user type "all almond chicken", map "plates", "plates of almond chicken" and "plates of chicken" to "all almond chicken".]
After reading a command:
	let T be "[the player's command]";
	replace the regular expression "plates(?:\s+of(?:\s+almond)?\s+chicken)?" in T with "all almond chicken";
	change the text of the player's command to T.



The craft services table is an enterable supporter in the sound stage.
Two BLTs, three tuna sandwiches, three salads, and two almond chickens are on the craft services table.
The description of the craft services table is "The craft services table is a cheap folding table covered in a red plastic tablecloth with a floral print."
Instead of sitting on the craft services table:
	say "You start to climb onto the craft services table, but it doesn't look like the table would hold your weight, so you think better of it."



The snack count is initially 0.
After eating a food:
	increase the snack count by 1;
	if the snack count is 10:
		say "You eat [the noun], then collapse into a deep, deep food coma from which you never awaken.  Operation Glitter fails and is eventually exposed, and NASA becomes a worldwide laughing-stock.  Russia conquers the globe by 1972.  Your tombstone in Arlington National Cemetery reads 'Intern.'";
		show ending 4;
	otherwise if the snack count is 3:
		say "You eat [the noun].  You are starting to feel unwell.";
	otherwise if the snack count >= 4:
		say "You eat [the noun].  You worry you won't be able to feed everyone now!";
	otherwise:
		say "You eat [the noun].  Not bad.";



The description of a BLT is "A bacon, lettuce, and tomato sandwich on wheat bread.  This one has no mayo."
The description of a tuna sandwich is "A tuna sandwich on wheat bread.  The tuna is mixed with mayo, celery, and onion, and includes some percentage non-Kosher dolphin meat."
The description of salad is "A basic salad, with lettuce, tomato, and shredded cheese.  And it's kosher!"
The description of almond chicken is "Chicken, breaded in a ground-almond batter, fried, and served with almonds, onions, and rice.  Certified Kosher!"
Understand "sandwhich", "tuna sandwhich", "tuna salad", "tuna salad sandwich", and "tuna salad sandwhich" as tuna sandwich.



[The player should be able to "take food" or "take all food".  Same for "drop" or "examine".  So let's make that work.]
Food-preferences is everywhere.
Instead of taking food-preferences:
	repeat with F running through the list of visible food not carried by the player:
		say "[F]: Taken.";
		try silently taking F.

Instead of dropping food-preferences:
	repeat with F running through the list of food carried by the player:
		say "[F]: Dropped.";
		try silently dropping F.

Instead of examining food-preferences:
	let L be the list of visible food;
	if L is empty:
		say "You can't see any such thing.";
	otherwise if the number of entries in L is 1:
		try examining entry 1 of L;
	otherwise:
		say "Which food would you like to examine?  ([L])[line break]".



[When I defined the tables above, I thought I would get to do this with less spaghetti.  But although I can iterate through properties from a list, I couldn't figure out how to use that property variable to get access to a property value from a food.]

To decide if (the recipient - person) will eat (the snack - food):
	choose the row with person of the recipient from Table of Dietary Restrictions;
	let M1 be the has-meat of the snack;
	let M2 be the vs-meat entry;
	let F1 be the has-fish of the snack;
	let F2 be the vs-fish entry;
	let D1 be the has-dairy of the snack;
	let D2 be the vs-dairy entry;
	let N1 be the has-nuts of the snack;
	let N2 be the vs-nuts entry;
	let W1 be the has-wheat of the snack;
	let W2 be the vs-wheat entry;
	let K1 be the is-kosher of the snack;
	let K2 be the vs-kosher entry;
	if M1 is the antonym of M2:
		decide no;
	otherwise if F1 is the antonym of F2:
		decide no;
	otherwise if D1 is the antonym of D2:
		decide no;
	otherwise if N1 is the antonym of N2:
		decide no;
	otherwise if W1 is the antonym of W2:
		decide no;
	otherwise if K1 is the antonym of K2:
		decide no;
	otherwise:
		decide yes.

The fed count is initially 0.
Check giving a food (called the snack) to someone (called the recipient) during day two:
	if the recipient is yourself:
		[This condition avoids a runtime exception looking up in the table of dietary restrictions.]
		say "Do you really think they would feed the intern?";
	otherwise if the recipient is fed:
		say "'No, thanks,' says [the recipient].  'I've already got my lunch.'";
	otherwise if the recipient will eat the snack:
		say "[The recipient] takes [the snack].  [one of]'Thanks, kid!'[or]'Oh, my favorite!'[or]'That looks great!'[purely at random]";
		now the snack is nowhere;
		now the recipient is fed;
		increase the fed count by 1;
		if the fed count is 7:
			say "That seems to be the last of the lunch deliveries!";
			now get-lunch is checked;
	otherwise:
		if a random chance of 1 in 3 succeeds:
			say "[The recipient] takes [the snack].  'Thanks, kid!'  But after one bite, they seem to be suffering greatly.  'What was in this??  This kid is trying to poison me!!'[paragraph break]";
			say "NASA security arrives shortly, hauls you carelessly to the building exit, and then tosses you into the street.  You have been fired for gross craft-services negligence, and Operation Glitter fails miserably.  NASA becomes a worldwide laughing-stock, and Russia conquers the globe by 1972.  Not only have you failed your country, but you are banned by the International Alliance of Theatrical Stage Employees and you never work in Hollywood again.";
			show ending 6;
		otherwise:
			say "[The recipient] looks at [the snack] and says 'No, I can't eat that.  Were you even listening?'";
	stop the action.




[TODO: Describe the chemistry lab, add scenery.]
The chemistry lab is west of the basement.  "Another room!?"
The printed name of the chemistry lab is "NASA Chemistry Lab".

The chemist is a stranger in the chemistry lab.  The chemist is female.
[TODO: Name this person.]
[TODO: Describe this person.]

Instead of talking to the chemist:
	say "'What can I get you?' asks [the chemist].  'We've got [list of things which are a drug in the location].'"

Instead of asking the chemist for a thing:
	say "'Here you go!'  She hands you [the second noun].";
	try silently taking the second noun.

Instead of giving a food to the chemist:
	say "'Oh, no thanks.  I already had lunch,' she says.  'I just ate a handful of mushrooms.'"

Instead of giving a thing which is a drug to the chemist:
	say "She shakes her head.  'No, I've got plenty.  You keep that.'"

Instead of quizzing the chemist about the interview:
	if the interview is discussed:
		say "You carefully relay to [the chemist] what [the director] told you about this part of the operation.  'Whoa,' she finally responds.  'That's heavy.'  She zones out for a moment, then comes back to herself.  'Manipulating memories is pretty a new field, so you may just have to [italic type]experiment[roman type] a bit.  Take whatever you like, dude.'";
	otherwise:
		say "She looks confused.  'I don't know anything about that.  Did [the director] send you?  You might want to ask him first.'"





Drugs are a concept.  Drugs are everywhere.  Understand "drug" as drugs.
A thing can be a drug.  A thing is usually not a drug.
Instead of quizzing the director about drugs:
	say "[The director] quickly begins shaking his head.  'No, no, not my department.  Head downstairs to the [interesting]chemistry lab[/interesting] and ask in there.'"



Instead of taking drugs:
	let T be the list of things which are a drug in the location;
	let U be the list of things which are a drug carried by the player;
	if the player's command includes "take":
		if the player's command matches the regular expression "\ball (?:the )?drugs\b":
			say "Whoa, slow down, there![paragraph break]";
			repeat with D running through T:
				say "[D]: Taken.";
				now the player has D;
			stop the action;
		otherwise:
			say "(Assuming you mean 'pick up'...) [run paragraph on]";
	if T is not empty:
		say "Which do you want to pick up?  (You can see [T].)[line break]";
	otherwise if U is not empty:
		say "You can't see any such thing in the room.  (But you are carrying [U].)";
	otherwise:
		say "You can't see any such thing."

Before taking a thing which is a drug:
	if the player's command includes "take":
		say "(Assuming you mean 'pick up'...) [run paragraph on]".



Instead of giving a thing (called the flask) which contains a drink (called the potion) which is a drug to an astronaut (called the space-hero):
	try giving the potion to the space-hero.

Before giving a thing which is a drug to an astronaut:
	say "[The second noun] takes [the noun] from you.  'Is this some kind of pre-flight vitamin?'[paragraph break]";
	say "'Um, yes, I think so,' you lie unconvincingly.[paragraph break]";
	if the noun is a space-cake:
		say "[The second noun] smiles.  'Vitamins in cake form?  What will they think of next?'"

Before giving a thing which is a drug to Ijon Tichy:
	say "[The second noun] takes [the noun] from you.  He raises an eyebrow at you, and you smile and nod."

After giving a thing which is a drug to an astronaut:
	if the noun is a drink:
		[You gave them the container.  You didn't pour it into their mouth for them.]
		now the holder of the noun is nowhere;
	otherwise:
		now the noun is nowhere.



The block giving rule is not listed in the check giving it to rules.
Check giving a thing to someone:
	if the noun is a drug and the second noun is an astronaut:
		do nothing;
	otherwise:
		say "[The second noun] [don't] seem interested.";
		stop the action.
After giving a thing which is a drug to an astronaut:
	[The "carry out" rules for each drug describe the action, but the astronaut consumes it immediately.]
	now the noun is nowhere.



A space-cake is a kind of thing.  A space-cake is edible and a drug.
Understand "cake", "space cake", and "spacecake" as space-cake.
Carry out giving a space-cake to an astronaut:
	say "[The second noun] eats the cake, slowly at first, but then more quickly."


LSD is a kind of thing.  LSD is edible, swallowable, and a drug.
Before dropping LSD, say "(Assuming you mean 'put down'...) [run paragraph on]".
Carry out giving LSD to an astronaut:
	say "[The second noun] pops the LSD into [their] mouth."


Valium is a kind of thing.  Valium is edible, swallowable, and a drug.
Carry out giving valium to an astronaut:
	say "[The second noun] swallows the pill."


Librium is a kind of thing.  Librium is edible, swallowable, and a drug.
Carry out giving librium to an astronaut:
	say "[The second noun] swallows the pill."


A mysterious silver liquid is a kind of drink.  A mysterious silver liquid is a drug.
Carry out giving a mysterious silver liquid to an astronaut:
	say "[The second noun] drinks the mysterious liquid, grimacing as it goes down.  [Their] head begins to droop and sway."



A vial is a kind of liquid-safe container.
The description of a vial is "A small glass vial[if the noun contains nothing]which appears to be empty.[otherwise].[end if]".
Rule for printing the name of a vial (called the flask) while not inserting or removing:
	if the flask contains nothing:
		say "empty vial";
	otherwise:
		say "vial of [list of objects contained by the flask]";
	omit contents in listing.




In the chemistry lab is a space-cake, LSD, three valium, and two librium.
The small vial is a vial in the chemistry lab.  In the small vial is a mysterious silver liquid.




[---------- DAY 3 ----------]

Day three is a scene.
Day two ends when checklist-2 is held by the director.
Day three begins when day two ends.
[TODO: day three (epilogue) - darkness, locked rooms, dirk meets you in the waiting room
When day three begins:
]




Section 2 - WIP release mode - For release only

To maybe end the game:
	say paragraph break;
	say ending-card style;
	say "Well, folks, that's all for now!  Thank you for trying out this work in progress.";
	say end style;
	show ending 7;

Section 3 - WIP testing mode - Not for release

To maybe end the game:
	do nothing.

Teleporting to is an action out of world applying to one thing.  Understand "teleport to [anywhere]" and "teleport [anywhere]" as teleporting to.
Check teleporting to a room (called the destination):
	try teleporting yourself to the destination;

Teleporting it to is an action out of world applying to two things.  Understand "teleport [anything] to [anywhere]" and "teleport [anything] [anywhere]" as teleporting it to.
Check teleporting it to:
	say "Thanks to testing mode, you teleport [the noun] to [the second noun].  With great power comes great responsibility!";
	now the noun is in the second noun;



[Test commands for speedy testing:]

Test stand with "sit / stand / stand / z / z / n".

Test plant with "l / take plant / l / drop plant / l / eat plant".

Test waiting with "z / z / z / z / z / n";

Test nameplate with "test waiting / x nameplate / x desk / take nameplate / i / x nameplate / g / g / g / g / l / x desk / drop nameplate / l / x desk / put nameplate on desk / l / x desk / open nameplate / l / x toblerone / eat toblerone".

Test startday1 with "test waiting / x checklist / take checklist / talk to director / ask director about internship / take checklist / give checklist to director / x checklist / i".

Test nobody with "test startday1 / e / ask about nasa".

Test tasks with "test startday1 / ask about blueprints / ask about equations / ask about crew".

Test blueprints with "test startday1 / e / e / ask about blueprints / ask about whiteprints / x engineer / take blueprints / i / x checklist".

Test coffee with "test startday1 / e / e / x coffee pot / take pot / i / take coffee / i / put checklist in pot / i".

Test plaque with "test startday1 / e / x plaque".

Test equations with "test startday1 / e / n / ask about name / ask about work / ask about equations / ask about rocket equations / ask about rockets / x board / take chalkboard / s / n / e / w / n / ask them about him / talk to him / l / x them / x checklist".

Test key with "test startday1 / e / n / x dr / take key / n / ask them about him / take key / n / ask them about him / take key / n / s / teleport key to hallway / take key / n".

Test tapir with "test startday1 / e / n / ask about tapir / ask about brizzleby / ask them about brizzleby / ask about rocket equations / ask about brizzleby / ask about nasa / ask about tapir / ask about brizzleby / ask about nasa".

Test aliens with "test key / x tapir / ask tapir about name / x cage / open cage / x cage / s / x tapir / ask about nasa / ask about apollo / ask about dr / ask about rocket equations / x checklist".

Test others with "test startday1 / e / n / talk to other scientists / talk to scientists / talk to others / talk to them / talk to scientist / talk to him / talk to head / talk to head scientist / talk to rocket scientist / talk to doctor".

Test shoe with "test startday1 / e / n / ask about rocket equations / sorry / w".

Test crew with "test startday1 / e / s / choose donna / x file 1 / wake him / ask him about name / ask him about files / take files / drop file 1 / choose aldrin / choose donna / x checklist / choose aldrin / choose collins / x checklist / choose armstrong / x checklist / choose nowak".

Test wake with "test startday1 / wake him / sorry / wake him / e / s / x him / open drawer / l / x him / n / s / wake him / n / s / talk / ask about crew / i / ask about crew / ask about files".

Test files with "test startday1 / e / s / take files / x file 1 / x file 2 / x file 3 / x file 4 / x file 5 / x file 6 / i".

Test drawer with "test startday1 / e / s / open drawer / close drawer / open cabinet / close cabinet / open drawer / l / take files / l".

Test day2 with "test blueprints / w / s / take files / choose aldrin / choose collins / choose armstrong / n / n / take chalkboard / w / give checklist to director".

Test day2alt with "test blueprints / w / s / take files / choose aldrin / choose collins / choose armstrong / n / n / x dr / take key / n / ask about tapir / take key / n / ask about tapir / take key / ask tapir about name / open cage / s / ask about rocket equations / w / give checklist to director".

Test glitter1 with "test waiting / ask about glitter".

Test glitter2 with "test day2 / test waiting / talk to him / x checklist / talk to him / ask about glitter".

Test glitter2alt with "test day2alt / test waiting / talk to him / x checklist / talk to him / ask about glitter".

Test startday2 with "test day2 / test waiting / ask about glitter / take checklist / x checklist".

Test food with "test startday2 / e / d / take food / give chicken to buzz / give tuna to collins / give salad to armstrong / give chicken to photographer / u / s / give blt to franklin / n / w / give blt to dirk / s / give salad to donna / x list".

Test day3 with "test food / n / report".
