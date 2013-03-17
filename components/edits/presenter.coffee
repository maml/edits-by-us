module.exports = class Edit
  constructor: (@model) ->

  toHash: ->
    {
      id        : @model.get '_id'
      userId    : @model.get 'userId'
      original  : @model.get 'original'
      modified  : @model.get 'modified'
      accepted  : @model.get 'accepted'
      createdAt : @model.get 'createdAt'
    }