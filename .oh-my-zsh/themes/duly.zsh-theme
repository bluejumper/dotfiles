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
exit_code="${c_RED}[${c_RESET} %? ${c_RED}]${c_RESET}"
jobs="${c_RESET}[ job %j ]"
time="[${c_GREEN} %D{%R:%S} ${c_RESET}]"

# Do prompt
set_prompt () {
    PROMPT='
 -- ${user_host} ${directory}
 \\\\ ${input}'

    RPROMPT='${exit_code} ${jobs} ${time}'
}

set_prompt


#    PROMPT='
# -- ${c_RED}[${c_RESET}%n @%M${c_RED}]${c_RESET} ${c_CYAN}[${c_RESET} %4/ ${c_CYAN}]${c_RESET}
# \\\\ ${cb_RED}\$${c_RESET}: '
#    RPROMPT="[${c_GREEN} %D{%R:%S} ${c_RESET}]"
