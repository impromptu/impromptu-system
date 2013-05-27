module.exports = (Impromptu, register, system) ->
  register 'pwd',
    update: ->
      process.env.PWD

  register 'prettyPwd',
    update: ->
      cwd = process.env.PWD
      if cwd.indexOf(process.env.HOME) == 0
        cwd = '~' + cwd.slice process.env.HOME.length
      cwd

  register 'user',
    update: ->
      process.env.USER

  register 'host',
    update: (done) ->
      Impromptu.exec 'hostname', done

  register 'shortHost',
    update: (done) ->
      system.host (err, host) ->
        done err, host.split('.', 1)[0]

  register 'jobsCount',
    update: ->
      parseInt process.env.IMPROMPTU_JOBS_COUNT, 10

  register 'lastExitCode',
    update: ->
      parseInt process.env.IMPROMPTU_LAST_EXIT_CODE, 10
