{APP_ROOT}   = process.env
{isFunction} = require 'underscore'

Path = require 'path'
app  = do require "#{ APP_ROOT }/core/lib/app"

requireController = (component) ->
  require "#{ APP_ROOT }/components/#{ component }/controller"

namespace = (namespace, func) ->
  routeMethods = {}

  for verb in ['get', 'post', 'put', 'delete']
    routeMethods[verb] = do (verb) ->
      (path, cb) ->
        fullPath = "/#{ namespace }"

        if isFunction path
          cb = path
        else
          fullPath = Path.normalize "#{ fullPath }/#{ path }"

        app[verb] fullPath, cb

  func(routeMethods)

module.exports = { namespace, requireController }