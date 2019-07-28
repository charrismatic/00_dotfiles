# JSBEAUTIFY

github.com/beautify-web/js-beautify#options

CLI Options

```
 -f, --file       Input file(s) (Pass '-' for stdin)
 -r, --replace    Write output in-place, replacing input
 -o, --outfile    Write output to file (default stdout)
 --config         Path to config file
 --type           [js|css|html] ["js"]
 -q, --quiet      Suppress logging to stdout
 -h, --help       Show this help
 -v, --version    Show the version
```
Beautifier Options

```
   -s, --indent-size                 Indentation size [4]
   -c, --indent-char                 Indentation character [" "]
   -t, --indent-with-tabs            Indent with tabs, overrides -s and -c
   -e, --eol                         Character(s) to use as line terminators.
                                     [first newline in file, otherwise "\n]
   -n, --end-with-newline            End output with newline
   --editorconfig                    Use EditorConfig to set up the options
   -l, --indent-level                Initial indentation level [0]
   -p, --preserve-newlines           Preserve line-breaks (--no-preserve-newlines disables)
   -m, --max-preserve-newlines       Number of line-breaks to be preserved in one chunk [10]
   -P, --space-in-paren              Add padding spaces within paren, ie. f( a, b )
   -E, --space-in-empty-paren        Add a single space inside empty paren, ie. f( )
   -j, --jslint-happy                Enable jslint-stricter mode
   -a, --space-after-anon-function   Add a space before an anonymous function's parens, ie. function ()
   -b, --brace-style                 [collapse|expand|end-expand|none][,preserve-inline] [collapse,preserve-inline]
   -B, --break-chained-methods       Break chained method calls across subsequent lines
   -k, --keep-array-indentation      Preserve array indentation
   -x, --unescape-strings            Decode printable characters encoded in xNN notation
   -w, --wrap-line-length            Wrap lines at next opportunity after N characters [0]
   -X, --e4x                         Pass E4X xml literals through untouched
   --good-stuff                      Warm the cockles of Crockford's heart
   -C, --comma-first                 Put commas at the beginning of new line instead of end
   -O, --operator-position           Set operator position (before-newline|after-newline|preserve-newline) [before-newline]
```

Example configuration tree showing all the supported locations for language override nodes.
We'll use indent_size to discuss #how this configuration would behave,
but any number of settings can be inherited or overridden:

```
{
   "indent_size": 4,
   "html": {
       "end_with_newline": true,
       "js": {
           "indent_size": 2
       },
       "css": {
           "indent_size": 2
       }
   },
   "css": {
       "indent_size": 1
   },
   "js": {
      "preserve-newlines": true
   }
}
```

More Examples

```
{
    "indent_size": 4,
    "indent_char": " ",
    "indent_with_tabs": false,
    "eol": "\n",
    "end_with_newline": false,
    "indent_level": 0,
    "preserve_newlines": true,
    "max_preserve_newlines": 10,
    "space_in_paren": false,
    "space_in_empty_paren": false,
    "jslint_happy": false,
    "space_after_anon_function": false,
    "brace_style": "collapse",
    "break_chained_methods": false,
    "keep_array_indentation": false,
    "unescape_strings": false,
    "wrap_line_length": 0,
    "e4x": false,
    "comma_first": false,
    "operator_position": "before-newline"
    "eval_code": false,
    "space_before_conditional": true
}
```
