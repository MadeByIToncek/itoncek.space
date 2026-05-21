{
    "title": "Is Godot *the* tool for overlays?",
    "date": "2025-03-02T20:00:00+01:00",
    "draft": false,
    "cover": {
        "image":"/posts/is-godot-the-tool-for-overlays/images/ift7-weather.jpg",
        "alt": "Screenshot from IFT-7' Weather forecast bit",
        "caption": "Weatherman IToncek in his natural habitat",
        "relative": false
    },
    "categories": [
      "Cool stuff"
    ],
    "tags": ["Streaming", "Godot", "Development"]
}

So, I've been broadcasting for the past four years. Not regularily, but often. One thing, that I struggled with from the beginning was the overlays. 

[At first](https://github.com/MadeByIToncek/StarshipTools), I was using Java with javax.Swing and luma-keying the black background out in OBS. This worked but was kinda unstable and not really smooth. Swing is not made for realtime graphics, especially not at the Full-HD scale and it was lagging a lot. Even with these issues, I've still managed to deploy it for two broadcasts ([one](https://www.youtube.com/live/n0tpj6mC9RQ) and [two](https://youtu.be/4wju-RMFVp8)) and it worked pefectly.

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/first_broadcast.jpg"
  alt="Picture from the second stream"
  caption="Picture from the second stream"
  class="ma0 w-75"
>}}

On stream, this looks really nice, as all the graphics change colors in-sync. This is done using multiple windows with StarshipTools, as you can see below:

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/StarshipTools.jpg"
  alt="StarshipTools windows demo"
  caption="How I see & control the overlay during the broadcast."
  class="ma0 w-75"
>}}

You can see a few remnants from previous iterations, like the event bar at the top, which essentially does nothing in the final release, as it was half-baked at the time of the broadcast and after it, there was no need to finish it.

All of this was for the IFT-1 launch. After Starship launched, it took **half a year** until the next launch and **one and a half years** until the next broadcast.

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/ift5.jpg"
  alt="Screenshot from IFT-5"
  caption="Flight 5 stream"
  class="ma0 w-75"
>}}

The next broadcast (IFT-5) was [broadcasted](https://youtube.com/live/4G-j2qggqjg) on iQLANDIA's channel with Martin Gembec and it was a lot of fun doing live, but as for the technology, it was primitive and rudimentary. 

I've written a [simple application](https://github.com/MadeByIToncek/StarshipOverlay), that hosts a webserver, where a simple frontend is hosted. This can be added to OBS using a Browser source and works allright, but I'm really bad with writing HTML and basically unable to do anything cooler than a simple text overlay in HTML.

The same overlay was used for the [broadcast](https://youtube.com/live/KUJS9QQEoJQ?feature=share) of Flight 7. But here, everything changes.

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/ift7.jpg"
  alt="Screenshot from IFT-7"
  caption="Flight 7 stream"
  class="ma0 w-75"
>}}

First, I've acquired a greenscreen. I've been thinking about this for a long time and this time, I felt it was time to transfer to greenscreen production. Looking back, I should've hung it in landscape as I didn't have that much space around me. But primarily, I've (for the first time) used Godot for something broadcast-related.

I've been inspired by NasaSpaceFlight's weather forecast (Ryan the weather man 🌤) so I [made my own](https://github.com/MadeByIToncek/weather_station). It took me about two days to finish this project (for reference, previous projects took me usually more than a week), and it was really smooth in the transitions.

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/ift7-weather.jpg"
  alt="Screenshot from IFT-7' Weather forecast bit"
  caption="Weatherman IToncek in his natural habitat"
  class="ma0 w-75"
>}}

This was the last broadcast I made *as of writing this post*. But this doesn't stop me from leaking, what's coming. It's public anyway so it doesn't matter and you wouldn't steal my ideas, right?

For an upcoming stream with iQLANDIA, I've made an [app](https://github.com/MadeByIToncek/iQL-Questionare) in Godot, which really underpins the advantage of Godot for broadcast development.

It's a simple app, which basically monitors a selected YouTube chat and if a message comes in, that contains only a number (like "1", "2", "3" or "4"), it adds it to an internal counter and updates a graph. It also has an editor mode, question handling and really nice animated transitions. 

Also a big thing for me, developing these tools: **TRANSPARENCY**. Let me explain.

Using javax.Swing had one big issue. The background had to be removed in OBS as javax.Swing doesn't work with transparent backgrounds (at least I couldn't find how). 

This was somehow solved by the move to HTML, which supports transparency in OBS, but that had other issues:
1. I'm bad at writing HTML
2. I'm bad at writing CSS
3. That's it, I'm just bad at webdesign

So what is the solution? Godot's UI system. You can set Godot to transparent background and the UI system is really intuitive to develop in, it runs on C#, so you can do really anything in there and generally, it just works.

{{< figure
  src="/posts/is-godot-the-tool-for-overlays/images/questionare_demo.jpg"
  alt="Demo of the questionare tool"
  caption="Demo of the questionare tool. Mixed in OBS Studio, designed in Godot"
  class="ma0 w-75"
>}}

So that's it, that's how I do my stuff. Thanks for reading until the end, sorry for any spelling/grammar mistakes and have a nice day 👋

UPDATE (16.3.): Small reminder for anyone trying to use my stuff for commercial/non-commercial usecases. Please read the README.MD file of the project before using. There are some rules to keep in mind while running this software in production/development environment. 