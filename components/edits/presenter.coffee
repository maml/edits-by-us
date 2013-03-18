module.exports = class Edit
  constructor: (@edit) ->

  toHash: ->
    {
      id        : @edit.get '_id'
      userId    : @edit.get 'userId'
      authorId  : @edit.get 'authorId'
      original  : @edit.get 'original'
      modified  : @edit.get 'modified'
      accepted  : @edit.get 'accepted'
      rejected  : @edit.get 'rejected'
      createdAt : @edit.get 'createdAt'
      permalink : @edit.get 'permalink'
    }