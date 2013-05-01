module.exports = (Impromptu) ->
  @register 'pwd', ->
    process.env.PWD

  @register 'prettyPwd', ->
    cwd = process.env.PWD
    if cwd.indexOf process.env.HOME == 0
      cwd = '~' + cwd.slice process.env.HOME.length
    cwd

  @register 'user', (done) ->
    @exec 'whoami', done

  @register 'host', (done) ->
    @exec 'hostname', done

  @register 'shortHost', (done) ->
    @get 'host', (err, host) ->
      done err, host.split('.', 1)[0]
