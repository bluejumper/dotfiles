-- xmonad.hs
import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import qualified XMonad.Hooks.ManageDocks as D

-- (Variables)
myModMask = mod4Mask
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myTerminal = "termite"
myApplicationLauncher = "dmenu_run"
myFileManager = "pcmanfm-qt"
myCalculator = "speedcrunch"

myBorderWidth = 2
myNormalBorderColor  = "#3A3A3A"
myFocusedBorderColor = "#B0B0B0"

-- (Behaviours)
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- (help text)
helpText :: String
helpText = unlines [
    "# Binds",
    "The modifier key is 'Super'.",
    "",
    "-- xmonad",
    "mod-ctrl-q         exit xmonad",
    "mod-ctrl-w         restart xmonad (having recompiled xmonad.hs)",
    "mod-shift-/        display help text",
    "",
    "-- locking and system state",
    "mod-ctrl-,         lock system",
    "mod-ctrl-.         lock system then suspend",
    "mod-ctrl-/         lock system then hibernate",
    "",
    "-- spawn programs",
    "mod-return         terminal",
    "mod-x              application launcher",
    "mod-e              file manager",
    "mod-s              calculator",
    "",
    "-- actions",
    "mod-[              adjust volume -5%",
    "mod-]              adjust volume +5%",
    "",
    "-- window",
    "mod-shift-q        close focused window",
    "mod-n              resize viewed windows to correct size",
    "mod-t              push window back into tiling",
    "",
    "mod-tab            move focus to next window",
    "mod-j",
    "mod-shift-tab      move focus to previous window",
    "mod-k",
    "mod-m              move focus to master window",
    "",
    "mod-shift-j        swap focused window with next window",
    "mod-shift-k        swap focused window with previous window",
    "mod-shift-m        swap focused window with master window",
    "",
    "mod-space          rotate through available layout algorithms",
    "mod-shift-space    reset workspace layout algorithm to default",
    "",
    "mod-h              shrink master area",
    "mod-l              expand master area",
    "",
    "mod-,              decrement no. of windows in master area",
    "mod-.              increment no. of windows in master area",
    "",
    "-- general",
    "mod-b              toggle status bar gap",
    "",
    "-- workspaces",
    "mod-[1..9]         switch to workspace 1..9",
    "mod-shift-[1..9]   move window to workspace 1..9",
    "",
    "-- mouse",
    "mod-leftMouse      set selected window to floating and begin movement by mouse",
    "mod-middleMouse    raise selected window to top of stack",
    "mod-rightMouse     set selected window to floating and begin resizing by mouse"
    ]

-- (Bindings)
-- keyboard
-- symbolic KeySym names or values can be used.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ 
    -- xmonad
    ((modm .|.          controlMask,    xK_q), io (exitWith ExitSuccess)) -- exit xmonad
    , ((modm .|.        controlMask,    xK_w), spawn "xmonad --recompile && xmonad --restart") -- restart xmonad
    , ((modm .|.        shiftMask,      xK_slash), spawn ("echo \"" ++ helpText ++ "\" | xmessage -file -")) -- display help text with xmessage

    -- locking and system state
    , ((modm .|.        controlMask,    xK_comma), spawn "physlock -sp \";pvlrf/\"") -- lock system
    , ((modm .|.        controlMask,    xK_period), spawn "physlock -dsp \"wb & bw.\" && systemctl suspend") -- lock system then suspend
    , ((modm .|.        controlMask,    xK_slash), spawn "physlock -dsp \"wb & bw.\" && systemctl hibernate") -- lock system then hibernate

    -- spawn programs
    , ((modm,                           xK_Return), spawn $ XMonad.terminal conf) -- terminal
    , ((modm,                           xK_x), spawn myApplicationLauncher) -- application launcher
    , ((modm,                           xK_e), spawn myFileManager) -- file manager
    , ((modm,                           xK_s), spawn myCalculator) -- calculator

    -- actions
    , ((modm,                           xK_bracketleft), spawn "pactl set-sink-volume 0 -5%") -- adjust volume -5%
    , ((modm,                           xK_bracketright), spawn "pactl set-sink-volume 0 +5%") -- adjust volume +5%

    -- window
    , ((modm .|.        shiftMask,      xK_q), kill) -- close focused window
    , ((modm,                           xK_n), refresh) -- resize viewed windows to correct size
    , ((modm,                           xK_t), withFocused $ windows . W.sink) -- push window back into tiling
    -- window focus
    , ((modm,                           xK_Tab), windows W.focusDown) -- move focus to next window
    , ((modm .|.        shiftMask,      xK_Tab), windows W.focusUp) -- move focus to previous window
    , ((modm,                           xK_j), windows W.focusDown) -- move focus to next window
    , ((modm,                           xK_k), windows W.focusUp) -- move focus to previous window
    , ((modm,                           xK_m), windows W.focusMaster) -- move focus to master window
    -- window swapping
    , ((modm .|.        shiftMask,      xK_j), windows W.swapDown) -- swap focused window with next window
    , ((modm .|.        shiftMask,      xK_k), windows W.swapUp) -- swap focused window with previous window
    , ((modm .|.        shiftMask,      xK_m), windows W.swapMaster) -- swap focused window with master window
    -- window layout
    , ((modm,                           xK_space), sendMessage NextLayout) -- rotate through available layout algorithms
    , ((modm .|.        controlMask,    xK_space), setLayout $ XMonad.layoutHook conf) -- reset workspace layout algorithm to default
    -- window master area
    , ((modm,                           xK_h), sendMessage Shrink) -- shrink master area
    , ((modm,                           xK_l), sendMessage Expand) -- expand master area
    -- window master no.
    , ((modm,                           xK_comma), sendMessage (IncMasterN (-1))) -- decrement no. of windows in master area
    , ((modm,                           xK_period), sendMessage (IncMasterN 1)) -- increment no. of windows in master area

    -- general
    , ((modm,                           xK_b), sendMessage D.ToggleStruts) -- toggle status bar gap
    ]
    ++
    -- generate list of binds for:
    [
    ((mask .|. modm,                    key), windows $ f i)
        | (i, key) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9] -- mod-[1..9], switch to workspace 1..9
        , (f, mask) <- [(W.greedyView, 0), (W.shift, shiftMask)] -- mod-shift-[1..9], move window to workspace 1..9
    ]
    {-
    ++
    -- generate list of binds for:
    [
    ((modm .|. mask,                    key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..] -- mod-{w,e,r}, switch to physical/Xinerama screens 1, 2 or 3
        , (f, mask) <- [(W.view, 0), (W.shift, shiftMask)] -- mod-shift-{w,e,r}, move window to screen 1, 2 or 3
    ]
    -}

-- mouse 
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
   [
    -- mod-leftMouse, set selected window to floating and begin movement by mouse
      ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)) 
    -- mod-middleMouse, raise selected window to top of stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-rightMouse, set selected window to floating and begin resizing by mouse
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
   ]

-- (Layout hook)
-- You can specify and transform your layouts by modifying these values.
myLayoutHook = D.avoidStruts (tiled ||| Mirror tiled ||| Full)
    where
        tiled = Tall nmaster delta ratio -- This default tiling algorithm partitions the screen into two panes
        nmaster = 1 -- default number of windows in master pane
        ratio = 1/2 -- default proportion of screen occupied by master pane
        delta = 5/100 -- percent of screen to increment by when resizing panes

-- (Window management hook)
-- Execute actions and WindowSet manipulations when managing a new window.
myManageHook = composeAll
    [ className =? "SpeedCrunch" --> doFloat
    , className =? "Sxiv" --> doFloat
    , className =? myFileManager --> doFloat
    , className =? "Arandr" --> doFloat
    , className =? "Gpick" --> doFloat
    ]

-- (Event handling hook)
-- Defines a custom handler function for X events.
myEventHook = mempty

-- (Logging hook)
-- Perform an action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
myLogHook = return ()

-- (Startup hook)
-- Perform an action each time xmonad starts or is restarted with mod-q.
-- Used by eg. XMonad.Layout.PerWorkspace to initialise per-workspace layout choices.
-- TODO: spawn redshift here?
myStartupHook = return ()

-- A structure containing your configuration settings, overriding fields in the
-- default config. Any you don't override will use the defaults defined in
-- xmonad/XMonad/Config.hs
myConfig = D.docks $ def {
        -- variables
        terminal = myTerminal,
        modMask = myModMask,
        workspaces = myWorkspaces,
        borderWidth = myBorderWidth,
        normalBorderColor = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

        -- behaviours
        focusFollowsMouse = myFocusFollowsMouse,
        clickJustFocuses = myClickJustFocuses,

        -- bindings
        keys = myKeys,
        mouseBindings = myMouseBindings,

        -- hooks
        layoutHook = myLayoutHook,
        manageHook = myManageHook,
        handleEventHook = myEventHook,
        logHook = myLogHook,
        startupHook = myStartupHook
    } 

-- (xmonad)
main = xmonad myConfig -- main, run xmonad with myConfig.
