# BASH NOTES

Things open behind other things - happening with atom

unix.stackexchange.com/questions/197756/nautilus-to-open-in-the-foreground


## COMMAND REDIRECTION

STDOUT & STDERR

Redirect all command output (stdout+stderr) to /dev/null

```
command > /dev/null 2>&1
```

Default:
  `stdin  ==> fd 0`
  `stdout ==> fd 1`
  `stderr ==> fd 2`

command > /dev/null results in
  `stdin  ==> fd 0`
  `stdout ==> /dev/null`
  `stderr ==> fd 2`

and 2>&1 causes:

  `stdin  ==> fd 0`
  `stdout ==> /dev/null`
  `stderr ==> stdout`


GTK-LAUNCHER : WORKS ON UBUNTU, LAUNCHES ITEMS IN THE DESKTOP LAUNCHER ENVIRONMENT

I.E .desktop file in /usr/share/applications or ~/.local/share/applications)

`gtk-launch <file>`

where is the name of the .desktop file without the .deskt,op part

askubuntu.com/questions/5172/running-a-desktop-file-in-the-terminal
