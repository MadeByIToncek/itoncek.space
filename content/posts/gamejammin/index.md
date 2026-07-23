{
    "title": "Gamejammin'",
    "date": "2026-08-01T18:10:00+02:00",
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

I'm stu**dying** at a university now. During the winter semester, I heard about a university-organised game jam for which I could earn some credit. As you *might* have seen on this page before, I have some history working with Godot. So at the start of the summer semester, I talked to my friends, and together, we joined the summer jam.

{{< figure
  src="/posts/gamejammin/images/jam_banner.png"
  alt="GameJam banner"
  caption=""
  class="ma0 w-75"
>}}

For context, this [jam](https://itch.io/jam/matfyz-game-jam-spring-2026) is part of the game development course at MFF CUNI, where I study. The assignment is to develop a game with a specified theme within 48 hours. We can be physically at the Malostranská (MS) building  or online, or wherever we want. At the 48-hour deadline, the submissions close (anything submitted after 48 hours doesn't count). For the week after that, there is a community voting period, where we are encouraged to play each other's games and vote on them in five categories.

# Our journey

The start of the journey was very wobbly. First, one of our original members had to skip the jam due to some scheduling issues. We had to change the team composition at the last minute and call in external support. The final team members were me (@itoncek), @madlain, @equist and @bohemic_boy.

 Then, right before the start, the metro station's escalator got blocked, so I had to manoeuvre through the centre of Prague just to get to the MS building. Luckily, I managed to catch a bus that brought me all the way to Malostranské náměstí bus stop.

{{< figure
  src="/posts/gamejammin/images/minibus.jpg"
  alt="Minibus on the bus line 193"
  caption="This is the cute \"bus\" that saved my day"
  class="ma0 w-75"
>}}

After I got to the MS building, I realised that I forgot my power brick at my dorms, *thirty tram minutes away*. What can I do, except ride 30 minutes there, pick up the power brick, last check of the Raspberry Pi 3, which is hosting the git server we'll be using for the game jam and ride 30 minutes back.

From then on, it was mostly smooth sailing. We've set up our jam site in the S7 room and went into S3 for the initial talk. We got told some misc info like how to get into the building, what not to do and where to get snacks. And then came the theme announcement...

# Over the top ... and what do we do with that?

This was harder than I imagined. On the previous jam that I participated in, I got the idea almost immediately after hearing the theme, but this time, nothing.

We moved back into S7 and got to brainstorming. Mountains have tops! You can be thrown overboard on a ship? Maybe something with some clothes? What about computer windows? That could work...

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

Okay, that works out pretty well. Could we make a puzzle platformer with that? *And that is the origin of the Window Wizard concept*.


{{< figure
  src="/posts/gamejammin/images/window_wizard_v0.gif"
  alt="GameJam banner"
  caption="Awesome super high definition example of the game we will be building. Thank you to bohemic_boy for creating this awesome animation."
  class="ma0 w-75"
>}}

***I'd like to warn you that there may be spoilers ahead. If you want to play our game blind, please head over to [itoncek.itch.io/window-wizard](https://itoncek.itch.io/window-wizard) and play the game before continuing***

# How to make a Window Wizard
The mechanic is simple, you have three windows, obstacles are visible only in same-colored windows, you can only interact with visible obstacles.

The first order of business was to make *something* that worked. In the first 6 hours, we managed to make *something* that *mostly* worked.

{{< rawhtml >}} 
<figure class="ma0 w-75">
  <video width=100% controls>
    <source src="/posts/gamejammin/images/first_night_snapshot.webm" type="video/webm">
    Your browser does not support the video tag.  
  </video>
  <figcaption>
    <p>Last commit of the <i>"first day"</i>. The level is currently unfinishable, <b><i>but</i></b> it works!</p>
  </figcaption>
</figure>
{{< /rawhtml >}}

This is what we have woken up (me personally at 11:00) on the second day to. The second day is *the boring one*. We had polished the rendering engine, @bohemic_boy did his magic on the graphics and level design and at the end of the second day, we had something technically publishable.

{{< rawhtml >}} 
<figure class="ma0 w-75">
  <video width=100% controls>
    <source src="/posts/gamejammin/images/second_night_snapshot.webm" type="video/webm">
    Your browser does not support the video tag.  
  </video>
  <figcaption>
    <p>Last commit of the <i>"second day"</i>. This game actually works <b>and</b> is fun to play, buuut...</p>
  </figcaption>
</figure>
{{< /rawhtml >}}

# The dreaded overlap issue

The game works now. Yaaaay 🎉.

But if you pay attention during the video, you might notice some platforms disappearing when they are "covered" by other windows.

We could leave it this way, but it makes the game a little clunky, as you need to juggle the windows to have all platforms visible or have faith in your window placement and jump without seeing the platforms.

This is caused by the way we render the scene. At instantiation (which will be described later in the final architecture chapter), we create three copies of the scene (red+all, green+all, blue+all) and assign each to its respective window. This means that the green window has zero clues about the red platform; therefore, it can’t render them.

I know it is a small detail, but it bothered me so much during the development, because it just looked weird. The window tint (colour overlay for red/green/blue windows) was originally added as an attempt to solve this issue, but it wasn't helping that much.

The idea came after the end of the second day. I was waiting with @madlain for the tram we wanted to take, and we were talking about this issue. Then it hit me. We need to create only one scene, then apply a crop to the colored platforms and then render them onto the windows. 

Looking back, I feel incredibly stupid for not thinking of this solution earlier, because it is so clean, so clever and above all, so simple.

That night, I went to bed excited for the last day. This time, I woke up around 10:00, and once I arrived at MS, I immediately started working on this change. It took almost exactly 90 minutes to implement this idea, and once I did, *without touching the levels*, I started the game and got greeted with this.

{{< rawhtml >}} 
<figure class="ma0 w-75">
  <video width=100% controls>
    <source src="/posts/gamejammin/images/solution_to_all_our_problems.webm" type="video/webm">
    Your browser does not support the video tag.  
  </video>
  <figcaption>
    <p>What? It works? Uuuu that looks soo coool!</p>
  </figcaption>
</figure>
{{< /rawhtml >}}

I think I can describe the feeling I got when I first saw it working, only using my pull request, where I merged this feature into the main branch.

{{< figure
  src="/posts/gamejammin/images/solution_to_all_our_problems.png"
  alt="GameJam banner"
  caption="Merge commit for the seamless window feature. You can sense the importance just from the title."
  class="ma0 w-75"
>}}

Other than this, the last day was dedicated to level design and polishing. In total, this game contains five levels, slowly ramping up in difficulty. We've managed to get some tester feedback and generally polished everything we could think about.

Lastly, I've designed a cover and an icon and shipped it off to [itch.io](https://itoncek.itch.io/window-wizard).

# Window Wizard and Window Manager
So... how does it actually work?

All the levels are built using primitive templating technology. You create the layout in the editor. Then, at runtime, the scene gets finalised with remaining objects, such as cameras, tintboxes (the things that apply colour to the windows) and other unnecessary things. 

Template scene has the `SceneTemplate.cs` as the root. The root node then has numerous inputs for different things we'd need access to when finalising at runtime. Notably, we have three groups of nodes, each one is associated with one colour layer, which determine what should be cropped. Also at this stage, we specify the initial position of all windows.

{{< figure
  src="/posts/gamejammin/images/templating.png"
  alt="Preview of the templating view in Godot"
  caption="Preview of the template inside Godot."
  class="ma0 w-75"
>}}

The windowing effect is achieved, you guessed it, ***using windows***. At level instantiation, `WindowManager.cs` spawns three/two windows and assigns them subviewports linked to the main scene. This way, the windows can independently render different parts of the scene. 

The magic (disappearing platforms) happens using a shader and a clever trick. For each colour layer, we create a [CanvasGroup](https://docs.godotengine.org/en/stable/classes/class_canvasgroup.html) node with a magic material, which takes `rect_min` and `rect_max` as parameters and makes things outside this rectangle transparent. 

As for the collisions, they are handled using a clever trick. Instead of the platforms doing the disappearing, it is the player who decides what to collide with based on the windows it is currently visible in. This introduces a weird effect: when a window is placed over half of an obstacle vertically, it causes the wizard to "jump" up and down, as it gets the physics nudge upwards only when it enters the relevant window, but doesn't "feel" anything when outside of it.

# The aftermath

So this was a long blog post, wasn't it...

During the week after this game jam, I played some of the other games and watched as reviews for Window Wizard came in. 

The comments were all praising the game, but the review said otherwise. I was expecting lower ratings, as this was our first jam, and #33 was pretty nice. I was very happy that we scored high in Innovation (with an average of 4.1 stars) and Fun (3.9 stars).

{{< figure
  src="/posts/gamejammin/images/results.png"
  alt="GameJam banner"
  caption="Score given by other participants to our game."
  class="ma0 w-75"
>}}

Seeing this table, I didn't expect anything from the final results from the judges. I certainly did not expect that our game **WON?!**

{{< figure
  src="/posts/gamejammin/images/victory_pic2.jpg"
  alt="GameJam banner"
  caption="Me and @madlain after the announcement."
  class="ma0 w-75"
>}}

I, in my infinite wisdom, went for dinner before coming to the party, and one of our prizes was a paid dinner at that place. Rest assured, I've eaten as much as I could and enjoyed every single bite.

# Epilogue

It has been almost two months. I still can't believe that we managed to pull that off. It has been amazing to develop with that team, and I can't wait to attend the next game jam in the autumn. 

Thank you to all the members of the team (@madlain, @equist, @bohemic_boy), to all the testers who played our game (either in person or online) and thank **you** for reading this post.

{{< rawhtml >}} 
<p align="right">
- Toncek
</p>
{{< /rawhtml >}}