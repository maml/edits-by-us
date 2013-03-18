{ APP_ROOT, RESOURCE } = process.env

User = require "#{ APP_ROOT }/components/users/datastore"
Edit = require "#{ APP_ROOT }/components/edits/datastore"

{

  users: ->
    User.find (_, users) ->
      console.log users
      process.exit 0

  edits: ->
    Edit.find (_, edits) ->
      console.log edits
      process.exit 0

}[RESOURCE]()
