impromptu = require 'impromptu'

module.exports = impromptu.plugin.create (system) ->
  system.register 'pwd',
    update: ->
      process.env.PWD

  system.register 'prettyPwd',
    update: ->
      cwd = process.env.PWD
      if cwd.indexOf(process.env.HOME) == 0
        cwd = '~' + cwd.slice process.env.HOME.length
      cwd

  system.register 'user',
    update: ->
      process.env.USER

  system.register 'host',
    update: (done) ->
      impromptu.exec 'hostname', done

  system.register 'shortHost',
    update: (done) ->
      system.host (err, host) ->
        done err, host.split('.', 1)[0]

  system.register 'jobsCount',
    update: ->
      parseInt process.env.IMPROMPTU_JOBS_COUNT, 10

  system.register 'lastExitCode',
    update: ->
      parseInt process.env.IMPROMPTU_LAST_EXIT_CODE, 10
