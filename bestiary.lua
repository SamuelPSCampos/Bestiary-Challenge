-- Ensures the terminal uses UTF-8 (required for emojis)
os.execute("chcp 65001")

--==============================
-- BASE STAT LIMIT CONFIGURATION
--==============================

-- Maximum values used for stat normalization
local maxDamage = 100
local maxHealth = 200
local maxDefense = 75
local maxSpeed = 80
local maxIntelligence = 120

-- Characters used to draw the visual stat bars
local fullBlock = "⬜"
local emptyBlock = "⬛"
local maxBlock = 10 -- Maximum number of blocks per bar

--==============================
-- MONSTER DEFINITIONS
--==============================
-- Each monster contains:
-- - description: textual overview
-- - representation: emojis or icons
-- - stats: attributes scaled relative to the max values
--==============================

local monsters = {
    ["Mosburg"] = {
        description = "Fur covered crawler with a series of sharp spikes along its back.",
        representation = "🐛🌿",
        stats = {
            damage = maxDamage * 0.2,
            health = maxHealth * 0.4,
            defense = maxDefense * 0.2,
            speed = maxSpeed * 0.3,
            intelligence = maxIntelligence * 0.1,
        },
    },

    ["Mossmir"] = {
        description = "Small fluttering creature capable of defending itself with its small stinger.",
        representation = "🐛🌱",
        stats = {
            damage = maxDamage * 0.3,
            health = maxHealth * 0.3,
            defense = maxDefense * 0.15,
            speed = maxSpeed * 0.7,
            intelligence = maxIntelligence * 0.3,
        },
    },

    ["Massive Mossgrub"] = {
        description = "Unnaturally overgrown Mossgrub, bred within the Citadel's Memorium.",
        representation = "🐛🌳",
        stats = {
            damage = maxDamage * 0.6,
            health = maxHealth * 0.9,
            defense = maxDefense * 0.5,
            speed = maxSpeed * 0.2,
            intelligence = maxIntelligence * 0.2,
        },
    },

    ["Moss Mother"] = {
        description = "Adult Mossmir with fully developed stinger and hardened hide. A formidable boss.",
        representation = "🐛👑",
        stats = {
            damage = maxDamage * 0.8,
            health = maxHealth * 1.0,
            defense = maxDefense * 0.7,
            speed = maxSpeed * 0.6,
            intelligence = maxIntelligence * 0.5,
        },
    }
}

--==============================
-- FUNCTION: createBar
-- Creates a visual stat bar based on a value and its maximum.
-- Uses full and empty block characters to represent the proportion.
--==============================

local function createBar(value, maxValue)
    local filled = math.floor(value / maxValue * maxBlock) -- Number of filled blocks
    return fullBlock:rep(filled) .. emptyBlock:rep(maxBlock - filled)
end

--==============================
-- FUNCTION: monsterSheet
-- Builds a formatted monster sheet containing:
-- - Monster name and icon
-- - Description
-- - Visual stat bars
-- Returns a complete printable string.
--==============================

local function monsterSheet(name, info)
    return string.format([[
|================================
|   %s %s
|--------------------------------
|   %s
|--------------------------------
|        STATS
|        Damage:%s
|        Health:%s
|       Defense:%s
|         Speed:%s
|  Intelligence:%s
]],
        name, info.representation,
        info.description,
        createBar(info.stats.damage, maxDamage),
        createBar(info.stats.health, maxHealth),
        createBar(info.stats.defense, maxDefense),
        createBar(info.stats.speed, maxSpeed),
        createBar(info.stats.intelligence, maxIntelligence)
    )
end

--==============================
-- OUTPUT
-- Iterates through all monsters and prints their formatted sheets.
--==============================

for name, info in pairs(monsters) do
    print(monsterSheet(name, info))
end