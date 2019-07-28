source: https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
---

# Make the less Command More Powerful

Due to its speed and simplicity, GNU less is probably the most common default terminal pager 
on various GNU/Linux distributions you may have probably used it explicitly via the less command, 
or implicitly when you execute the man command or git diff. Although the default configuration of
less does not really offer much except for a basic text viewer, it is actually much more powerful 
than most people think. Here a few improvements over the default configuration are offered.


## Better default GNU less command line options

Add the following to your `~/.bashrc` if you use bash or ~/.zshrc if you use zsh:


### set options for less

```sh
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
```

### or the short version

```sh
export LESS='-F -i -J -M -R -W -x4 -X -z-4'
```
    -F   `--quit-if-one-screen`       Exit if the entire file can be displayed in one screen. 
                                      This is usually desirable as there is no incentive to stay in less if a single screen can display all the contents.
    -i   `--ignore-case`              Cause search in less to ignore case unless an uppercase letter is present in the search pattern.
    -J   `--status-column`            Display a status column on the left to indicate lines that match current search 
                                      or indicate the first unread line after moving a full page.
    -M   `--LONG-PROMPT`              Prompt more verbosely.
    -R   `--RAW-CONTROL-CHARS`        Cause ANSI “color” escape sequences to be displayed in their raw form.
                                      This is for the color display explained later in the next section.
    -W   `--HILITE-UNREAD`            Highlight the first unread line after scrolling the screen for more than one lines.
    -x4  `--tabs=4`                   Display a tab as 4-character width, since most modern text files assume 4-character width for a tab. 
    -X  `--no-init`                   Disable sending the termcap initialization and deinitialization strings to the terminal. 
                                      The purpose here is to prevent clearing screen after exiting. If you do not want this feature and want to remove it, 
                                      please keep in mind that `--quit-if-one-screen` also relies on this option to work properly. 
                                      For a workaround, please check out here.
    -z-4 `--window=-4`                Change the default scrolling size to 4 lines fewer than the current screen size, 
                                      so always keep 4 lines overlapping with previous screen when scrolling with the space key.



### A more colorful less

Add the following to your `~/.bashrc` if you use bash or ~/.zshrc if you use zsh:

# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .

```sh
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
```

Now restart your shell and run `man less` - the manual is in colors

Reading non-text files and highlighting syntax in less

## SYNTAX HIGHLIGHTING 

Less provides an “input preprocessor” feature. This feature allows a preprocessor, usually named lesspipe{.sh}, to process the file before less displays it. 
This preprocessor can, decompress compressed files, convert binary files to a human-readable format, or add syntax highlighting. 
There are many input preprocessors floating around on the Internet, but I strongly recommend lesspipe.sh by Wolfgang Friebel. 

Clone the repository with git (if git is not available on your computer, you can download the latest version here):


```sh
git clone https://github.com/wofr06/lesspipe.git
```

```sh
cd lesspipe
```

Run `./configure` to detect the availability of various preprocessing programs on your system. 
Follow the instructions to finish this program. Remember to answer y for the question “Activate syntax highlighting code?”.

Copy `lesspipe.sh` and `code2color` to one of your directories in the PATH environmental variable, such as `/usr/local/`

bin:

```sh
cp lesspipe.sh code2color /usr/local/bin 
```

Add the following to your `~/.bashrc` if you use bash or ~/.zshrc if you use zsh:

### Set the Less input preprocessor

```sh
if type lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='|lesspipe.sh %s'
fi
```

This will set the less input preprocessor to lesspipe.sh if it is found.

Optionally, to achieve better syntax highlighting when reading source code, 
install `pygments` and add the following to your `~/.bashrc` if you use bash or ~/.zshrc if you use zsh:

```sh
if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi
```

This code snippet sets `pygmentize` as the syntax highlighter rather than the built-in syntax highlighter in `code2color`. 
However, using `pygments` also leads to a longer startup time of less.

Now you should be able to use less to directly open various non-text files: 

  \*.gz, \*.xz, \*.doc, etc.

Also, syntax highlighting is enabled in less:

This entry was posted in GNU, GNU/Linux, macOS/*BSD on September 27, 2016.
