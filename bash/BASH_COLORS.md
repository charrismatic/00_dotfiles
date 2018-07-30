REFERENCE: https://misc.flogisoft.com/bash/tip_colors_and_formatting

# BASH COLORS 

see `infocmp` 

---

## FORMATTING 
| key                 |  example                    |  
| --------------------|---------------------------- |
| 1 - Bold/Bright     | `echo -e "\e[1mBold"`       |   
| 2 - Dim             | `echo -e "\e[2mDim"`        |  
| 4 - Underlined      | `echo -e "\e[4mUnderlined"` |         
| 5 - Blink 1)        | `echo -e "\e[5mBlink"`      |    
| 7 - Reverse         | `echo -e "\e[7minverted"`   |       
| 8 - Hidden          | `echo -e "\e[8mHidden"`     |     

---

## Reset

    0  - Reset all attributes  echo -e "\e[0mNormal Text"
    21 - Reset bold/bright     echo -e "\e[1mBold \e[21mNormal"
    22 - Reset dim             echo -e "\e[2mDim \e[22mNormal"
    24 - Reset underlined      echo -e "\e[4mUnderlined \e[24mNormal"
    25 - Reset blink           echo -e "\e[5mBlink \e[25mNormal"
    27 - Reset reverse         echo -e "\e[7minverted \e[27mNormal"
    28 - Reset hidden          echo -e "\e[8mHidden \e[28mNormal"

---

## Foreground (8/16 Colors)

    39 - Default               echo -e "\e[39mDefault"
    30 - Black                 echo -e "\e[30mBlack"
    31 - Red                   echo -e "\e[31mRed"
    32 - Green                 echo -e "\e[32mGreen"
    33 - Yellow                echo -e "\e[33mYellow"
    34 - Blue                  echo -e "\e[34mBlue"
    35 - Magenta               echo -e "\e[35mMagenta"
    36 - Cyan                  echo -e "\e[36mCyan"
    37 - Light gray            echo -e "\e[37mLight gray"
    90 - Dark gray             echo -e "\e[90mDark gray"
    91 - Light red             echo -e "\e[91mLight red"
    92 - Light green           echo -e "\e[92mLight green"
    93 - Light yellow          echo -e "\e[93mLight yellow"
    94 - Light blue            echo -e "\e[94mLight blue"
    95 - Light magenta         echo -e "\e[95mLight magenta"
    96 - Light cyan            echo -e "\e[96mLight cyan"
    97 - White                 echo -e "\e[97mWhite"

---

## Background (8/16 Colors)

    49 - Default               echo -e "\e[49mDefault"
    40 - Black                 echo -e "\e[40mBlack"
    41 - Red                   echo -e "\e[41mRed"
    42 - Green                 echo -e "\e[42mGreen"
    43 - Yellow                echo -e "\e[43mYellow"
    44 - Blue                  echo -e "\e[44mBlue"
    45 - Magenta               echo -e "\e[45mMagenta"
    46 - Cyan                  echo -e "\e[46mCyan"
    47 - Light gray            echo -e "\e[47mLight gray"
    100 - Dark gray            echo -e "\e[100mDark gray"
    101 - Light red            echo -e "\e[101mLight red"
    102 - Light green          echo -e "\e[102mLight green"
    103 - Light yellow         echo -e "\e[103mLight yellow"
    104 - Light blue           echo -e "\e[104mLight blue"
    105 - Light magenta        echo -e "\e[105mLight magenta"
    106 - Light cyan           echo -e "\e[106mLight cyan"
    107 - White                echo -e "\e[107mWhite"

## OTHERS

## BASH COLOR FORMATTING  

https://misc.flogisoft.com/bash/tip_colors_and_formatting

  Black       0;30     Dark Gray     1;30
  Blue        0;34     Light Blue    1;34
  Green       0;32     Light Green   1;32
  Cyan        0;36     Light Cyan    1;36
  Red         0;31     Light Red     1;31
  Purple      0;35     Light Purple  1;35
  Brown       0;33     Yellow        1;33
  Light Gray  0;37     White         1;37


