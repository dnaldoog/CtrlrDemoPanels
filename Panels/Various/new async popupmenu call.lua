-- Modern, Non-Blocking PopupMenu Example for CtrlrX / JUCE 8
customMouseDown = function(comp, event)
    console("Opening modern popup menu...")

    -- 1. Construct Main Menu & Submenus
    local m  = PopupMenu()
    local sm = PopupMenu()

    -- Populate Submenu
    sm:addItem(10, "Submenu Item 1", true, false, Image())
    sm:addItem(11, "Submenu Item 2", true, false, Image())

    -- Populate Main Menu
    m:addItem(1, "Reset Controller State", true, false, Image())
    m:addItem(2, "Load Preset", true, false, Image())
    m:addSeparator()
    m:addSubMenu("Advanced Tools", sm, true, Image(), false, 0)
    m:addSectionHeader("Settings")
    m:addItem(3, "Toggle Dark Mode", true, true, Image())

    ------------------------------------------------------------------
    -- 2. Non-Blocking Async Execution
    -- Arguments: (itemIDThatMustBeVisible, minWidth, maxCols, itemHeight, callback)
    ------------------------------------------------------------------
    m:showAsync(0, 0, 0, 0, function(result)
        -- The callback executes automatically on the Message Thread when an item is selected
        if result == 0 then
            console("User dismissed menu without selecting anything.")
            return
        end

        console("Selected Menu Item ID: " .. result)

        if result == 1 then
            resetControllerState()
        elseif result == 2 then
            loadPresetFile()
        elseif result == 3 then
            toggleDarkMode()
        elseif result >= 10 and result <= 11 then
            handleSubmenuSelection(result)
        end
    end)

    -- Code continues executing immediately without waiting or freezing the UI
end