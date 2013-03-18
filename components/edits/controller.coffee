Edit              = require './model'
EditPresenter     = require './presenter'
{extend, isEmpty} = require 'underscore'

exports.create = (req, res) ->
  (new Edit req.body.edit).save (err, edit) ->
    return res.json 500, { message: 'An error occurred while tryingt to persist edit' } if err?

    renderEdit edit, 201, res

exports.show = (req, res) ->
  {id} = req.params

  Edit.findById id, (err, edit) ->
    return res.json 500, { message: 'There was an error while trying to find edit' } if err?
    return res.json 404, { message: "No Edit with id #{ id } found" } unless edit?

    renderEdit edit, 200, res


exports.userEdits = (req, res) ->
  {id} = req.params

  Edit.findAllByUserId id, (err, edits) ->
    return res.json 500, { error: "An error occurred while looking up edits for user with id #{ id }" } if err?
    return res.json 200, { edits } if isEmpty edits

    edits = ((new EditPresenter edit).toHash() for edit in edits)
    res.json 200, { edits }


###########
# PRIVATE #
###########

renderEdit = (edit, status, res) ->
  edit = (new EditPresenter edit).toHash()
  res.json status, { edit }
