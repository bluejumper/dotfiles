########## COLOR ###########
for COLOUR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval c_$COLOUR='%{$fg[${(L)COLOUR}]%}'
    eval c_b$COLOUR='%{$fg_bold[${(L)COLOUR}]%}'
done

c_RESET="%{$reset_color%}"

set_prompt () {
    # ######### PROMPT #########

    PROMPT='
 -- ${c_RED}[${c_RESET}%n @%M${c_RED}]${c_RESET} ${c_CYAN}[${c_RESET} %4/ ${c_CYAN}]${c_RESET}
 \\\\ ${c_bRED}\$${c_RESET}: '
    RPROMPT="[${c_GREEN} %D{%R:%S} ${c_RESET}]"

    # ######### PROMPT #########
}

set_prompt

