Base      = require "#{ process.env.APP_ROOT }/core/lib/models/base"
{isEmpty} = require 'underscore'
EditStore = require './datastore'

module.exports = class Edit extends Base
  @findById: (id, cb) ->
    EditStore.findOne { _id: id }, (err, record) ->
      return cb err if err?
      return cb() unless record?

      cb null, (new Edit record)

  @findAllByUserId: (id, cb) ->
    EditStore.where('userId', id).exec (err, records) ->
      return cb err if err?
      edits = ((new Edit record) for record in records)

      cb null, edits ? []

  constructor: (@attributes={}) ->

  save: (cb) =>
    (new EditStore @attributes).save cb
