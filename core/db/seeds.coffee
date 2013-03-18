async = require 'async'

{ APP_ROOT } = process.env

User = require "#{ APP_ROOT }/components/users/datastore"
Edit = require "#{ APP_ROOT }/components/edits/datastore"

console.log 'Seeding database...'

deleteUsers = (cb) ->
  User.remove (err, count) ->
    cb err if err?
    console.log "Removed #{count} records from User table"
    cb null

users = (cb) ->
  deleteUsers (err) ->
    cb err if err?

    dudes = [['Trey', 'Anastasio'], ['Mike', 'Gordon'], ['Jon', 'Fishman'], ['Page', 'McConnell']]

    save = ([first, last], cb) ->
      user =
        lastName  : last
        firstName : first
        email     : "#{ first }@#{ last }.com"

      (new User user).save cb

    async.each dudes, save, cb

deleteEdits = (cb) ->
  Edit.remove (err, count) ->
    cb err if err?
    console.log "Removed #{count} records from Edit table"
    cb null

edits = (cb) ->
  deleteEdits (err) ->
    cb err if err?

    User.find (err, users) ->
      return cb err if err?

      save = (user, cb) ->
        edit =
          userId: user.get('_id')
          authorId: user.get('_id')
          original: "My first name is #{ user.get('lastName') }"
          modified: "My last name is #{ user.get('lastName') }"
          permalink: "http://stuff.com/stuff-#{ user.get('_id') }"

        (new Edit edit).save cb

      async.each users, save, cb

async.series [
  users
  edits
], (err) ->
  throw err if err?

  console.log "Seeded DB"
  process.exit 0
