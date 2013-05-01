module.exports = (Impromptu, register, system) ->
  register 'pwd',
    update: ->
      process.env.PWD

  register 'prettyPwd',
    update: ->
      cwd = process.env.PWD
      if cwd.indexOf process.env.HOME == 0
        cwd = '~' + cwd.slice process.env.HOME.length
      cwd

  register 'user',
    update: (done) ->
      Impromptu.exec 'whoami', done

  register 'host',
    update: (done) ->
      Impromptu.exec 'hostname', done

  register 'shortHost',
    update: (done) ->
      system.host (err, host) ->
        done err, host.split('.', 1)[0]
