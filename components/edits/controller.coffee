Edit          = require './model'
{extend}      = require 'underscore'
EditPresenter = require './presenter'

exports.create = (req, res) ->
  attributes = extend req.body.edit, { userId: req.params.userId.toString() }

  (new Edit attributes).save (err, edit) ->
    return res.json 500, { message: 'fuck it, sorry' } if err?

    res.json 201, { edit: (new EditPresenter edit).toHash() }

exports.show = (req, res) ->
  {id, userId} = req.params

  Edit.findByUserIdAndId userId, id, (err, edit) ->
    console.log edit
    return res.json 404, { message: "No Edit with id #{ id } found" } unless edit?

    res.json 200, { edit: (new EditPresenter edit).toHash() }

