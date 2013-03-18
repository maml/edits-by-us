User          = require './model'
UserPresenter = require './presenter'

exports.show = (req, res) ->
  {id} = req.params

  User.findById id, (err, user) ->
    return res.json 500, { message: 'There was an error while trying to find user' } if err?
    return res.json 404, { message: "No user with id #{ id } found" } unless user?

    renderUser user, 200, res


exports.create = (req, res) ->
  (new User req.body.user).save (err, user) ->
    return res.json 500, { message: 'An error occurred while trying to persist user' } if err?

    renderUser user, 201, res


###########
# PRIVATE #
###########

renderUser = (user, status, res) ->
  user = (new UserPresenter user).toHash()
  res.json status, { user }
