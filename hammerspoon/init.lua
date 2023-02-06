keyDelay = hs.eventtap.keyRepeatInterval() -- Read system delay between key repeat

function lineBeginning()
    hs.eventtap.keyStroke({"cmd"}, "left", keyDelay)
end

function lineEnd()
    hs.eventtap.keyStroke({"cmd"}, "right", keyDelay)
end

function up()
    hs.eventtap.keyStroke({}, "up", keyDelay)
end

function down()
    hs.eventtap.keyStroke({}, "down", keyDelay)
end

function left()
    hs.eventtap.keyStroke({}, "left", keyDelay)
end

function right()
    hs.eventtap.keyStroke({}, "right", keyDelay)
end

function deleteNextChar()
    hs.eventtap.keyStroke({}, "forwarddelete", keyDelay)
end

function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        -- Map Ctrl+J to Escape in Xcode and JetBrains IDEs
        -- 
        -- It is currently not possible to map the escape key in Xcode, without making a hacky
        -- plugin[1].
        -- JetBrains IDEs do support mapping the escape key through IdeaVim, however, there is
        -- a bug when specifically mapping Ctrl+J to escape[2].
        -- [1] https://bryce.co/xcode-vim-map/
        -- [2] https://youtrack.jetbrains.com/issue/VIM-2243/CtrlJ-does-not-dismiss-autocomplete-box-when-remapped-to-Esc
        if (appName == "Xcode" or appName == "IntelliJ IDEA" or appName == "AppCode") then
            -- enable your custom bindings here
            hs.hotkey.bind({"ctrl"}, "j", function()
                hs.eventtap.keyStroke({}, "escape")
            end)
        end
        
        -- Emacs keybindings in Word
        if (appName == "Microsoft Word") then
            hs.hotkey.bind({"ctrl"}, "a", lineBeginning, nil, lineBeginning)
            hs.hotkey.bind({"ctrl"}, "e", lineEnd, nil, lineEnd)
            hs.hotkey.bind({"ctrl"}, "n", down, nil, down)
            hs.hotkey.bind({"ctrl"}, "p", up, nil, up)
            hs.hotkey.bind({"ctrl"}, "f", right, nil, right)
            hs.hotkey.bind({"ctrl"}, "b", left, nil, left)
            hs.hotkey.bind({"ctrl"}, "d", deleteNextChar, nil, deleteNextChar)
        end
    end

    -- if (eventType == hs.application.watcher.deactivated) then
    --     if (appName == "Xcode") then
    --         -- disable your custom bindings here
    --     end
    -- end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
