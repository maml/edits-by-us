Base           = require "#{ process.env.APP_ROOT }/core/lib/models/base"
bcrypt         = require 'bcrypt'
UserStore      = require './datastore'
{pick, extend} = require 'underscore'

WHITELISTED_ATTRIBUTES = [
  'email'
  'lastName'
  'firstName'
]

module.exports = class User extends Base
  @findById: (id, cb) ->
    UserStore.findOne { _id: id }, (err, record) ->
      return cb err if err?
      return cb() unless record?

      cb null, (new User record)

  constructor: (@attributes={}) ->

  save: (cb) =>
    {password} = (attributes = @attributes)

    bcrypt.hash password, 10, (err, hash) ->
      return cb err if err?

      user = extend (whitelist attributes), { hashedPassword: hash }
      (new UserStore user).save cb

  whitelist = (attributes) ->
    pick attributes, WHITELISTED_ATTRIBUTES...