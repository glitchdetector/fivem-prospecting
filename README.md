# Prospecting
#### A prospecting mini-game handler for FiveM. Allows resources to control via an API.

![](https://cdn.tycoon.community/rrerr/pwq1q.png)

## Synopsis

Ever wanted to look for treasure under the ground? With this prospecting mini-game you can do just that!

Get your metal detectors ready and go on an adventure, alone or with all of your friends!

You can have a stroll on the beach by yourself looking for lost items, or fight against your friends in a competitive environment!

## Note

This resource is just a handler, it will not work without a controlling resource.

An example controller can be found here: https://github.com/glitchdetector/fivem-prospecting-example

## Features
* Scan for stuff under the ground
* Audio and visual indicators
* Built-in support for multiple languages
* Instructional Buttons integration
* Allows other resources to interact with it
* Handles all of the complicated things, leaving it simple to integrate
* A custom metal detector prop
* Multiplayer support
* Automatically synced locations

## Resource Installation
* Download the repository
* Put the `prospecting` folder in your resources directory
* Add `ensure prospecting` to your server config

## Dependencies
| Resource | Description | Download |
|----------|-------------|----------|
| Multilingual | Allows the system to use the players configured game language. | https://github.com/glitchdetector/fivem-multilingual |
| Instructional Buttons | Shows what buttons do what action at any given time. | https://github.com/glitchdetector/fivem-instructional-buttons |
| Any controller | One or more resources that controls this mini-game | Example provided above |

## Developers

Since this resource does nothing by itself, it's up to you developers to implement it within your own systems and frameworks.

To control the Prospecting mini-game, you need to use exports or the server script `interface.lua`

Preferred method is the `interface.lua` script and will be covered here.

### Setup

In your resource manifest, add the following entries:

```lua
dependencies {'prospecting'}
server_script '@prospecting/interface.lua'
```

Your server scripts can now access the `Prospecting` object

### Prospecting Interface

#### AddTarget `(x, y, z, data)`
Adds a location that a player can prospect for.

| Parameter | Description |
|-----------|-------------|
| x, y, z | The coordinates |
| data | Data that is sent back in the Pickup handler when the target is picked up by a player. Can be anything. |

#### AddTargets `(list)`
Adds a list of locations at once.

| Parameter | Description |
|-----------|-------------|
| list | An array/list/table with tables containing an `x`, `y`, `z` and `data` property |

#### StartProspecting `(player)`
Make the player to start prospecting.

| Parameter | Description |
|-----------|-------------|
| player | The server id of the player |

#### StopProspecting `(player)`
Make the player to stop prospecting.

| Parameter | Description |
|-----------|-------------|
| player | The server id of the player |

#### IsProspecting `(player)`
Returns wether the player is currently prospecting.

| Parameter | Description |
|-----------|-------------|
| player | The server id of the player |

#### SetDifficulty `(modifier)`
Sets the scanning difficulty modifier.


| Parameter | Default | Description |
|-----------|---------|-------------|
| modifier | 1.0 | The difficulty modifier, higher means you must be closer for the scanner to pick it up. Distance to target is multiplied by this number, so 2.0 means you need to be half the distance away to begin picking the targets up. |

**Note:** This is set per controller, meaning each controller can have different difficulties. Only targets made by this controller will have this difficulty.

#### OnStart `(handler(player))`
Adds a function to be called when a player starts prospecting.

| Parameter | Description |
|-----------|-------------|
| handler | A function that is called with a `player` parameter |
| player | The player that started prospecting |

**Note:** This will trigger even if another controller caused the player to start prospecting.

#### OnStop `(handler(player, time))`
Adds a function to be called when a player stops prospecting.

| Parameter | Description |
|-----------|-------------|
| handler | A function that is called with a `player` and `time` parameter |
| player | The player that stopped prospecting |
| time | How long the player was prospecting for in milliseconds (game time) |

**Note:** This will trigger even if another controller caused the player to stop prospecting.

#### SetHandler `(handler(player, data, x, y, z))`
Adds a function to be called when a player collects a target (by digging).

| Parameter | Description |
|-----------|-------------|
| handler | A function that is called with `player`, `data`, `x`, `y`, `z` parameters |
| player | The player that found the target |
| data | The data that was supplied when creating the target |
| x, y, z | The coordinates where they found the target |

**Note:** This will only trigger for targets added by this controller.

### Example
```lua
-- Default difficulty
Prospecting.SetDifficulty(1.0)

-- Add a few things for the player to find
Prospecting.AddTarget(1548.082, 6633.096, 2.377085, "Nuts and Bolts")
Prospecting.AddTargets({
    {x = 1600.185, y = 6622.714, z = 15.85106, data = "Bones"},
    {x = 1580.016, y = 6547.394, z = 15.96557, data = "Dragon Scales"},
})

Prospecting.SetHandler(function(player, data, x, y, z)
    -- The player collected something
    TriggerClientEvent("chatMessage", player, "You found " .. data .. "!")
end)

Prospecting.OnStart(function(player)
    -- The player started prospecting
    TriggerClientEvent("chatMessage", player, "Started prospecting")
end)

-- time in milliseconds
Prospecting.OnStop(function(player, time)
    -- The player stopped prospecting
    TriggerClientEvent("chatMessage", player, "Stopped prospecting")
end)

RegisterCommand("prospect", function(player, _, _)
    -- Toggle prospecting
    if Prospecting.IsProspecting(player) then
        Prospecting.StopProspecting(player)
    else
        Prospecting.StartProspecting(player)
    end
end)
```

A complete resource example can be found at https://github.com/glitchdetector/fivem-prospecting-example

## Credits
Script development by **[glitchdetector](https://github.com/glitchdetector)**

Metal Detector Model by **[Vartanyan](https://www.turbosquid.com/3d-models/3d-metal-detector/1138741)** (converted to RAGE format by glitchdetector)

Play testing by the **[Tycoon Gaming](https://discord.gg/tycoon)** community

## Disclaimer
Please refrain from remixing this resource.

PRs for improvements are very welcome!

You may include this as part of pack downloads, as long as it is not modified and a link to an up-to-date version is provided (such as this repository).

A copy of this README must also be present with re-distributions.

## License
[Attribution-NoDerivs 3.0 Unported (CC BY-ND 3.0)](https://creativecommons.org/licenses/by-nd/3.0/)

## Original Github Repository
https://github.com/glitchdetector/fivem-prospecting
