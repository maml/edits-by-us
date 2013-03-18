Edit          = require './model'
{extend}      = require 'underscore'
EditPresenter = require './presenter'

exports.create = (req, res) ->
  (new Edit req.body.edit).save (err, edit) ->
    return res.json 500, { message: 'An error occurred while tryingt to persist edit' } if err?

    res.json 201, { edit: (new EditPresenter edit).toHash() }

exports.show = (req, res) ->
  {id} = req.params

  Edit.findById id, (err, edit) ->
    return res.json 500, { message: 'There was an error while trying to find edit' } if err?
    return res.json 404, { message: "No Edit with id #{ id } found" } unless edit?

    res.json 200, { edit: (new EditPresenter edit).toHash() }

