module.exports = [{
    "watch": [ "api", "config" ],
    "runOnChangeOnly": true,
    "ext": "js",
    "delay": "1500",
    "ignore": ["static"],
    "exec": "NODE_ENV=development node app.js --verbose"
  }, {
    "restartable": "rs",
    "ignore": [ ".git", "node_modules/**/node_modules" ],
    "verbose": true,
    "execMap": {
      "sync": "npm run sync"
    },
    "events": {
      "restart": `osascript -e 'dsplay notification
        App restarted due to:
        '[${FILENAME}' with title odemon`
    },
    "watch": [ "test/fixtures/", "test/samples/" ],
    "env": { "NODE_ENV": "development" },
    "assets/js": "js,js"
    }
]
