# Colours
for COLOUR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GRAY; do
    eval c_${COLOUR}='%{$fg[${(L)COLOUR}]%}'
    eval cb_${COLOUR}='%{$fg_bold[${(L)COLOUR}]%}'
done
c_RESET="%{$reset_color%}"

# PROMPT sections
user_host="${c_RED}[${c_RESET}%n @%M${c_RED}]${c_RESET}"
directory="${c_CYAN}[${c_RESET} %/ ${c_CYAN}]${c_RESET}"
input="${cb_RED}\$${c_RESET}: "

# RPROMPT sections
exit_code="${c_RED}[${c_RESET}%?${c_RED}]${c_RESET}"
jobs="${c_RESET}[ job %j ]"
time="[${c_GREEN} %D{%R:%S} ${c_RESET}]"

# Widget-related
vimode_normal_one="${cb_YELLOW}[${c_RESET} NORMAL ${cb_YELLOW}]${c_RESET}"
vimode_insert_one="${cb_CYAN}[${c_RESET} INSERT ${cb_CYAN}]${c_RESET}"
vimode_normal_two="${cb_YELLOW}\\\\${cb_RESET}"
vimode_insert_two="${cb_CYAN}\\\\${cb_RESET}"

zle-line-init zle-keymap-select () {
	mode=${${KEYMAP/vicmd/${vimode_normal_one}}/main/${vimode_insert_one}}
	mode2=${${KEYMAP/vicmd/${vimode_normal_two}}/main/${vimode_insert_two}}
	zle reset-prompt
}

# Do prompt
set_prompt () {
    PROMPT='
 -- ${user_host} ${directory} ${mode}
 ${mode2} ${input}'

    RPROMPT='${exit_code} ${jobs} ${time}'
}

zle -N zle-line-init
zle -N zle-keymap-select
set_prompt
