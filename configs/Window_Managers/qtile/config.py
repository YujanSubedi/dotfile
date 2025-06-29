#                    #
# #                # #
# # #  S O F:    # # #
# #                # #
#                    #

# # #  Imports:  # # #

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match
from libqtile.config import Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

import os
import subprocess

# # # StartUp scripts: # # #


@hook.subscribe.startup_once
def start_once():
    startup_script = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.run([startup_script])
    qtile.groups_map["2"].cmd_toscreen()
    # qtile.cmd_hide_show_bar('all')


# # # Defaults: # # #

mod = "mod4"
terminal = "ghostty"
# browser = "firefox"

# Screenshots Commands #
full_screen_ss = "scrot -z -q 100 -e 'xclip -selection clipboard -target image/png $f && mv $f ~/Pictures/Screenshots/'"
window_ss = "scrot -z -u -b -q 100 -e 'xclip -selection clipboard -target image/png $f && mv $f ~/Pictures/Screenshots/'"
select_ss = "scrot -z -q 100 -s -l mode=edge -e 'xclip -selection clipboard -target image/png $f && mv $f ~/Pictures/Screenshots/'"

# # # KeyBindings: # # #

keys = [

    # lunch terminal #
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key(['mod1'], "Return", lazy.group['scratchpad'].dropdown_toggle('term')),

    # Run rofi to run program #
    Key([mod],
        "r",
        lazy.spawn("rofi -show drun"),
        desc="Spawn a cmd menu"),
    Key([mod],
        "0",
        lazy.spawn("rofi -show window"),
        desc="Show all tabs"),

    # Emacs
    Key([mod], "i", lazy.spawn("emacs"), desc="Spawn a cmd menu"),

    # Navigate Window #
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key(["mod1"],
        "Tab",
        lazy.group.next_window(),
        desc="Move window focus to next"),

    # Change size of window #
    Key([mod],
        "Minus",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window'),
    Key([mod],
        "Equal",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window'),
    # Key(["mod1"], "Down", lazy.layout.shrink(),
    #     lazy.layout.decrease_nmaster(), desc='Shrink window'),
    # Key(["mod1"], "Up", lazy.layout.grow(),
    #     lazy.layout.increase_nmaster(), desc='Expand window'),

    # Reset the size of window #
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Change Window position in workspace #
    Key([mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "Down",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Toggle bar and fullscreen #
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "w", lazy.window.disable_floating()),
    Key([mod], "space", lazy.hide_show_bar(),
        desc="Toggle the Bar visibality"),

    # Change layouts #
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"],
        "Tab",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='flip master and stack'),

    # Kill the window #
    Key([mod], "d", lazy.window.kill(), desc="Kill focused window"),
    Key(["mod1"], "F4", lazy.window.kill(), desc="Kill focused window"),

    # lock screen, log out and restart qtile #
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.spawn("sh -c ~/.config/qtile/scripts/lock.sh")),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Screenshot #
    Key([], "Print", lazy.spawn(window_ss), desc="screeshot current window"),
    Key([mod],
        "Print",
        lazy.spawn(full_screen_ss),
        desc="screeshot full screen"),
    Key(["mod1"],
        "Print",
        lazy.spawn(select_ss),
        desc="screeshot selected portion"),

    # # XF86 commands # #
    # audio #
    Key([],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume 0 +5%"),
        desc='Volume Up'),
    Key([],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume 0 -5%"),
        desc='volume down'),
    Key([],
        "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
        desc='Toggle mute'),

    # naviagte through player #
    # Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),
    #     desc='playerctl'),
    # Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"),
    #     desc='playerctl'),
    # Key([], "XF86AudioNext", lazy.spawn("playerctl next"),
    #     desc='playerctl'),

    # brightness #
    Key([],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl s 5%+"),
        desc='brightness UP'),
    Key([],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl s 5%-"),
        desc='brightness Down'),
]

# # # Groups : # # #

groups = [
    Group("1", label=""),
    Group("2", label=""),
    Group("3", label="", matches=Match(wm_class=["brave-browser"])),
    Group("4", label=""),
    Group("5", label=""),
    Group("6", label=""),
    Group("7", label=""),
    Group("8", label="", matches=Match(wm_class=["discord"])),
    Group("9", label="", matches=Match(wm_class=["spotify"])),
    ScratchPad("scratchpad", [
        DropDown("term",
                 terminal,
                 x=0.12,
                 y=0.04,
                 width=0.8,
                 height=0.8,
                 opacity=1,
                 on_focus_lost_hide=False)
    ])
]

# Class Name : #
# mpv = mpv
# Firefox = firefox
# Discord = discord
# Spotify = spotify
# Brave Browser = brave-browser

for i in ['1', '2', '3', '4', '5', '6', '7', '8', '9']:
    keys.extend([
        Key(
            [mod],
            i,
            lazy.group[i].toscreen(),
            desc="Switch to group {}".format(i),
        ),
        Key(
            [mod, "shift"],
            i,
            lazy.window.togroup(i, switch_group=True),
            desc="Move focused window to group {}".format(i),
        ),
    ])

# # # Layouts: # # #

layouts = [
    layout.MonadTall(border_focus='#118888',
                     border_normal='#1D2330',
                     margin=5,
                     border_width=2),
    layout.MonadThreeCol(border_focus='#118888',
                         border_normal='#1D2330',
                         new_client_position='bottom',
                         ratio=0.4,
                         margin=5,
                         border_width=2),
    layout.MonadWide(border_focus='#118888',
                     border_normal='#1D2330',
                     margin=5,
                     border_width=2),

    # layout.Max(),
    # layout.MonadThreeCol(),
    # layout.Spiral(),
    # layout.Columns(),
    # layout.Floating(),
    # layout.Stack(),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# # # Widget: # # #

widget_defaults = dict(
    font="JenBrainsMono Nerd Bold",
    fontsize=13,
    padding=3,
    foreground='#cccccc',
    background='#353446',
)
extension_defaults = [widget_defaults.copy()]


# # # Bar: # # #

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=15, background='#282738'),

                # Search bar #
                widget.TextBox(fmt=' ',
                               background='#282738',
                               fontsize=17,
                               foreground='#4dd0e1'),
                widget.Image(filename='~/.config/qtile/Assets/6.jpg'),

                # Workspaces #
                widget.GroupBox(
                    fontsize=20,
                    borderwidth=3,
                    highlight_method='block',
                    active='#CAA9E0',
                    block_highlight_text_color="#009999",
                    highlight_color='#009999',
                    inactive='#282738',
                    foreground='#4B427E',
                    background='#353446',
                    this_current_screen_border='#353446',
                    this_screen_border='#353446',
                    other_current_screen_border='#353446',
                    other_screen_border='#353446',
                    urgent_border='#353446',
                    rounded=True,
                    disable_drag=True,
                ),

                #widget.Spacer(length=8, background='#353446'),
                widget.Image(filename='~/.config/qtile/Assets/2.jpg'),

                # CPU Monitor #
                widget.TextBox(
                    foreground='#b9b255',
                    text=' ',
                    fontsize=15,
                ),
                widget.Spacer(length=-7, background='#353446'),
                widget.CPU(
                    format=' {load_percent}%',
                    fontsize=13,
                    update_interval=3,
                ),
                widget.Image(filename='~/.config/qtile/Assets/2.jpg'),

                # Memeory Monitor #
                widget.TextBox(
                    foreground='#009189',
                    text=' ',
                    fontsize=15,
                ),
                widget.Memory(
                    format='{MemPercent}%',
                    update_interval=3,
                ),
                widget.Image(filename='~/.config/qtile/Assets/2.jpg'),

                # Free Space in Partition #
                widget.TextBox(
                    foreground='#ec407a',
                    text=' ',
                    fontsize=15,
                ),
                widget.DF(
                    visible_on_warn=False,
                    format='{uf}{m} / {s}{m}',
                    update_interval=5,
                ),
                widget.Image(filename='~/.config/qtile/Assets/5.jpg'),

                # Layouts #
                widget.CurrentLayoutIcon(background='#282738', scale=0.5),

                # widget.CurrentLayout(
                #      background='#282738',
                #      fmt='{}',
                #  ),
                widget.Image(filename='~/.config/qtile/Assets/4.jpg'),

                # Active Window #
                widget.WindowName(
                    format="{name}",
                    empty_group_string='Desktop',
                ),
                widget.Image(filename='~/.config/qtile/Assets/3.jpg'),

                # System Tray #
                widget.Systray(background='#282738', fontsize=2),
                widget.TextBox(text=' ', background='#282738'),
                widget.Image(filename='~/.config/qtile/Assets/6.jpg'),

                # Wifi Monitor #
                widget.Wlan(interface='wlp4s0',
                            disconnected_message='󰯡 ',
                            format='󰀂   {percent:2.0%} {essid}',
                            use_ethernet=True),
                widget.Image(filename='~/.config/qtile/Assets/2.jpg'),

                # Battery Monitor #
                widget.BatteryIcon(
                    theme_path='~/.config/qtile/Assets/Battery/',
                    background='#353446',
                    scale=1,
                ),
                widget.Battery(
                    format='{percent:2.0%}',
                    fontsize=13,
                ),
                widget.Image(filename='~/.config/qtile/Assets/5.jpg'),

                # Date #
                widget.TextBox(
                    foreground='#e89e78',
                    background='#282738',
                    fontsize=15,
                    text='󰸘 ',
                ),
                widget.Clock(
                    background='#282738',
                    format='%a, %b %d, %Y',
                ),
                widget.Image(filename='~/.config/qtile/Assets/7.jpg'),

                # Time #
                widget.TextBox(
                    foreground='#e89e78',
                    background='#282738',
                    fontsize=15,
                    text='󱑍 ',
                ),
                widget.Clock(
                    background='#282738',
                    format='%I:%M %p',
                ),
                widget.Spacer(length=15, background='#282738'),
            ],
            30,
            margin=[0, -5, 0, -5],
        ), ),
]

# # # Default config contents # # #
# # # Drag floating layouts. # # #

mouse = [
    Drag([mod],
         "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod],
         "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    border_focus='884488',
    border_normal='#1F1D2E',
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to
        # see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ])

# # # Behaviour of window : # # #

auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

#                  #
# #              # #
# # #  E O F:  # # #
# #              # #
#                  #
