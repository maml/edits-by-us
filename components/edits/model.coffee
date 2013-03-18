Base      = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{isEmpty} = require 'underscore'
EditStore = require './datastore'

module.exports = class Edit extends Base
  @findById: (id, cb) ->
    EditStore.find({ _id: id }).exec (err, edit) ->
      return cb err if err?
      return cb() if isEmpty edit

      cb null, (new Edit edit[0])

  constructor: (@attributes={}) ->

  save: (cb) =>
    (new EditStore @attributes).save cb
