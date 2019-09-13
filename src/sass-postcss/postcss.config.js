var postcss = require('postcss');
var svgo = require('postcss-svgo');

var opts = {
  plugins: [
    { removeDoctype: false },
    { removeComments: false },
    { cleanupNumericValues: { floatPrecision: 2 } },
    { convertColors: {
        names2hex: false,
        rgb2hex: false
      }
    }
  ]
};

postcss([ svgo(opts) ])
  .process(css)
  .then(function (result) {
    console.log(result.css)
  });
