{
    "title": "Gamejammin'",
    "date": "2026-06-01T18:10:00+02:00",
    "cover": {
        "image":"/posts/gamejammin/images/window_wizard.png",
        "alt": "Window wizard thumbnail",
        "caption": "Spoiler for the rest of the post",
        "relative": false
    },
    "categories": [
      "Cool stuff"
    ],
    "tags": ["Game jams", "Development"],
    "draft": true
}

I'm studying at a university now. During the winter semester, I had heard about some university-organised game jam, that I could get some credit for. As you *might* have seen on this page before, I have some history working with Godot. So at the start of the summer semester, I've talked to my friends and together, we joined the summer jam.

{{< figure
  src="/posts/gamejammin/images/jam_banner.png"
  alt="GameJam banner"
  caption=""
  class="ma0 w-75"
>}}

For context, this [jam](https://itch.io/jam/matfyz-game-jam-spring-2026) is part of the game development course at MFF CUNI, where I study. The assignment is to develop a game with a specified theme within 48 hours. We can be physically at the Malostranská (MS) building  or online, or wherever we want. At the 48 hour deadline, the submissions close (anything submitted after 48 hours doesn't count). For the week after that, there is a community voting period, where we are encouraged to play each-other's games and vote on them in five categories.

# Our journey

The start of the journey was very wobbly. First, one of our original members had to skip the jam due to some scheduling issues. Then, right before the start, the metro station's escalator got blocked, so I had to maneuver through the center of Prague just to get to the MS building. Luckily, I managed to catch a bus, that brought me all the way to Malostranské náměstí bus stop.

{{< figure
  src="/posts/gamejammin/images/minibus.jpg"
  alt="Minibus on the bus line 193"
  caption="This is the cute \"bus\" that saved my day"
  class="ma0 w-75"
>}}

After I got to the MS building, I realised, that I forgot my power brick at my dorms *twenty tram minutes away*. What can I do, except ride twenty minutes there, pick-up the power brick, check the Raspberry Pi 3 hosting the git server we'll be using for the game jam and ride twenty minutes back.

From then, it was mostly smooth sailing. We've set up our jam site in the S7 room and went into S3 for the initial talk. We got told some misc info like how to get into the building, what not to do and where to get snacks. And then came the theme announcement...
# Over the top ... and what do we do with that.
This was harder than I imagined. On the previous jam that I participated in, I got the idea almost immidiately after hearing the theme but this time, nothing.

We moved back into S7 and got to brainstorming. Mountains have tops! You can be thrown over on a ship? Maybe something with some clothes? What about computer windows? That could work...

{{< rawhtml >}} 
<figure class="ma0 w-75">
  <video width=100% controls>
    <source src="/posts/gamejammin/images/first_demo.webm" type="video/webm">
    Your browser does not support the video tag.  
  </video>
  <figcaption>
    <p>First demo of the "window mechanic"</p>
  </figcaption>
</figure>
{{< /rawhtml >}}

Okay that works pretty good. Could we make a puzzle platformer with that? *And that is the origin of the Window Wizard concept*.

***I'd like to warn you, that there may be spoilers ahead, if you want to play our game blind, please head over to [itoncek.itch.io/window-wizard](https://itoncek.itch.io/window-wizard) and play the game before continuing***

# Window Wizard and Window Manager
So... how does it work. You can see the basic implementation of this effect in the video above.
