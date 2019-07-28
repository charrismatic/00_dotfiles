
/// Removes both single and multi-line comments
/// Compatible with CSS3, HTML, JSON5 and ECMAScript 6
/// ```
/// var strip = require('gulp-strip-comments');
/// const strip_comments = function( module ) {
///   return gulp.src(module.src)
///     .pipe(strip())
///     .pipe(gulp.dest(module.dest));
/// }
/// ```


// Datestamp for cache busting
const getTimestamp = function() {
  var myDate = new Date();
  var myYear = myDate.getFullYear().toString();
  var myMonth = ('0' + (myDate.getMonth() + 1)).slice(-2);
  var myDay = ('0' + myDate.getDate()).slice(-2);
  var mySeconds = myDate.getSeconds().toString();

  var myFullDate = myYear + myMonth + myDay + mySeconds;
  return myFullDate;
};



/// gulp.task('version', 'prints the version.', [], function () {
///   // ...
/// }, {
///   aliases: ['v', 'V'],
///   options: {
///     'env=prod': 'description of env, ',
///     'key=val': 'description of key & val',
///     'key': 'description of key'
///   }
/// });

gulp.task('tree', (cb) => {
  console.log(gulp.tree({ deep:true }));
  cb();
});




// COPY FILES FROM X TO Y
const copy_files = function ( filelist ) {
  gutil.log(gutil.colors.red('\n\n ## Copying Files ##'));
  gutil.log(gutil.colors.yellow(filelist.src), gutil.colors.blue('-->' ), gutil.colors.red(filelist.dest), '\n');

  return gulp.src( filelist.src , {base: '.'})
    .pipe(gulp.dest(filelist.dest));
};

// REMOVES FILES AND FOLDERS
const clean_files = function ( path ) {
  gutil.log(gutil.colors.red('\n\n ## REMOVING Files ##'));
  gutil.log(gutil.colors.yellow(path.src));

  return gulp.src( path.src, {read: false} )
    .pipe(clean(path.src));
}

const log = function ( msg, level='info' ) {
  switch (level) {
  case 'info':
    gutil.log(gutil.colors.green(msg));
    break;
  default:
    gutil.log(gutil.colors.green('Watching Scripts at ') + gutil.colors.underline.blue(script) + '\n');
  }
  return;
};

const file = function ( path ) {
  return new gutil.File({
    path: path
  });
};


// utility function to exclude files from globs
const exclude = function(providedPath){
  return '!' + providedPath;
};


// utility function that filters out empty directories
// reference: http://stackoverflow.com/questions/23719731/gulp-copying-empty-directories
const filterEmptyDirectories = function(es){
  return es.map((file, cb) =>{
    if(file.stat.isFile()){
      return cb(null, file);
    } else{
      return cb();
    }
  });
};


// gulp.task('version', 'prints the version.', [], function () {
//   // ...
// }, {
//   aliases: ['v', 'V'],
//   options: {
//     'env=prod': 'description of env, ',
//     'key=val': 'description of key & val',
//     'key': 'description of key'
//   }
// });

// PARSE USER INPUT AS STDIN ARGS FROM COMMAND LINE
//
// ## EXAMPLE
// ```
// gulp test:args --a 1 --env 'prod'
//
// // RESULTS
// { a: '1', env: 'prod' }
// ```
//
// ## EXAMPLE
// ```
// gulp.task('deploy', () => {
//   let
//     ftp = require('vinyl-ftp'),
//     conn = ftp.create({
//       host      : 'mysite.com',
//       user      : arg.user || arg.u,      // command line option
//       password  : arg.password || arg.p,  // command line option
//       parallel  : 5
//     }),
//     glob = [
//       'build/**/*'
//     ],
//     src = {
//       base      : 'build/',
//       buffer    : false
//     },
//     remotePath = '/public_html/';
//
//   return gulp.src(glob, src)
//     .pipe(conn.newerOrDifferentSize(remotePath))
//     .pipe(conn.dest(remotePath));
// });
// ```

'use strict';
const gulp = require('gulp');

// fetch command line arguments
const args = (argList => {
  let args = {}, a, opt, thisOpt, curOpt;
  for (a = 0; a < argList.length; a++) {
    thisOpt = argList[a].trim();
    opt = thisOpt.replace(/^-+/, '');
    // argument value
    if (opt === thisOpt) {
      if (curOpt) args[curOpt] = opt;
      curOpt = null;
    } else {
      // argument name
      curOpt = opt;
      args[curOpt] = true;
    }
  }
  return args;
})(process.argv);
// ====================

module.exports = {
  copy_files: copy_files,
  clean_files: clean_files,
  log: log,
  file: file,
  timestamp: getTimestamp,
  _if: gif,
  rename: rename,
  plumber: plumber,
  open_pipe: plumbed_pipe,
  shut_pipe: plumber.stop
};
