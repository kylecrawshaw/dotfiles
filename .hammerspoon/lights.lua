local lightsChooser = hs.chooser.new(function(choice)
    if not choice then; return; end 
    
    local results = hs.execute("mycli hue toggle '" .. choice["text"] .. "'", true):gsub('\n', '')
    hs.alert.show(results)
end)



hs.hotkey.bind(mash.lights, "[", function() 
    local results = hs.execute("mycli hue lights --json", true)
    choices = {}

    for key, value in pairs(hs.json.decode(results)) do
        if value["state"]["on"] then state = 'On'; else state = 'Off'; end
        table.insert(choices, {text=value["name"], subText="State: " .. state})
    end
    
    lightsChooser:searchSubText(true)
    lightsChooser:choices(choices)
    lightsChooser:show()
end)


local groupsChooser = hs.chooser.new(function(choice)
    if not choice then; return; end
    local results = hs.execute("mycli hue toggle-group '" .. choice["text"] .. "'", true):gsub('\n', '')
    hs.alert.show(results)
    print(results)
end)

hs.hotkey.bind(mash.lights, "]", function() 
    local results = hs.execute("mycli hue groups --json", true)
    choices = {}
    for key, value in pairs(hs.json.decode(results)) do
        if value["state"]["any_on"] then state = 'On'; else state = 'Off'; end
        table.insert(choices, {text=value["name"], subText="State: " .. state})
    end
    groupsChooser:searchSubText(true)
    groupsChooser:choices(choices)
    groupsChooser:show()


end)

hs.hotkey.bind(mash.lights, "'", function()
    local results = hs.execute("mycli hue toggle 'Kyles Office'", true):gsub('\n', '')
    hs.alert.show(results)
    print(results)
    
end)

hs.hotkey.bind(mash.lights, "0", function()
    local results = hs.execute("mycli hue toggle-group 'Living room'", true):gsub('\n', '')
    hs.alert.show(results)

    print(results)
    
end)
