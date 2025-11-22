# Monster Sheet Viewer (Lua)

A simple Lua script that displays formatted monster sheets in the terminal using UTF-8 emojis and block-style stat bars (⬜⬛).

## Features
- Emoji-based monster icons  
- Text descriptions  
- Visual stat bars (⬜⬛)  
- Pure Lua, no dependencies  
- Easy to extend by editing the monster table  

UTF-8 output is enabled automatically using chcp 65001.

## Output Example

|================================
|   Mosburg 🐛🌿
|--------------------------------
|   Fur covered crawler with a series of sharp spikes along its back.
|--------------------------------
|        STATS
|        Damage:⬜⬛⬛⬛⬛⬛⬛⬛⬛⬛
|        Health:⬜⬜⬜⬜⬛⬛⬛⬛⬛⬛
...

## Adding Monsters

Add new monsters by extending the monsters table:

monsters["Example Name"] = {
    description = "Example creature.",
    representation = "🐾",
    stats = {
        damage = maxDamage * 0.5,
        health = maxHealth * 0.3,
        defense = maxDefense * 0.4,
        speed = maxSpeed * 0.6,
        intelligence = maxIntelligence * 0.2,
    },
}
