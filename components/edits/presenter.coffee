module.exports = class Edit
  constructor: (@model) ->

  toHash: ->
    {
      id        : @model.get '_id'
      userId    : @model.get 'userId'
      authorId  : @model.get 'authorId'
      original  : @model.get 'original'
      modified  : @model.get 'modified'
      accepted  : @model.get 'accepted'
      rejected  : @model.get 'rejected'
      createdAt : @model.get 'createdAt'
      permalink : @model.get 'permalink'
    }