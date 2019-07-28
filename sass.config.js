//  GET ALL OPTIONS TO THE CONFIG FILE EASIELY
// node-sass --help | grep -e "\-\-[^ ]*" --color --only-matching >> .lib/sass.config.js


const sassconfig = {
  output_style: 'compact',
  indent_type: 'type',
  indent_width: 2,
  linefeed: 'lf',
  src: 'source/styles/styles.scss',
  dest: ''
};

// STYLGUIDE OPTIONS
// output-style: 'expanded',

// WATCH TASK OPTIONS
// watch: true
// recursive: true

// source-map
// source-map-contents
// omit-source-map-url
// source-comments
// source-map-embed
// source-map-root

// output-style
// SOURCEMAP
// indented-syntax
// quiet
// include-path
// follow
// precision
// error-bell
// importer
// functions

module.exports = sassconfig;
