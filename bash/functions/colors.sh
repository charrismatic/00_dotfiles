
function color_test_16() {
    #Background
    for clbg in {40..47} {100..107} 49 ; do
	    #Foreground
	    for clfg in {30..37} {90..97} 39 ; do
		    #Formatting
		    for attr in 0 1 2 4 5 7 ; do
			    #Print the result
			    echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
		    done
		    echo #Newline
	    done
    done
}

function color_test_256() {
    # Foreground / Background
    for fgbg in 38 48 ; do 
        for color in {0..255} ; do # Colors
            # Display the color
            printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
            # Display 6 colors per lines
            if [ $((($color + 1) % 6)) == 4 ] ; then
                echo # New line
            fi
        done
        echo # New line
    done
}