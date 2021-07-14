which_term(){
    term=$(ps -p $(ps -p $$ -o ppid=) -o args=);
    found=0;
    case $term in
        *gnome-terminal*)
            found=1
            echo "gnome-terminal " $(dpkg -l gnome-terminal | awk '/^ii/{print $3}')
            ;;
        *lxterminal*)
            found=1
            echo "lxterminal " $(dpkg -l lxterminal | awk '/^ii/{print $3}')
            ;;
        rxvt*)
            found=1
            echo "rxvt " $(dpkg -l rxvt | awk '/^ii/{print $3}')
            ;;
        ## Try and guess for any others
        *)
            for v in '-version' '--version' '-V' '-v'
            do
                $term "$v" &>/dev/null && eval $term $v && found=1 && break
            done
            ;;
    esac
    ## If none of the version arguments worked, try and get the 
    ## package version
    [ $found -eq 0 ] && echo "$term " $(dpkg -l $term | awk '/^ii/{print $3}')    
}

CURRENT_DESKTOP=$(echo "$XDG_CURRENT_DESKTOP" | grep -Eoi 'xfce|kde|gnome|unity')
CURRENT_DESKTOP=$(echo "$CURRENT_DESKTOP" | sed -e 's/\(.*\)/\L\1/')
CURRENT_TERM=$(which_term)

main() {
    echo "term: $CURRENT_TERM";
    echo "DE: $CURRENT_DESKTOP";
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi