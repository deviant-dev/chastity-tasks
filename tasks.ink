# theme: dark

LIST task_type = unknown, anal, balls, bondage, edge, oral, physical, porn, spank, torture, writing
VAR dont_cum = false
VAR ask = true

-> Intro

=== Intro ===

Rules: # CLEAR

<ol>
<li>Lock yourself up with a variable lock in Chastikey
<li>When you get a chance to draw a card, first try 'Check for a Task' (work or home depending on where you are)
<li>If you didn't get a task, congratulations! You lucked out until the next card.
<li>If you get a task, you must do that task before drawing your next card. Use the interface to add red cards if you skip or choose a different task as instructed.
<li>Once you've completed your task, you may draw your next card.

-> TaskMenu


=== Reset ===
~ task_type = unknown
~ dont_cum = false
->->


=== TaskMenu ===
-> Reset ->
~ ask = true

+ [See if you have a Task at Home (25% chance)]
    TASK: -> Sometimes(-> RandomTask) -> Review(-> RandomTask) ->
+ [See if you have a Task at Home (100% chance)]
    TASK: -> RandomTask -> Review(-> RandomTask) ->
+ [See if you have a Task at Work (25% chance)]
    TASK: -> Sometimes(-> RandomTaskAtWork) -> Review(-> RandomTaskAtWork) ->
+ [See if you have a Task at Work (100% chance)]
    TASK: -> RandomTaskAtWork -> Review(-> RandomTaskAtWork) ->
+ [Test Menu] -> TestMenu

- -> TaskMenu

=== TestMenu ===
-> Reset -> 
~ ask = false

+ [Test Home Tasks] -> RandomTask -> Review(-> RandomTask) ->
+ [Test Work Tasks] -> RandomTaskAtWork -> Review(-> RandomTaskAtWork) ->
+ [Anal Task] -> AnalTask -> Review(-> AnalTask) ->
+ [Edge Task] -> EdgeTask -> Review(-> EdgeTask) ->
+ [Exercise Task] -> ExerciseTask -> Review(-> ExerciseTask) ->
+ [Oral Task] -> OralTask -> Review(-> OralTask) ->
+ [Porn Task] -> PornTask -> Review(-> PornTask) ->
+ [Spank Task] -> SpankTask -> Review(-> SpankTask) ->
+ [Torture Task] -> TortureTask -> Review(-> TortureTask) ->
+ [Writing Task] -> WriteTask -> Review(-> WriteTask) ->
+ [Return to Main Menu] -> Intro

- -> TestMenu

=== Review(-> task) ===
<>. {dont_cum: Don't cum!}

{ask == false:
    ->->
}

Send your keyholder snaps while you do so, so they may judge your performance.

+ [Complete Task]
+ [Not Equiped to Do This]
    Okay, let's try something else.
    -> Reset -> task -> Review(task)
+ [Choose Again (+1 red card)]
    Shying away from harder tasks is frowned upon. +1 red card.
    -> Reset -> task -> Review(task)
+ [Skip Task (+3 red cards)]
    You skipped your task! You shall be punished. +3 red cards. ->->

- {dont_cum: -> AskCum -> }

Your task is complete. Your keyholder will now judge your performance. They will add green cards if they are pleased and red cards if they are not.

->->


=== AskCum ===

Did you cum?
+ [Yes] That was forbidden! You shall be punished. +3 red cards.
+ [No] Good boy.

- ->->


=== Sometimes(-> task) ===
{ shuffle:
    -
    -
    -
    - -> task
}

- No task assigned. You lucked out... this time.
-> TaskMenu

=== RandomTask ===

~ dont_cum = false

{shuffle:
    - -> AnalTask
    - -> EdgeTask
    - -> ExerciseTask
    - -> OralTask
    - -> PornTask
    - -> SpankTask
    - -> TortureTask
    - -> WriteTask
}

->->

=== AnalTask ===
{shuffle:
    - Rinse your ass out with the enema bulb and repeat until you are clean. Shower
        ~ task_type = anal
    - Wear a butt plug for {manyMinutesOrEndure()}
        ~ task_type = anal
        -> WhileTaskOptional
    - Stretch your ass with the largest dildo you can take for {manyMinutesOrEndure()}
        ~ task_type = anal
        -> WhileTaskOptional
    - Fuck your ass with a dildo for {fewMinutes()}
        ~ task_type = anal
        ~ dont_cum = true
        -> WhileTaskOptional
    - Finger your ass for {fewMinutes()}
        ~ task_type = anal
        ~ dont_cum = true
        -> WhileTaskOptional
    - Fuck yourself on the fucking machine for {fewMinutes()}
        ~ task_type = anal
        ~ dont_cum = true
        -> WhileTaskOptional
    - Sit on a dildo for {manyMinutesOrEndure()} while you do your work
        ~ task_type = anal
    - Fist your ass for {fewMinutes()}
        ~ task_type = anal
        ~ dont_cum = true
        -> WhileTaskOptional
}

->->

=== BondageTask ===
{ shuffle:
    - Strip naked and wear wrist and ankle cuffs for {manyMinutes()}
        ~ task_type = bondage
        -> WhileTaskOptional
    - Strip naked and bind your wrists together for {manyMinutes()}
        ~ task_type = bondage
        -> WhileTaskOptional
    - Strip naked and wear the gimp mask for {manyMinutes()}
        ~ task_type = bondage
        -> WhileTaskOptional
    - Wear a collar for {manyMinutes()}
        ~ task_type = bondage
        -> WhileTask
}
->->

=== EdgeTask ===
{shuffle:
    - Edge {veryFewTimes()} {masturbationMethod()}
        ~ dont_cum = true
        ~ task_type = edge
        -> WhileTaskOptional
    - Give yourself a ruined orgasm {masturbationMethod()}
        ~ task_type = edge
        -> WhileTaskOptional
    - Hold the vibe against your cage for {fewMinutes()}
        ~ dont_cum = true
        ~ task_type = edge
        -> WhileTaskOptional
}
->->

=== ExerciseTask ===
{ shuffle:
    - Do {largeCount()} {exerciseType()} naked. Count off and thank your keyholder for each one
        ~ task_type = physical
    - Do a sexy dance for your keyholder for {fewMinutes()}
        ~ task_type = physical
        -> WhileTaskOptional
    - Strip naked, put your face on the ground, stick your ass in the air
        ~ task_type = physical
        -> WhileTask
    - Run in place for {fewMinutes()} {inStateOfDress()}
        ~ task_type = physical
        -> WhileTaskOptional
}
->->

=== OralTask ===
{ shuffle:
    - Deep throat a dildo {fewTimes()}
        ~ task_type = oral
    - Give head to a dildo for {veryFewMinutes()}
        ~ task_type = oral
        -> WhileTaskOptional
}
->->

=== PornTask ===
{shuffle:
    - Watch {fewMinutes()} of {pornType()}
        ~ task_type = porn
        -> WhileTask
    - Watch {pornType()} until you drip
        ~ task_type = porn
        -> WhileTask
}
->->

=== function massageType() ===
{ shuffle:
    - a foot rub
    - a back massage
    - an oil massage
    - a neck rub
    - a scalp massage
}

=== SpankTask ===
{ shuffle:
    - Smack {spankLocation()} with {spankTool()} {spankCount()}
        ~ task_type = spank
        -> WhileTaskOptional
}
->->

=== TortureTask ===
{shuffle:
    - Tie weights to your balls and stretch them for {fewMinutes()}
        ~ task_type = balls
        -> WhileTaskOptional
    - Use estim on {estimLocation()} for {manyMinutesOrEndure()}
        ~ task_type = torture
        ~ dont_cum = true
        -> WhileTaskOptional
    - Snap a rubber band {fewTimes()} on {rubberBandLocation()}. Count off and thank your keyholder for each one
        ~ task_type = torture
    - Put {smallCount()} clothespins on {clothespinLocation()} for {fewMinutes()}
        ~ task_type = torture
        -> WhileTaskOptional
}
->->

=== WriteTask ===
{ shuffle:
    - Write out {smallCount()} {thingsToWrite()}
        ~ task_type = writing
        -> WhileTask
}
->->

=== WhileTask ===
{shuffle:
    - {task_type != anal: <> while wearing a butt plug| -> WhileTask}
    - {task_type != anal: <> while stretching your ass on the largest dildo you can handle| -> WhileTask}
    - {task_type != anal: <> while fucking your ass with a dildo| -> WhileTask}
        ~ dont_cum = true
    - {task_type != edge: <> while holding the vibe against your cock cage| -> WhileTask}
        ~ dont_cum = true
    - {task_type != porn: <> while watching {pornType()}| -> WhileTask}
    - {task_type != spank: <> while spanking {spankLocation()}| -> WhileTask}
    - {task_type != spank: <> while slapping {spankLocation()} with {spankTool()}| -> WhileTask}
    - {task_type != torture: <> while using estim on {estimLocation()}| -> WhileTask}
    - {task_type != torture: <> while enduring {smallCount()} clothespins on {clothespinLocation()}| -> WhileTask}
    - {task_type != writing && task_type != physical: <> while writing down {smallCount()} {thingsToWrite()}| -> WhileTask}
    - {task_type != edge: <> while edging {masturbationMethod()}| -> WhileTask}
}
->->

=== WhileTaskOptional ===
{ shuffle:
    - -> WhileTask ->
    -
    -
}
->->


=== RandomTaskAtWork ===
~ dont_cum = false
Go to the bathroom and <>
{ shuffle:
    - finger your ass for {veryFewMinutes()}
        ~ task_type = anal
        -> WhileAtWorkOptional
    - stroke yourself in your cage {manyTimes()}
        ~ task_type = edge
        -> WhileAtWorkOptional
    - smack your balls {veryFewTimes()}
        ~ task_type = spank
        -> WhileAtWorkOptional
    - squeeze and stretch your balls for {veryFewMinutes()}
        ~ task_type = spank
        -> WhileAtWorkOptional
    - suck your fingers like a cock for {veryFewMinutes()}
        ~ task_type = oral
        -> WhileAtWorkOptional
    - pinch your nipples for {veryFewMinutes()}
        ~ task_type = torture
        -> WhileAtWorkOptional
    - watch {pornType()} until you drip
    - watch {veryFewMinutes()} of {pornType()}
        ~ task_type = porn
        -> WhileAtWorkOptional
}
->->

=== WhileAtWorkOptional ===
{ shuffle:
    - -> WhileAtWork ->
    -
    -
    -
}
->->


=== WhileAtWork ===
<> while <>
{shuffle:
    - {task_type != porn: watching {pornType()}| -> WhileAtWork}
    - {task_type != spank: smacking your balls| -> WhileAtWork}
    - {task_type != oral: sucking on your fingers like a cock| -> WhileAtWork}
    - {task_type != writing: thinking up new and wonderful things keyholder could do with you. Write them down| -> WhileAtWork}
    - {task_type != writing && task_type != physical: writing down {verySmallCount()} {thingsToWrite()}| -> WhileAtWork}
}

->->

=== function spankTool() ===
{ shuffle:
    - your hand
    - a paddle
    - a dildo
    - a crop
    - a cane
    - {shuffle:
        - the flat side of a hairbrush
        - the bristle side of a hairbrush
    }
}

=== function spankLocation() ===
{ shuffle:
    - your balls
    - your ass cheeks
}

=== function clothespinLocation() ===
{ shuffle:
    - your balls
    - your ass cheeks
    - your nipples and chest
}

=== function rubberBandLocation() ===
{ shuffle:
    - your balls
    - each ass cheek
    - each nipple
}

=== function estimLocation() ===
{ shuffle:
    - your balls
    - your ass cheeks
}

=== function exerciseType() ===
{ shuffle:
    - jumping jacks
    - squats
    - compromising yoga stretches
    - push ups
    - cock-wagging hip thrusts
}

=== function masturbationMethod() ===
{ shuffle:
    - by massaging your prostate with a toy
    - using a vibrator on your cock cage
    - by riding the fucking machine
    - using cage strokes
}


=== function pornType() ===
{ shuffle:
    - femdom porn
    - femdom hypno vids
    - femdom pegging porn
    - femdom JOI porn
    - femdom slave porn
    - slave hypno vids
    - mind fuck hypno vids
    - chastity porn
    - pussy worship porn
    - feet worship porn
    - bondage porn
    - cuckold porn
    - big dick porn
    - humiliation porn
    - fetish porn of your choice
    - porn that makes you hard
    - porn that embarrasses you
    - porn that is a guilty pleasure
    - hentai porn
    - cosplay porn
    - tentacle porn
    - anal porn
    - gangbang porn
    - squirting porn
    - fisting porn
}

=== function thingsToWrite() ===
{ shuffle:
    - activities you fantasize about
    - terrible things for your keyholder to do to you
    - things you hope your keyholder will do to you some day
    - ways in which you could better serve your keyholder
    - experiences that make you feel more submissive
    - secret desires
    - new tasks for this task list and add them to the script
}

=== function inStateOfDress ===
{ shuffle:
    - in the nude
    - wearing nothing but a collar
    - wearing nothing but wrist and ankle cuffs
    - wearing nothing but {gagType()}
    - wearing nothing but the gimp mask
    - wearing a rope harness attached to an anal hook
    - wearing collar, cuffs, and the gimp mask
}

=== function gagType ===
{ shuffle:
    - a ball gag
    - an O-ring gag
    - a bit gag
}

=== function manyTimes() ===
{largeCount()} times

=== function fewTimes() ===
{ shuffle:
    - 3 times
    - 3 times
    - 3 times
    - 3 times
    - 5 times
    - 5 times
    - 10 times
}
~ return

=== function veryFewTimes() ===
{ shuffle:
    - 1 time
    - 1 time
    - 1 time
    - 1 time
    - 2 times
    - 2 times
    - 3 times
    - 3 times
    - 5 times
}
~ return

=== function spankCount() ===
{ shuffle:
    - {largeCount()} times
    - {largeCount()} times
    - {largeCount()} times
    - {largeCount()} times
    - {largeCount()} times
    - {largeCount()} times
    - until bright red
}

=== function smallCount() ===

{ shuffle:
    - 5
    - 5
    - 5
    - 5
    - 10
    - 10
    - 15
}

=== function verySmallCount() ===
{ shuffle:
    - 1
    - 1
    - 1
    - 1
    - 2
    - 2
    - 3
    - 3
    - 5
}
~ return

=== function largeCount() ===
{ shuffle:
    - 5
    - 5
    - 5
    - 5
    - 5
    - 5
    - 5
    - 10
    - 10
    - 10
    - 10
    - 20
    - 20
    - 20
    - 30
    - 50
    - 100
}


=== function fewMinutes() ===
{smallCount()} minutes
~ return

=== function veryFewMinutes() ===
{ shuffle:
    - 1 minute
    - 1 minute
    - 1 minute
    - 1 minute
    - 2 minutes
    - 2 minutes
    - 3 minutes
    - 3 minutes
    - 5 minutes
}
~ return


=== function manyMinutes() ===
{ shuffle:
    - 10 minutes
    - 10 minutes
    - 10 minutes
    - 10 minutes
    - 10 minutes
    - 10 minutes
    - 20 minutes
    - 20 minutes
    - 20 minutes
    - 20 minutes
    - 30 minutes
    - 30 minutes
}

=== function manyMinutesOrEndure() ===
{ shuffle:
    - {manyMinutes()}
    - {manyMinutes()}
    - {manyMinutes()}
    - {manyMinutes()}
    - {manyMinutes()}
    - {manyMinutes()}
    - as long as you can take it
}



