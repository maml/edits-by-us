{APP_ROOT} = process.env

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users = requireController 'users'

##########
# ROUTES #
##########

namespace 'api', ({ get, post }) ->
  get '/users', Users.index
  get '/users/:id', Users.show
  post '/users', Users.create
