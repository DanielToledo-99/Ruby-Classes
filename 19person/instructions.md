# You are a Person

Your capabilities are:

- When you are created, you are given a `name` and as a new person, you start
  with 80 points of `hunger`, 10 of `sleepiness`, and 80 of `stamina`. Each stat
  should stay in the range of 0-100.
- When you are asked `status` you will `puts` the following:

```bash
"My name is [name], this is my status:"
"Hunger: [hunger]"
"Sleepiness: [sleepiness]"
"Stamina: [stamina]"
```

And then you will `puts` any status alert depending if one or more of your stats
are 0 or 100.

"I am very hungry" if hunger == 100

"I am satiated" if hunger == 0

"I need to sleep" if sleepiness == 100

"I am totally rested" if sleepiness == 0

"I have a lot of energy" if stamina == 100

"I'm tired" if stamina == 0

- When you are asked to `exercise` you will be given an intensity level ("low",
  "medium" or "high"), and you will puts a message and modify your stats
  depending on the intensity level:
  - `low` message: "I have exercised at low intensity", stamina is reduced by 10
    points and hunger increased by 10 points.
  - `medium` message: "I have exercised at medium intensity", stamina is reduced
    by 25 points and hunger increased by 30 points.
  - `high` message: "I have exercised at high intensity", stamina is reduced by
    50 points and hunger increased by 60 points.
- When you are asked to `sleep` your hunger will increase by 20 points, your
  sleepiness will go to zero, and your stamina to 100. You will ´puts´ "I have
  slept"
- When you are asked to `study` your hunger will increase by 25 points, your
  sleepiness will increase by 30 points and your stamina will decrease by 10
  points. You will ´puts´ "I have studied"
- When you are asked to `eat` you will be given a `Food` and you will modify
  your stats based on the Food `effects`. Finally, you will puts "I have eaten"
  and "That [food name] tasted [food taste]!"

# You are a Children

- You are a special kind of `Person`. You are created exactly as a Person but
  your hunger starts at 100 points.
- You eat food differently as well. For any Food, you will gain only 80% of the
  hunger effect, 110% of the sleepiness effect, and 120% of the stamina effect.

# You are a Food

- When you are created, you are given a name, a type, and a taste.
- Your effects when some Person or Children eats you depend on the type of food
  you are:
  - Type "dessert": hunger: -20 points, sleepiness: 0 points and stamina: 10
    points
  - Type "meal": hunger: -50 points, sleepiness: 10 points, stamina: 25 points
  - Type "energizer": hunger: -10 points, sleepiness: -50 points, stamina: 50
    points
- When you are asked about `effects` you will return a hash with your effects.
- When you are asked for `name` you will return your name.
- When you are asked for `taste` you will return your taste.
