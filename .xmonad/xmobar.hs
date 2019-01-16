-- The Config data type
Config {
    -- X11 properties
    wmclass = "xmobar"
    , windowName = "xmobar"

    -- appearance
    , position = Top

    , font = "xft:Inconsolata-8"
    , additionalFonts = []

    , borderColor = "black"
    , border = TopB
    , bgColor = "black"
    , fgColor = "grey"
    , alpha = 255

    , textOffset = -1
    , textOffsets = []
    , iconOffset = -1
    , iconRoot = "."

    -- behaviour
    , lowerOnStart = True
    , pickBroadest = False
    , persistent = False
    , hideOnStart = False
    , allDesktops = True
    , overrideRedirect = True

    -- commands
    , commands =
                [ Run Cpu [
                    "-t", "cpu: <total>%"
                    , "-L", "12"
                    , "-H", "60"
                    , "--low", "green"
                    , "--high", "red"
                    ] 20
                , Run Memory [
                    "-t", "mem: <used>mB"
                    ] 50
                , Run Swap [
                    "-t", "swp: <usedratio>%"
                    ] 50
                , Run Wireless "wlp2s0" [
                    "-t", "<essid> <quality>"
                    , "-L", "30"
                    , "--low", "red"
                    ] 100
                , Run BatteryP ["BAT0"] [
                    "-t", "<acstatus>bat: <left>% <timeleft> <watts>W"
                    , "-L", "20"
                    , "-H", "80"
                    , "--low", "red"
                    , "--high", "green"
                    , "--"
                    , "-O", "<fc=green>ac </fc>"
                    , "-o", ""
                    ] 100
                , Run ThermalZone 0 [
                    "-t", "<temp>"
                    , "-H", "55"
                    , "--high", "red"
                    ] 50
                , Run CoreTemp [
                    "-t", "[<core0>,<core1>]"
                    ] 50
                , Run Volume "pulse" "Master" [
                    "-t", "vol: <volume>%"
                    ] 50
                , Run Com "uname" [
                    "-s", "-r"
                    ] "" -1
                , Run Date "%H:%M:%S" "date" 10
                ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = "%uname%}\
                \{%cpu% %memory% * %swap%        %pulse:Master% | %wlp2s0wi%        %thermal0%%coretemp%°C | %battery% | <fc=#ee9a00>%date%</fc> "
   }
