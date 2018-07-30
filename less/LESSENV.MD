# OPTIONS
# Command line options are described below.  Most options may be changed while less is running, via the "-" command.
# Most options may be given in one of two forms: either a dash followed by a single letter, or two dashes followed by a long option name.  A long option name may be abbreviated as long as the abbreviation is unambiguous.  For example, --quit-at-eof may be abbreviated  --quit, but not --qui, since both --quit-at-eof and --quiet begin with --qui.  Some long option names are in uppercase, such as --QUIT-AT-EOF, as distinct from --quit-at-eof.  Such option names need only have their first letter capitalized; the remainder of the name may be in either case.  
# For example, --Quit-at-eof is equivalent to --QUIT-AT-EOF.
# Options are also taken from the environment variable "LESS".  For example, to avoid typing "less -options ..." each time less is invoked, 
# you might tell csh:
# setenv LESS "-options"
# or if you use sh:
# LESS="-options"; export LESS
#  On MS-DOS, you don't need the quotes, but you should replace any percent signs in the options string by double percent signs.
#  The environment variable is parsed before the command line, so command line options override the LESS environment variable.  If an option appears in the LESS variable, it can be reset to its default value on the command  line  by  beginning  the  command  line  option with "-+".
#  Some options like -k or -D require a string to follow the option letter.  The string for that option is considered to end when a dollar sign ($) is found.  For example, you can set two -D options on MS-DOS like this:
#  LESS="Dn9.1$Ds4.1"

# If the --use-backslash option appears earlier in the options, then a dollar sign or backslash may be included literally in an option string by preceding it with a backslash.  
# If the --use-backslash option is not in effect, then backslashes are not treated specially, and there is no way to include a dollar sign in the option string.
   
  -?   --help                    displays help (the same as the h command).  (Depending on how your shell interprets the question mark, it
                                 may be necessary to quote the question mark, thus: "-\?".)

  -a   --search-skip-screen      By default, forward searches start at the top of the displayed screen and backwards searches start at the
                                 bottom of  the displayed screen (except for repeated searches invoked by the n or N commands, which start after or before the "target" line
                                 respectively; see the -j option for more about the target line).  The -a option causes forward searches to instead start at the bottom of
                                 the screen and backward searches to start at the top of the screen, thus skipping all lines displayed on the screen.  
  -A   --SEARCH-SKIP-SCREEN      Causes  all  forward searches (not just non-repeated searches) to start just after the target line, 
                                  and all backward searches to start just before the target line.  Thus, forward searches will skip part of the displayed screen 
                                  (from the first line up to and including the target line).  Similarly backwards searches will skip the displayed screen from the last
                                  line up to and including the target line.  This was the default behavior in less versions prior to 441.
 
  -bn   --buffers=n              Specifies the amount of buffer space less will use for each file, in units of kilobytes (1024 bytes).  
                                 By default 64 K of buffer space is used for each file (unless the file is a pipe; see the -B option).  The -b option specifies instead  that  n  kilo‐ bytes of buffer space should be used for each file.  If n is -1, buffer space is unlimited; that is, the entire file can be read into memory.
  -B    --auto-buffers           By  default,  when  data  is read from a pipe, buffers are allocated automatically as needed. 
                                 If a large amount of data is read from the pipe, this can cause a large amount of memory to be allocated. 
                                  The -B option disables this automatic allocation of buffers for pipes, so that only 64 K (or the amount of space specified by the -b option) is used for the pipe. 
                                  Warning: use of -B can result in erroneous display, since only the most recently viewed part of the piped data is kept in memory; any earlier data is lost.
 -c   --clear-screen              Causes full screen repaints to be painted from the top line down.  By default, full screen repaints are done by scrolling from the bottom of the screen.  
 -C   --CLEAR-SCREEN              Same as -c, for compatibility with older versions of less.  
 -d   --dumb                      The -d option suppresses the error message normally displayed if the terminal is dumb; that is, lacks some
                                  important capability, such as the ability to clear the screen or scroll backward.  The -d option does not otherwise change the behavior of
                                  less on a dumb terminal.
 -Dxcolor  --color=xcolor              [MS-DOS only] Sets the color of the text displayed.  
                                       x is a single character which selects the type of text whose color is being set: 
                                       n=normal
                                       , s=standout
                                       , d=bold
                                       , u=underlined
                                       , k=blink.  
                                       color is a pair of numbers separated by a period.  
                                       The first num‐ ber selects the foreground color and the second selects the background color of the text.  A single number N is the same as N.M, where M is the normal background color.  
                                       x may also be a to toggle strict ANSI sequence rendering (SGR mode).
 
-e   --quit-at-eof                    Causes less to automatically exit the second time it reaches end-of-file.  By default, the only way to exit less is via the "q" command.  
-E   --QUIT-AT-EOF                    Causes less to automatically exit the first time it reaches end-of-file.  
-f   --force                          Forces  non-regular  files to be opened.  (A non-regular file is a directory or a device special file.)  Also suppresses the warning message when a binary file is opened.  By default, less will refuse to open non-regular files.  Note that some operating systems will not allow directories to be read, even if -f is set.
 
-F  --quit-if-one-screen              Causes less to automatically exit if the entire file can be displayed on the first screen.  
-g  --hilite-search                   Normally, less will highlight ALL strings which match the last search command.  The -g option changes this behavior to highlight only the particular string which was found by the last search command.  This can cause less to run somewhat faster than  the default.
 
-G  or --HILITE-SEARCH                The -G option suppresses all highlighting of strings found by search commands.  
-hn or --max-back-scroll=n            Specifies a maximum number of lines to scroll backward.  If it is necessary to scroll backward more than n lines, the screen is repainted in a forward direction instead.  (If the terminal does not have the ability to scroll backward, -h0 is implied.)  
-i  or --ignore-case                  Causes  searches to ignore case; that is, uppercase and lowercase are considered identical.  This option is ignored if any uppercase letters appear in the search pattern; in other words, if a pattern contains uppercase letters, then that search does not ignore case.
 
-I  or --IGNORE-CASE                  Like -i, but searches ignore case even if the pattern contains uppercase letters.  
-jn or --jump-target=n                Specifies a line on the screen where the "target" line is to be positioned.  The target line is the line specified by any command to search for a pattern, jump to a line number, jump to a file percentage or jump to a tag.  The screen line may be  speci‐ fied  by  a  number:  the  top line on the screen is 1, the next is 2, and so on.
                                      The number may be negative to specify a line relative to the bottom of the screen: the bottom line on the screen is -1, the second to the bottom is -2, and so on.  

                                      Alternately, the screen line may be specified as a fraction of the height of the screen, starting with a decimal point: .5 is in the middle of the screen, .3 is three tenths down from the first line, and so on.  If the line is specified as  a  fraction,  the
                                      actual line number is recalculated if the terminal window is resized, so that the target line remains at the specified fraction of the screen height.  If any form of the -j option is used, repeated forward searches (invoked with "n" or "N") begin at the
                                      line immediately after the target line, and repeated backward searches begin at the target line, unless changed by -a or -A.  For example, if "-j4" is used, the target line is the fourth line on the screen, so forward searches begin at the fifth line on
                                      the screen.  However nonrepeated searches (invoked with "/" or "?")  always begin at the start or end of the current screen respectively.
 -J or --status-column                      Displays a status column at the left edge of the screen.  The status column shows the lines that matched the current search.  The status column is also used if the -w or -W option is in effect.  

 -kfilename 
 --lesskey-file=filename                   Causes  less  to  open  and interpret the named file as a lesskey (1) file.  Multiple -k options may be specified.  If the LESSKEY or LESSKEY_SYSTEM environment variable is set, or if a lesskey file is found in a standard place (see KEY BINDINGS), it is also used as a lesskey file.

 -K or --quit-on-intr                      Causes less to exit immediately (with status 2) when an interrupt character (usually ^C) is typed.  Normally, an interrupt character causes less to stop whatever it is doing and return to its command prompt.  Note that use of this option makes it impos‐ sible to return to the command prompt from the "F" command.
 -L or --no-lessopen                       Ignore the LESSOPEN environment variable (see the INPUT PREPROCESSOR section below).  This option can be set from within less, but it will apply only to files opened subsequently, not to the file which is currently open.  
 -m or --long-prompt                       Causes less to prompt verbosely (like more), with the percent into the file.  By default, less prompts with a colon.  
 -M or --LONG-PROMPT                       Causes less to prompt even more verbosely than more.  
 -n or --line-numbers                      Suppresses  line  numbers.   The default (to use line numbers) may cause less to run more slowly in some cases, especially with a very large input file.  Suppressing line numbers with the -n option will avoid this problem.  Using line numbers means: the line number will be displayed in the verbose prompt and in the = command, and the v command will pass the current line number to the editor (see also the discussion of LESSEDIT in PROMPTS below).
 -N or --LINE-NUMBERS                      Causes a line number to be displayed at the beginning of each line in the display.  
 -ofilename or --log-file=filename         Causes less to copy its input to the named file as it is being viewed.  This applies only when the input file is a pipe, not an ordinary file.  If the file already exists, less will ask for confirmation before overwriting it.  
 -Ofilename or --LOG-FILE=filename         The -O option is like -o, but it will overwrite an existing file without asking for confirmation. 
                                           If no log file has been specified, the -o and -O options can be used from within less to specify a log file.  Without a file name, they will simply report the name of the log file.  The "s" command is equivalent to specifying -o from within less.
 
-ppattern or --pattern=pattern         The -p option on the command line is equivalent to specifying +/pattern; that is, it tells less to start at the first occurrence of pattern in the file.  
-Pprompt or --prompt=prompt            Provides a way to tailor the three prompt styles to your own preference.  This option would normally be put in the LESS environment variable, rather than being typed in with each less command.  Such an option must either be the last option in  the  LESS variable, or be terminated by a dollar sign.
    -Ps                                followed by a string changes the default (short) prompt to that string.
    -Pm                                changes the medium (-m) prompt.                            
    -PM                                changes the long (-M) prompt.                            
    -Ph                                changes the prompt for the help screen.                           
    -P=                                changes the message printed by the = command.                            
    -Pw                                changes the message printed while waiting for data (in the F command).     
                                      All prompt strings consist of a sequence of letters and special escape sequences. See the section on PROMPTS for more details. 
    -q  --quiet --silent              Causes  moderately "quiet" operation: the terminal bell is not rung if an attempt is made to scroll past the end of the file or before the beginning of the file.  If the terminal has a "visual bell", it is used instead.  The bell will be rung on certain other errors, such as typing an invalid character.  The default is to ring the terminal bell in all such cases.  
    -Q  --QUIET --SILENT              Causes totally "quiet" operation: the terminal bell is never rung.  
    -r  --raw-control-chars           Causes "raw" control characters to be displayed.  The default is to display control characters using the caret notation; for example, a control-A (octal 001) is displayed as "^A".  Warning: when the -r option is used,  less  cannot  keep  track  of  the actual appearance of the screen (since this depends on how the screen responds to each type of control character).  Thus, various display problems may result, such as long lines being  split in the wrong place.
 
    -R --RAW-CONTROL-CHARS            Like -r, but only ANSI "color" escape sequences are output in "raw" form.  
                                      Unlike -r, the screen appearance is maintained correctly in most cases.  ANSI "color" escape sequences are sequences of the form:  

    ESC [ ... m                     where  the  "..."  is zero or more color specification characters For the purpose of keeping track of screen appearance, ANSI color escape sequences are assumed to not move the cursor.  You can make less think that characters other than "m" can end ANSI
                                    color escape sequences by setting the environment variable LESSANSIENDCHARS to the list of characters which can end a color escape sequence.  And you can make less think that characters other than the standard ones may appear between the ESC and  the  m
                                    by setting the environment variable LESSANSIMIDCHARS to the list of characters which can appear.
 
  -s or --squeeze-blank-lines       Causes consecutive blank lines to be squeezed into a single blank line.  This is useful when viewing nroff output.  
  -S or --chop-long-lines           Causes  lines  longer than the screen width to be chopped (truncated) rather than wrapped.  That is, the portion of a long line that does not fit in the screen width is not shown.  The default is to wrap long lines; that is, display the remainder on the next line.
 
  -ttag or --tag=tag                The -t option, followed immediately by a TAG, will edit the file containing that tag. 
                                    For this to work, tag information must be available; for example,
                                    there may be a file in the current directory called "tags", which was previously built by ctags  (1) or  an  equivalent command.  
                                    If the environment variable LESSGLOBALTAGS is set, it is taken to be the name of a command compatible with global (1), and that command is executed to find the tag.
                                    (See  http://www.gnu.org/software/global/global.html).  The
   -t                               option may also be specified from within less (using the - command) as a way of examining a new file.  The command ":t" is equivalent to specifying -t from within less. -Ttagsfile or --tag-file=tagsfile                            Specifies a tags file to be used instead of "tags".  
   -u or --underline-special        Causes backspaces and carriage returns to be treated as printable characters; that is, they are sent to the terminal when they appear in the input.  

  -U       --UNDERLINE-SPECIAL      Causes backspaces, tabs and carriage returns to be treated as control characters; that is, they are handled as specified by the -r option.  
                                    By default, if neither -u nor -U is given, backspaces which appear adjacent to an underscore character are treated specially: the underlined text is displayed using the terminal's hardware underlining capability.  Also, backspaces which  appear  between
                                    two  identical characters are treated specially: the overstruck text is printed using the terminal's hardware boldface capability.  Other backspaces are deleted, along with the preceding character.  Carriage returns immediately followed by a newline are
                                    deleted.  Other carriage returns are handled as specified by the -r option.  Text which is overstruck or underlined can be searched for if neither -u nor -U is in effect.
  -V      --version                Displays the version number of less.  
  -w      --hilite-unread           Temporarily highlights the first "new" line after a forward movement of a full page.  The first "new" line is the line immediately following the line previously at the bottom of the screen.  Also highlights the target line after a g or p  command.   The highlight is removed at the next command which causes movement.  The entire line is highlighted, unless the -J option is in effect, in which case only the status column is highlighted.
  -W      --HILITE-UNREAD           Like -w, but temporarily highlights the first new line after any forward movement command larger than one line.  
  -xn     --tabs=n,...              Sets tab stops.  If only one n is specified, tab stops are set at multiples of n.  If multiple values separated by commas are specified, tab stops are set at those positions, and then continue with the same spacing as the last two.  For example, -x9,17 will set tabs at positions 9, 17, 25, 33, etc.  The default for n is 8.
  -X      --no-init                 Disables sending the termcap initialization and deinitialization strings to the terminal.  This is sometimes desirable if the deinitialization string does something unnecessary, like clearing the screen.  
  -yn     --max-forw-scroll=n       Specifies a maximum number of lines to scroll forward.  If it is necessary to scroll forward more than n lines, the screen is repainted instead.  The -c or -C option may be used to repaint from the top of the screen if desired.  By default, any  forward movement causes scrolling.
  -[z]n   --window=n                Changes the default scrolling window size to n lines.  The default is one screenful.  The z and w commands can also be used to change the window size.  The "z" may be omitted for compatibility with some versions of more.  If the number n is negative, it indicates n lines less than the current screen size.  For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.  
                                    If the screen is resized to 40 lines, the scrolling window automatically changes to 36 lines.
  -"cc or --quotes=cc                Changes the filename quoting character.  This may be necessary if you are trying to name a file which contains both spaces and quote characters.  
                                    Followed by a single character, this changes the quote character to that character.  
                                    Filenames containing a space  should  then  be surrounded by that character rather than by double quotes.  
                                    Followed by two characters, changes the open quote to the first character, and the close quote to the second character.  
                                    Filenames containing a space should then be preceded by the open quote character and followed by the close quote character.  
                                    Note that even after the quote characters are changed, this option remains -" (a dash followed by a double quote).
 
   -~ or --tilde                    Normally lines after end of file are displayed as a single tilde (~).  
                                    This option causes lines after end of file to be displayed as blank lines.  
   -# or --shift                    Specifies the default number of positions to scroll horizontally in the RIGHTARROW and LEFTARROW commands.  
                                    If the number specified is zero, it sets the default number of positions to one half of the screen width.  
                                    Alternately, the number may be  speci‐ fied as a fraction of the width of the screen, starting with a decimal point: .5 is half of the screen width, .3 is three tenths of the screen width, and so on.  If the number is specified as a fraction, the actual number of scroll positions is recalcu‐
                                    lated if the terminal window is resized, so that the actual scroll remains at the specified fraction of the screen width.
 
   --follow-name                    Normally, if the input file is renamed while an F command is executing, less will continue to display the contents of the original file despite its name change.  
                                    If --follow-name is specified, during an F command less will periodically attempt to reopen the file by name.  If the reopen succeeds and the file is a different file from the original (which means that a new file has been created with the same name as the original (now renamed) file), less will display the contents of that new file.
  --no-keypad                       Disables sending the keypad initialization and deinitialization strings to the terminal.  This is sometimes useful if the keypad strings make the numeric keypad behave in an undesirable manner.  
  --use-backslash                   This option changes the interpretations of options which follow this one.  After the --use-backslash option, any backslash in an option string is removed and the following character is taken literally.  This allows a dollar sign to be included in option strings.
 
  --                                A command line argument of "--" marks the end of option arguments.  
                                    Any arguments following this are interpreted as filenames.  
                                    This can be useful when viewing a file whose name begins with a "-" or "+". +     
                                    If a command line option begins with +, the remainder of that option is taken to be an initial command to less. 
                                    For example, +G tells less to start at the end of the file rather than the beginning, and +/xyz tells it to start at the first occurrence of
                                    "xyz" in the file.  As a special case, +<number> acts like +<number>g; 
                                    that is, it starts the display at the specified line number (however, see the caveat under the "g" command above). 
                                    If the option starts with ++, the initial command applies to every
                                    file being viewed, not just the first one.  
                                    The + command described previously may also be used to set (or change) 
                                    an initial command for every file.


  COLUMNS              Sets the number of columns on the screen.  Takes precedence over the number of columns specified by the TERM variable.  (But if you have a windowing system which supports TIOCGWINSZ or WIOCGETD, 
                       the window system's idea of the screen size  takes  precedence over the LINES and COLUMNS environment variables.)
  EDITOR               The name of the editor (used for the v command).
  HOME                 Name of the user's home directory (used to find a lesskey file on Unix and OS/2 systems).
  HOMEDRIVE, HOMEPATH  Concatenation of the HOMEDRIVE and HOMEPATH environment variables is the name of the user's home directory if the HOME variable is not set (only in the Windows version).
  INIT                 Name of the user's init directory (used to find a lesskey file on OS/2 systems). LANG   Language for determining the character set. LC_CTYPE Language for determining the character set.
  LESS                 Options which are passed to less automatically. LESSANSIENDCHARS Characters which may end an ANSI color escape sequence (default "m").
  LESSANSIMIDCHARS     Characters which may appear between the ESC character and the end character in an ANSI color escape sequence (default "0123456789:;[?!"'#%()*+ ".
  LESSBINFMT           Format for displaying non-printable, non-control characters.
  LESSCHARDEF          Defines a character set.
  LESSCHARSET          Selects a predefined character set.
  LESSCLOSE            Command line to invoke the (optional) input-postprocessor.
  LESSECHO             Name of the lessecho program (default "lessecho").  The lessecho program is needed to expand metacharacters, such as * and ?, in filenames on Unix systems.
  LESSEDIT             Editor prototype string (used for the v command).  See discussion under PROMPTS.
  LESSGLOBALTAGS       Name of the command used by the -t option to find global tags.  Normally should be set to "global" if your system has the global (1) command.  If not set, global tags are not used.
  LESSHISTFILE         Name  of  the  history file used to remember search commands and shell commands between invocations of less.  If set to "-" or "/dev/null", a history file is not used.  
                       The default is "$HOME/.lesshst" on Unix systems, "$HOME/_lesshst" on DOS and Windows systems, 
                       or "$HOME/lesshst.ini" or "$INIT/lesshst.ini" on OS/2 systems.
  LESSHISTSIZE         The maximum number of commands to save in the history file.  The default is 100.
  LESSKEY              Name of the default lesskey(1) file.
  LESSKEY_SYSTEM       Name of the default system-wide lesskey(1) file.
  LESSMETACHARS        List of characters which are considered "metacharacters" by the shell.
  LESSMETAESCAPE       Prefix which less will add before each metacharacter in a command sent to the shell. 
                       If LESSMETAESCAPE is an empty string, commands containing metacharacters will not be passed to the shell.
  LESSOPEN             Command line to invoke the (optional) input-preprocessor.
  LESSSECURE           Runs less in "secure" mode.  See discussion under SECURITY.
  LESSSEPARATOR        String to be appended to a directory name in filename completion.
  LESSUTFBINFMT        Format for displaying non-printable Unicode code points.
  LESS_IS_MORE         Emulate the more (1) command.
  LINES                Sets the number of lines on the screen.  
                       Takes precedence over the number of lines specified by the TERM variable.  
                       But if you have a windowing system which supports TIOCGWINSZ or WIOCGETD, 
                       the window system's idea of the screen size  takes
                       precedence over the LINES and COLUMNS environment variables.)
  MORE                 Options which are passed to less automatically when running in more compatible mode. 
  PATH                 User's search path (used to find a lesskey file on MS-DOS and OS/2 systems). 
  SHELL                The shell used to execute the ! command, as well as to expand filenames. 
  TERM                 The type of terminal on which less is being run. VISUAL The name of the editor (used for the v command).  

