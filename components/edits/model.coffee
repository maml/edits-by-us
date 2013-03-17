Base      = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{isEmpty} = require 'underscore'
EditStore = require './datastore'

module.exports = class Edit extends Base
  @findByUserIdAndId: (userId, editId, cb) ->
    EditStore
      .where('userId', userId)
      .where('_id', editId).exec (err, edit) ->
        return cb err if err?

        if isEmpty edit then cb() else cb null, (new Edit edit[0])

  constructor: (@attributes={}) ->

  save: (cb) =>
    (new EditStore @attributes).save cb
