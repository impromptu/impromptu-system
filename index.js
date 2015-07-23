var impromptu = require('impromptu')

module.exports = impromptu.plugin.create(function (system) {
  system.register('pwd', {
    update: function() {
      return process.env.PWD
    }
  })

  system.register('prettyPwd', {
    update: function() {
      var cwd = process.env.PWD
      if (cwd.indexOf(process.env.HOME) === 0) {
        cwd = '~' + cwd.slice(process.env.HOME.length)
      }
      return cwd
    }
  })

  system.register('user', {
    update: function() {
      return process.env.USER
    }
  })

  system.register('host', {
    update: function(done) {
      impromptu.exec('hostname', done)
    }
  })

  system.register('shortHost', {
    update: function(done) {
      system.host(function (err, host) {
        done(err, host.split('.', 1)[0])
      })
    }
  })

  system.register('jobsCount', {
    update: function () {
      return parseInt(process.env.IMPROMPTU_JOBS_COUNT, 10)
    }
  })

  system.register('lastExitCode', {
    update: function () {
      return parseInt(process.env.IMPROMPTU_LAST_EXIT_CODE, 10)
    }
  })
})
