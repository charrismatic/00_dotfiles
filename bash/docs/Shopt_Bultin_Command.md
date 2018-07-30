source: http://wiki.bash-hackers.org/commands/builtin/shopt
--- 


# The shopt builtin command [Bash Hackers Wiki]

---------------------------
###### Table of Contents

-   [The shopt builtin command](#the_shopt_builtin_command)
    -   [Synopsis](#synopsis)
    -   [Description](#description)
        -   [Options](#options)
        -   [Exit code](#exit_code)
    -   [Examples](#examples)
    -   [Portability considerations](#portability_considerations)
    -   [See also](#see_also)
-   [Discussion](#discussion__section)

# The shopt builtin command[](#the_shopt_builtin_command)

The `shopt` builtin manages [shell options](/internals/shell_options "internals:shell_options"), a set of boolean (`on`/`off`) configuration variables that control the behaviour of the shell.

## Synopsis[](#synopsis)

```
shopt \[-pqsu\] \[-o\] <OPTNAME...>
```

## Description[](#description)

Note: Some of these options and other shell options can also be set with [the set builtin](/commands/builtin/set "commands:builtin:set").

### Options[](#options)

| Option | Description |
| --- | --- |
| `-o` | Restrict the values of `<OPTNAME…>` to only those also known by [the set builtin](/commands/builtin/set "commands:builtin:set") |
| `-p` | Print all shell options and their current value. __Default__. |
| `-q` | Quiet mode. Set exit code if named option is set. For multiple options: `TRUE` if all options are set, `FALSE` otherwise |
| `-s` | Enable (*s*et) the shell options named by `<OPTNAME…>` or list all *enabled* options if no names are given |
| `-u` | Disabe (*u*nset) the shell options named by `<OPTNAME…>` or list all *disabled* options if no names are given |

As noted above, if only `-s` or `-u` are given without any option names, only the currently enabled (`-s`) or disabled (`-u`) options are printed.

### Exit code[](#exit_code)

When listing options, the exit code is `TRUE` (0), if all options are enabled, `FALSE` otherwise.

When setting/unsetting an option, the exit code is `TRUE` unless the named option doesn't exitst.

## Examples[](#examples)

Enable the `nullglob` option:

```
shopt -s nullglob
```

## Portability considerations[](#portability_considerations)

The `shopt` command is not portable accross different shells.

## See also[](#see_also)

-   Internal: [The set builtin command](/commands/builtin/set "commands:builtin:set")
    
-   Internal: [List of shell options](/internals/shell_options "internals:shell_options")
    

