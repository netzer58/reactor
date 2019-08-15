# ReactorControl
Minecraft Bigreactors Mod Control program for Computercraft

This is the first release it's written with a Bedrock GUI a programming API/Kit that a fellow named Oeed designed it's feature rich as Computercraft GUI Api's go and plenty Flashy. I'd like to thank Oeed Here for making the API so I can just focus on functionality and leave the drawing to him :D.

A link to Oeed's github http://github.com/oeed/

Lolmer's bigreactors script was an inspiration for this code and some of the configuration saving/peripheral methods even a few routines for temperture control we're either used or heavily modified to make this a reality. As such some of the comments are unchanged I give him props for the parts of his codebase I ended up using.

The project github for Ez-Nuke is here https://github.com/sandalle/minecraft_bigreactor_control

MysticT's Sync api is used to redirect output to several displays if connected this was unmodified useage of their code that is located at http://pastebin.com/wPtGKMam

#Features:
Should Theoretically support any number of reactors active or passively cooled (I tested with 4 active reactors and 56 endgame unattended design)

Output to any number of monitors connected by Wired Modem

Interface with and monitor EnderIO Cap Banks

Default option of monitoring internal RF buffers of turbines/reactors

Set a minimum Rf per tick rate to produce by 1k increments up to a theoretical limit of 1x10^9 Not that I recommend trying to hit that cap I think all but a select few systems would melt their processors/memory before getting there.

Debug logging to file

Set default rates for tempreture, min-max energy percentage, rf/tick rate, and turbine optimal speed

Manual control options for turbines/reactors togglable in each status page for the device

Set and unset manual configuration to switch back and forth to auto control

.options file based configuration for more granular control of specific devices

#Requirements:

For monitor display you will need a 4 by 5 block advanced monitor you can have more than one.
You will need to wire each turbine/reactor/monitor if not attached to the computer/EnderIO Cap Bank with wired modems wireless is not supported.

NOTE: The last device ID has first priority to the program as it's the first found by the peripheral methods if you want sequential organization with your devices take care to activate modems in proper order.

#Important: I uploaded this with a completely free and clear license to do whatever you want with this code, out of respect for the people who's work this builds upon please credit them if you re-release. I could care less if you credit me.
