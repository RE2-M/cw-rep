Config = {}
Config.Debug = true                        -- Set to "true" to print debugging messages

Config.UpdateFrequency = 60*60                -- Seconds interval between removing values (no need to touch this)
Config.UseOxMenu = true                     -- set to "true" to use ox_lib menu instead of qb-menu
Config.SkillsTitle = "Skills & Rep"            -- Change this to label your skill system as you see fit.
Config.TypeCommand = true                   -- Set to "false" to disable the "/skills" command (or whatever word you set in the next function)
Config.Skillmenu = "skills"                 -- phrase typed to display skills menu (check readme.md to set to commit to radial menu)

-- Config.EmailWaitTimes = { min = 45000, max =  300000 }
Config.SendUpdateEmails = true -- if true, send emails when hitting the correct levels (if available)
Config.EmailWaitTimes = { min = 4500, max =  7000 }

Config.GenericMaxAmount = 10000 -- the max skill level. Can be overrided by adding maxLevel to any skill
Config.GenericIcon = 'fas fa-book'
Config.ShowNotificationOnSkillGain = false

Config.MinutesBetweenUpdates = 10 -- minutes between each server-to-database udpate
Config.HideSkillsWithZeroLevels = true -- Hide skills from the menu if you aren't on level 1

-- This function can be modified to fit whatever you want to show it. Only shows if the above is set to true.
-- The amount will come after the string that this function returns.
Config.SkillGainMessage = function(skillName, amount) 
    if not Config.Skills[skillName] then return "THIS SKILL DONT EVEN EXIST" end
    
    local isPositive = tonumber(amount) > 0
    local label = skillName
    if Config.Skills[skillName].label then 
        label = Config.Skills[skillName].label
    end

    if isPositive then 
        return label .. " increased: ".. tostring(amount) 
    else 
        return label .. " decreased: ".. tostring(amount)
    end

end 

Config.DefaultLevels = {
    { from = 0, to = 100 },
    { from = 100, to = 200 },
    { from = 200, to = 300 },
    { from = 300, to = 400 },
    { from = 500, to = 600 },
    { from = 600, to = 700 },
    { from = 800, to = 900 },
    { from = 900, to = 1000 },
}

Config.Skills = {
    riding = {
        label = 'Riding',
        icon = 'fas fa-house',
    },
    streetreputation = {
        label="Street Reputation",
        icon = 'fas fa-mask',
        skillLevels = {
            { title = "Unknown", from = 00, to = 1000 },
            { title = "Rookie", from = 1000, to = 2000 },
            { title = "Hustler", from = 2000, to = 3000 },
            { title = "Crimer", from = 3000, to = 4000 },
            { title = "Urban Enforcer", from = 5000, to = 6000 },
            { title = "Renagade", from = 6000, to = 7000 },
            { title = "Underboss", from = 8000, to = 9000 },
            { title = "Boss", from = 9000, to = 10000 }, 
        }
    },
    foodCrafting = {
        label= 'Food Crafting',
        icon = 'fas fa-hamburger',
    },
    gun_crafting = {
        icon = 'fas fa-gun',
        label = 'Weapon crafting',
    },
    crafting = {
        icon = 'fas fa-wrench',
        label = 'Crafting',
    },
    blacksmith = {
        icon = 'fas fa-wrench',
        label = 'blacksmith',
    },
    medical = {
        icon = 'fas fa-first-aid',
        label = 'Medical',
        messages = {
            { notify = true, level = 50, message = "They can call you Medical student" },
            { notify = true, level = 100, message = "Know You Are Resident Doctor" },
            { notify = true, level = 200, message = "You can choose you specialty. Doctor!" },
            { notify = true, level = 300, message = "My Mother have some ackes in his back could you help it Surgeon" },

        }
    },
    lockpicking = {
        icon = 'fas fa-unlock',
        label = 'Lockpicking',
        maxLevel = 350,
        messages = {
            { notify = true, level = 50, message = "You're not horrible with that lockpick anymore" },
            { notify = true, level = 100, message = "You start feeling better with that lockpick in your hand" },
            { notify = true, level = 200, message = "You're getting good with a lockpick" },
            { notify = true, level = 300, message = "You feel like you're nailing lockpicking now" },
            { notify = true, level = 350, message = "No tumbler will go untouched. You're like the Lockpicking Lawyer!" },
        }
    },
    delivery = {
        icon = 'fas fa-star',
        label = 'Food delivery job rep',
        messages = {
            { level = 50, message = "You're doing a great job", sender = "FeedStars HR", subject = "FeedStars" },
            { level = 100, message = "We just wanted to tell you that we love you! ❤", sender = "FeedStars HR", subject = "FeedStars" },
            { level = 220, message = "Keep up that delivering! ❤", sender = "FeedStars HR", subject = "FeedStars" },
            { level = 300, message = "You're a real Food STAR! ⭐", sender = "FeedStars HR", subject = "FeedStars" },
            { level = 500, message = "Do you even have a life?? Employee of the year!", sender = "FeedStars HR", subject = "FeedStars" },
        }
    },
    
}