module.exports = class User
  constructor: (@user) ->

  toHash: ->
    {
      id        : @user.get '_id'
      email     : @user.get 'email'
      lastName  : @user.get 'lastName'
      createdAt : @user.get 'createdAt'
      firstName : @user.get 'firstName'
    }