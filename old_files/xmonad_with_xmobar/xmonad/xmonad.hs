-- IMPORTS

import qualified Data.Map as M
import Data.Monoid
-- Hooks

-- Layout modifiers

-- Utilities

import Graphics.X11.ExtraTypes.XF86 (xF86XK_AudioLowerVolume, xF86XK_AudioMute, xF86XK_AudioNext, xF86XK_AudioPlay, xF86XK_AudioPrev, xF86XK_AudioRaiseVolume, xF86XK_MonBrightnessDown, xF86XK_MonBrightnessUp)
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import qualified XMonad.StackSet as W
import XMonad.Util.NamedScratchpad as NS
import XMonad.Util.SpawnOnce

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
myTerminal = "st"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor = "#1d2330"

myFocusedBorderColor = "#118888"

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

--
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- launch a terminal
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf),
      ((mod1Mask, xK_Return), namedScratchpadAction myScratchPads "terminal"),
      -- launch dmenu
      ((modm, xK_r), spawn "rofi -show drun -theme ~/.config/rofi/config.rasi"),
      ((modm, xK_0), spawn "rofi -show window -theme ~/.config/rofi/config.rasi"),
      -- Custom Keybindings
      -- close focused window
      ((modm, xK_d), kill),
      -- Rotate through the available layout algorithms
      ((modm, xK_Tab), sendMessage NextLayout),
      -- , ((modm,               xK_Tab	), sendMessage NextLayout)

      --  Reset the layouts on the current workspace to default
      ((modm .|. shiftMask, xK_Tab), setLayout $ XMonad.layoutHook conf),
      -- ((modm .|. shiftMask, xK_Tab	), setLayout $ XMonad.layoutHook conf)

      -- Resize viewed windows to the correct size
      ((modm, xK_n), refresh),
      -- Move focus to the next window
      ((modm, xK_j), windows W.focusDown),
      ((modm, xK_l), windows W.focusDown),
      ((mod1Mask, xK_Tab), windows W.focusDown),
      -- Move focus to the previous window
      ((modm, xK_k), windows W.focusUp),
      ((modm, xK_h), windows W.focusUp),
      ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp),
      -- Move focus to the master window
      ((modm, xK_m), windows W.focusMaster),
      -- Swap the focused window with the next window
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      -- Swap the focused window with the previous window
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      -- Shrink the master area
      ((modm, xK_minus), sendMessage Shrink),
      -- Expand the master area
      ((modm, xK_equal), sendMessage Expand),
      -- Push window back into tiling
      ((modm, xK_w), withFocused $ windows . W.sink),
      ((modm, xK_f), sendMessage $ Toggle NBFULL),
      -- Toggle the status bar gap
      -- Use this binding with avoidStruts from Hooks.ManageDocks.
      -- See also the statusBar function from Hooks.DynamicLog.
      --
      -- , ((modm              , xK_space     ), sendMessage ToggleStruts)

      -- ScreenShot
      ((modm, xK_Print), spawn "scrot -z -q 100 -e 'mv $f ~/Pictures/Screenshot/'"),
      ((mod1Mask, xK_Print), spawn "scrot -z -q 100 -s -l mode=edge -e 'mv $f ~/Pictures/Screenshot/'"),
      ((0, xK_Print), spawn "scrot -z -u -b -q 100 -e 'mv $f ~/Pictures/Screenshot/'"),
      -- XF86 keyboards
      ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume 0 +5%"),
      ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume 0 -5%"),
      ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
      ((0, xF86XK_MonBrightnessUp), spawn "brightnessctl s 10%+"),
      ((0, xF86XK_MonBrightnessDown), spawn "brightnessctl s 10%-"),
      -- Quit xmonad
      ((modm .|. controlMask, xK_q), io (exitWith ExitSuccess)),
      ((modm .|. shiftMask, xK_q), spawn "sh -c ~/.config/rofi/lock.sh"),
      -- Restart xmonad
      ((modm .|. shiftMask, xK_r), spawn "xmonad --recompile; xmonad --restart"),
      -- Run xmessage with a summary of the default keybindings (useful for beginners)
      ((modm .|. shiftMask, xK_slash), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
      ++
      --
      -- mod-[1..8], Switch to workspace N
      -- mod-shift-[1..8], Move client to workspace N and change focus to it
      --
      [ ((modm, k), windows $ W.greedyView i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      ]
      ++ [ ((modm .|. shiftMask, k), windows $ W.greedyView i . W.shift i)
         | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
         ]
      ++
      --
      -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
      -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
      --
      [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_i, xK_o, xK_p] [0 ..],
        (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1),
        ( \w ->
            focus w
              >> mouseMoveWindow w
              >> windows W.shiftMaster
        )
      ),
      -- mod-button2, Raise the window to the top of the stack
      ((modm, button2), (\w -> focus w >> windows W.shiftMaster)),
      -- mod-button3, Set the window to floating mode and resize by dragging
      ( (modm, button3),
        ( \w ->
            focus w
              >> mouseResizeWindow w
              >> windows W.shiftMaster
        )
      )
      -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = mkToggle (NOBORDERS ?? NBFULL ?? EOT) (monadtall ||| monadthreecol ||| monadwide ||| qtilemax)
  where
    -- default tiling algorithm partitions the screen into two panes
    monadtall = gaps [(U, 0), (D, 5), (L, 5), (R, 5)] $ spacing gap $ Tall nmaster delta ratio

    monadthreecol = gaps [(U, 0), (D, 5), (L, 5), (R, 5)] $ spacing gap $ ThreeColMid nmaster delta tclratio

    monadwide = gaps [(U, 0), (D, 5), (L, 5), (R, 5)] $ spacing gap $ Mirror (Tall nmaster delta ratio)

    qtilemax = gaps [(U, 0), (D, 5), (L, 5), (R, 5)] $ spacing gap $ Full

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2
    tclratio = 4 / 10

    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100

    -- Define the size of the gaps between windows
    gap = 5

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook =
  composeAll
    [ doF W.swapDown,
      className =? "confirm" --> doFloat,
      className =? "file_progress" --> doFloat,
      className =? "dialog" --> doFloat,
      className =? "download" --> doFloat,
      className =? "error" --> doFloat,
      className =? "Gimp" --> doFloat,
      className =? "notification" --> doFloat,
      className =? "toolbar" --> doFloat,
      title =? "scratchpad" --> doFloat,
      className =? "discord" --> doShift (myWorkspaces !! 7),
      className =? "Spotify" --> doShift (myWorkspaces !! 8),
      className =? "Brave-browser" --> doShift (myWorkspaces !! 2),
      isFullscreen --> doFullFloat
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook

--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

--
--
--
------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
  -- spawnOnce "~/.fehbg"
  spawnOnce "nitrogen --restore"
  spawnOnce "picom -f"

-- spawnOnce "polybar"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

--
-- Scratch Pad
--
myScratchPads = [NS "terminal" spawnTerm findTerm manageTerm]
  where
    spawnTerm = myTerminal ++ " -T scratchpad"
    findTerm = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
      where
        h = 0.5
        w = 0.6
        t = 0.7 - h
        l = 0.8 - w

--

--
-- Command to launch the bar.
myBar = "xmobar -x 0"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP =
  xmobarPP
    { ppCurrent = xmobarColor "#009999" "" . wrap "[" "]",
      ppVisible = xmobarColor "#007777" "",
      ppHidden = xmobarColor "#b998d0" "" . wrap "" "",
      ppHiddenNoWindows = xmobarColor "#282738" "",
      ppTitle = xmobarColor "#99aaaa" "" . shorten 70,
      ppSep = "<fc=#2b3338> | </fc>",
      ppLayout = xmobarColor "#99aaaa" "",
      ppUrgent = xmobarColor "#262626" "" . wrap "!" "!",
      ppOrder = \(ws : l : t : ex) -> [ws, l] ++ ex ++ [t]
    }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_space)

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults =
  def
    { -- simple stuff
      terminal = myTerminal,
      focusFollowsMouse = myFocusFollowsMouse,
      clickJustFocuses = myClickJustFocuses,
      borderWidth = myBorderWidth,
      modMask = myModMask,
      workspaces = myWorkspaces,
      normalBorderColor = myNormalBorderColor,
      focusedBorderColor = myFocusedBorderColor,
      -- key bindings
      keys = myKeys,
      mouseBindings = myMouseBindings,
      -- hooks, layouts
      layoutHook = myLayout,
      manageHook = myManageHook <+> manageDocks,
      handleEventHook = myEventHook,
      logHook = myLogHook,
      startupHook = myStartupHook
    }

-- | A copy of the default bindings in simple textual tabular format.
help :: String
help =
  unlines
    [ "The modifier key is the 'windows key'. Keybindings:",
      "",
      "-- launching and killing programs",
      "mod-Shift-Enter  Launch xterminal",
      "mod-p            Launch dmenu",
      "mod-Shift-p      Launch gmrun",
      "mod-Shift-c      Close/kill the focused window",
      "mod-Space        Rotate through the available layout algorithms",
      "mod-Shift-Space  Reset the layouts on the current workSpace to default",
      "mod-n            Resize/refresh viewed windows to the correct size",
      "",
      "-- move focus up or down the window stack",
      "mod-Tab        Move focus to the next window",
      "mod-Shift-Tab  Move focus to the previous window",
      "mod-j          Move focus to the next window",
      "mod-k          Move focus to the previous window",
      "mod-m          Move focus to the master window",
      "",
      "-- modifying the window order",
      "mod-Return   Swap the focused window and the master window",
      "mod-Shift-j  Swap the focused window with the next window",
      "mod-Shift-k  Swap the focused window with the previous window",
      "",
      "-- resizing the master/slave ratio",
      "mod-h  Shrink the master area",
      "mod-l  Expand the master area",
      "",
      "-- floating layer support",
      "mod-t  Push window back into tiling; unfloat and re-tile it",
      "",
      "-- increase or decrease number of windows in the master area",
      "mod-comma  (mod-,)   Increment the number of windows in the master area",
      "mod-period (mod-.)   Deincrement the number of windows in the master area",
      "",
      "-- quit, or restart",
      "mod-Shift-q  Quit xmonad",
      "mod-q        Restart xmonad",
      "mod-[1..8]   Switch to workSpace N",
      "",
      "-- Workspaces & screens",
      "mod-Shift-[1..8]   Move client to workspace N",
      "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
      "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
      "",
      "-- Mouse bindings: default actions bound to mouse events",
      "mod-button1  Set the window to floating mode and move by dragging",
      "mod-button2  Raise the window to the top of the stack",
      "mod-button3  Set the window to floating mode and resize by dragging"
    ]
