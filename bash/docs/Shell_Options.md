source: http://wiki.bash-hackers.org/internals/shell_options
site: Bash Hackers Wiki
title: List of shell options
---


http://wiki.bash-hackers.org/internals/shell_options

# List of shell options [Bash Hackers Wiki]

---------------------------
-   [Show pagesource](/internals/shell_options?do=edit "Show pagesource [V]")
-   [Old revisions](/internals/shell_options?do=revisions "Old revisions [O]")
-   [Backlinks](/internals/shell_options?do=backlink "Backlinks")

###### Table of Contents

-   [List of shell options](#list_of_shell_options)
    -   [Shell options](#shell_options)
        -   [autocd](#autocd)
        -   [cdable_vars](#cdable_vars)
        -   [cdspell](#cdspell)
        -   [checkhash](#checkhash)
        -   [checkjobs](#checkjobs)
        -   [checkwinsize](#checkwinsize)
        -   [cmdhist](#cmdhist)
        -   [compat31](#compat31)
        -   [compat32](#compat32)
        -   [compat40](#compat40)
        -   [compat41](#compat41)
        -   [direxpand](#direxpand)
        -   [dirspell](#dirspell)
        -   [dotglob](#dotglob)
        -   [execfail](#execfail)
        -   [expand_aliases](#expand_aliases)
        -   [extdebug](#extdebug)
        -   [extglob](#extglob)
        -   [extquote](#extquote)
        -   [failglob](#failglob)
        -   [force_fignore](#force_fignore)
        -   [globasciiranges](#globasciiranges)
        -   [globstar](#globstar)
        -   [gnu_errfmt](#gnu_errfmt)
        -   [histappend](#histappend)
        -   [histreedit](#histreedit)
        -   [histverify](#histverify)
        -   [hostcomplete](#hostcomplete)
        -   [huponexit](#huponexit)
        -   [interactive_comments](#interactive_comments)
        -   [lastpipe](#lastpipe)
        -   [lithist](#lithist)
        -   [login_shell](#login_shell)
        -   [mailwarn](#mailwarn)
        -   [no\_empty\_cmd_completion](#no_empty_cmd_completion)
        -   [nocaseglob](#nocaseglob)
        -   [nocasematch](#nocasematch)
        -   [nullglob](#nullglob)
        -   [progcomp](#progcomp)
        -   [promptvars](#promptvars)
        -   [restricted_shell](#restricted_shell)
        -   [shift_verbose](#shift_verbose)
        -   [sourcepath](#sourcepath)
        -   [xpg_echo](#xpg_echo)
    -   [Parser configurations](#parser_configurations)
    -   [See also](#see_also)
-   [Discussion](#discussion__section)

# List of shell options[](#list_of_shell_options)

This information was taken from a Bash version "`4.1`", every now and then new options are added, so likely, this list isn't complete.

The shell-options can be set with the [shopt builtin command](/commands/builtin/shopt "commands:builtin:shopt").

## Shell options[](#shell_options)

### autocd[](#autocd)

| Option: | `autocd` | Since: | 4.0-alpha |
| Shell mode: | interactive only | Default: | off |

If set, a command name that is the name of a directory is executed as if it were the argument to the cd command.

### cdable_vars[](#cdable_vars)

| Option: | `cdable_vars` | Since: | unknown |
| Shell mode: | all | Default: | off |

Treat every __non-directory argument__ to the `cd`-command as variable name containing a directory to `cd` into.

### cdspell[](#cdspell)

| Option: | `cdspell` | Since: | unknown |
| Shell mode: | interactive only | Default: | off |

If set, minor errors in the spelling of a directory component in a cd command will be corrected. The errors checked for are transposed characters, a missing character, and one character too many. If a correction is found, the corrected file name is printed, and the command proceeds.

### checkhash[](#checkhash)

| Option: | `checkhash` | Since: | unknown |
| Shell mode: | all | Default: | off |

If set, Bash checks that a command found in the hash table exists before trying to execute it. If a hashed command no longer exists, a normal path search is performed.

### checkjobs[](#checkjobs)

| Option: | `checkjobs` | Since: | 4.0-alpha |
| Shell mode: | interactive only | Default: | off |

If set, Bash lists the status of any stopped and running jobs before exiting an interactive shell. If any jobs are running, this causes the exit to be deferred until a second exit is attempted without an intervening command. The shell always postpones exiting if any jobs are stopped.

### checkwinsize[](#checkwinsize)

| Option: | `checkwinsize` | Since: | unknown |
| Shell mode: | all | Default: | off |

If set, Bash checks the window size after each command and, if necessary, updates the values of the variables [LINES](/syntax/shellvars#lines "syntax:shellvars") and [COLUMNS](/syntax/shellvars#columns "syntax:shellvars").

### cmdhist[](#cmdhist)

| Option: | `cmdhist` | Since: | unknown |
| Shell mode: | all | Default: | off |

If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands.

### compat31[](#compat31)

| Option: | `compat31` | Since: | 3.2 |
| Shell mode: | all | Default: | off |

Compatiblity mode for Bash 3.1

### compat32[](#compat32)

| Option: | `compat32` | Since: | 4.0 |
| Shell mode: | all | Default: | off |

Compatiblity mode for Bash 3.2

### compat40[](#compat40)

| Option: | `compat40` | Since: | 4.1-beta |
| Shell mode: | all | Default: | off |

Compatiblity mode for Bash 4.0

### compat41[](#compat41)

| Option: | `compat41` | Since: | 4.2-alpha |
| Shell mode: | all | Default: | off |

Compatiblity mode for Bash 4.1

### direxpand[](#direxpand)

| Option: | `direxpand` | Since: | 4.3-alpha |
| Shell mode: | all | Default: | off (unless changed on compile-time with `–enable-direxpand-default`) |

If set, bash replaces directory names with the results of word expansion when performing filename completion. This changes the contents of the readline editing buffer. If not set, bash attempts to preserve what the user typed.

### dirspell[](#dirspell)

| Option: | `dirspell` | Since: | 4.0-alpha |
| Shell mode: | all | Default: | off |

If set, Bash will perform spelling corrections on directory names to match a glob.

### dotglob[](#dotglob)

| Option: | `dotglob` | Since: | unknown |
| Shell mode: | all | Default: | off |

If set, Bash includes filenames beginning with a `.` (dot) in the results of [pathname expansion](/syntax/expansion/globs "syntax:expansion:globs").

### execfail[](#execfail)

| Option: | `execfail` | Since: | unknown |
| Shell mode: | non-interactive | Default: | off |

If set, a non-interactive shell will not exit if it cannot execute the file specified as an argument to the `exec`-builtin command. An interactive shell does not exit if `exec` fails.

### expand_aliases[](#expand_aliases)

| Option: | `expand_aliases` | Since: | unknown |
| Shell mode: | all | Default: | on (interactive), off (non-interactive) |

If set, aliases are expanded. This option is enabled by default for interactive shells.

### extdebug[](#extdebug)

| Option: | `extdebug` | Since: | 3.0-alpha |
| Shell mode: | all | Default: | off |

If set, behavior intended for use by debuggers is enabled.

### extglob[](#extglob)

| Option: | `extglob` | Since: | 2.02-alpha1 |
| Shell mode: | all | Default: | off |

If set, the extended [pattern matching](/syntax/pattern "syntax:pattern") features are enabled. See the important note below under [Parser configurations](#parser_configurations "internals:shell_options ↵").

### extquote[](#extquote)

| Option: | `extquote` | Since: | 3.0-alpha (?) |
| Shell mode: | all | Default: | on |

If set, `$'string'` and `$"string"` quoting is performed within [parameter expansions](/syntax/pe "syntax:pe") enclosed in double quotes. See the important note below under [Parser configurations](#parser_configurations "internals:shell_options ↵").

### failglob[](#failglob)

| Option: | `failglob` | Since: | 3.0-alpha |
| Shell mode: | all | Default: | off |

If set, patterns which fail to match filenames during pathname expansion result in an error message.

### force_fignore[](#force_fignore)

| Option: | `force_fignore` | Since: | 3.0-alpha |
| Shell mode: | interactive (?) | Default: | on |

If set, the suffixes specified by the [FIGNORE](/syntax/shellvars#fignore "syntax:shellvars") shell variable cause words to be ignored when performing word completion even if the ignored words are the only possible completions. This option is enabled by default.

### globasciiranges[](#globasciiranges)

| Option: | `globasciiranges` | Since: | 4.3-alpha |
| Shell mode: | all | Default: | off |

If set, range expressions used in pattern matching behave as if in the traditional C locale when performing comparisons. That is, the current locale's collating sequence is not taken into account, so b will not collate between A and B, and upper-case and lower-case ASCII characters will collate together.

### globstar[](#globstar)

| Option: | `globstar` | Since: | 4.0-alpha |
| Shell mode: | all | Default: | off |

If set, recursive globbing with `**` is enabled.

### gnu_errfmt[](#gnu_errfmt)

| Option: | `gnu_errfmt` | Since: | 3.0-alpha |
| Shell mode: | all | Default: | off |

If set, shell error messages are written in the "standard GNU error message format".

### histappend[](#histappend)

| Option: | `histappend` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, the history list is appended to the file named by the value of the [HISTFILE](/syntax/shellvars#histfile "syntax:shellvars") variable when the shell exits, rather than overwriting the file.

### histreedit[](#histreedit)

| Option: | `histreedit` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, and readline is being used, a user is given the opportunity to re-edit a failed history substitution.

### histverify[](#histverify)

| Option: | `histverify` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

Allow to review a history substitution result by loading the resulting line into the editing buffer, rather than directly executing it.

### hostcomplete[](#hostcomplete)

| Option: | `hostcomplete` | Since: | 2.0-alpha3 |
| Shell mode: | interactive (?) | Default: | on |

If set, Bash completion also completes hostnames. On by default.

### huponexit[](#huponexit)

| Option: | `huponexit` | Since: | 2.02-alpha1 |
| Shell mode: | interactive login | Default: | off |

If set, Bash will send the `SIGHUP` signal to all jobs when an interactive login shell exits.

### interactive_comments[](#interactive_comments)

| Option: | `interactive_comments` | Since: | unknown |
| Shell mode: | interactive | Default: | on |

Allow [commenting](/scripting/basics#comments "scripting:basics") in interactive shells, on by default.

### lastpipe[](#lastpipe)

| Option: | `lastpipe` | Since: | 4.2-alpha |
| Shell mode: | all | Default: | off |

If set, __and job control is not active__, the shell runs the last command of a pipeline not executed in the background in the current shell environment.

### lithist[](#lithist)

| Option: | `lithist` | Since: | unknown |
| Shell mode: | interactive | Default: | off |

If set, and the [cmdhist](#cmdhist "internals:shell_options ↵") option is enabled, multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.

### login_shell[](#login_shell)

| Option: | `login_shell` | Since: | 2.05a-alpha1 |
| Shell mode: | all | Default: | n/a |

The option is set when Bash is a login shell. This is a readonly option.

### mailwarn[](#mailwarn)

| Option: | `mailwarn` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, and a file that Bash is checking for mail has been accessed since the last time it was checked, the message "The mail in mailfile has been read" is displayed.

### no\_empty\_cmd_completion[](#no_empty_cmd_completion)

| Option: | `mailwarn` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, and readline is being used, Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line.

### nocaseglob[](#nocaseglob)

| Option: | `nocaseglob` | Since: | 2.02-alpha1 |
| Shell mode: | interactive (?) | Default: | off |

If set, Bash matches filenames in a case-insensitive fashion when performing pathname expansion.

### nocasematch[](#nocasematch)

| Option: | `nocasematch` | Since: | 3.1-alpha1 |
| Shell mode: | interactive (?) | Default: | off |

If set, Bash matches patterns in a case-insensitive fashion when performing matching while executing `case` or `[[` conditional commands.

### nullglob[](#nullglob)

| Option: | `nullglob` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, Bash allows patterns which match no files to expand to a null string, rather than themselves.

### progcomp[](#progcomp)

| Option: | `progcomp` | Since: | 2.04-alpha1 |
| Shell mode: | interactive (?) | Default: | on |

If set, the programmable completion facilities are enabled. This option is enabled by default.

### promptvars[](#promptvars)

| Option: | `promptvars` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | on |

If set, prompt strings undergo parameter expansion, command substitution, arithmetic expansion, and quote removal after being expanded using the prompt special sequences. This option is enabled by default.

### restricted_shell[](#restricted_shell)

| Option: | `restricted_shell` | Since: | 2.03-alpha |
| Shell mode: | interactive (?) | Default: | off |

The option is set when Bash is a restricted shell. This is a readonly option.

### shift_verbose[](#shift_verbose)

| Option: | `shift_verbose` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | off |

If set, the shift builtin prints an error message when the shift count exceeds the number of positional parameters.

### sourcepath[](#sourcepath)

| Option: | `sourcepath` | Since: | unknown |
| Shell mode: | interactive (?) | Default: | on |

If set, the source builtin command uses the value of PATH to find the directory containing the file supplied as an argument. This option is enabled by default.

### xpg_echo[](#xpg_echo)

| Option: | `xpg_echo` | Since: | 2.04-beta1 |
| Shell mode: | interactive (?) | Default: | off |

If set, the `echo`-builtin command expands backslash-escape sequences by default (POSIX, SUS, XPG).

## Parser configurations[](#parser_configurations)

Parser configurations change the way the Bash parser recognizes the syntax when parsing a line. This, of course, is impossible for a line that already was parsed.

There are two options that influence the parsing this way:

-   `extglob`
    
-   `extquote`
    

Consequence: You __can't__ use the new syntax (e.g. the extended globbing syntax) and the command to enable it __in the same line__.

```
$ shopt -s extglob; echo !(*.txt) # this is the WRONG way!
-bash: syntax error near unexpected token `('
```

You have to configure the parser __before__ a line with new syntax is parsed:

```
$ shopt -s extglob # standalone - CORRECT way!
$ echo !(*.txt)
...
```

## See also[](#see_also)

-   Internal: [shopt builtin command](/commands/builtin/shopt "commands:builtin:shopt")
    
-   Internal: [set builtin command](/commands/builtin/set "commands:builtin:set")
    

## Discussion[](#discussion)

Juanma, 2015/04/17 14:21

The `compat*` variables are mentioned but not documented. My guess is that turning one of them on brings Bash to the behavior expected in that version. Am I right? I'm wondering because I can't make the regexp operator (`=~`) work as I expect, which means __not__ doing this:

```
\# re='\[\[:blank:\]\]*'; if \[\[ 'z' =~ $re \]\]; then echo "match!"; fi
match!
```

or even this:

```
\# re='\[ \]*'; if \[\[ 'z' =~ $re \]\]; then echo "match!"; fi
match!
```

Thanks to anyone willing to help.

Levi, 2015/08/21 12:07

You're matching the null string in front of and behind the 'z'. To get it to work properly, try:

```
$ re='^\[\[:blank:\]\]*$'; if \[\[ 'z' =~ $re \]\]; then echo "match!"; fi
$ re='^\[ \]*$'; if \[\[ 'z' =~ $re \]\]; then echo "match!"; fi</pre>
```

Now the anchors will match the nothingness and the rest will have to match whatever's in between.

There's a very similar case in the camel book, which comes with a footnote saying:

> Don’t feel bad. Even the authors get caught by this from time to time.

You could leave a comment if you were logged in.
