{APP_ROOT} = process.env

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users = requireController 'users'
Edits = requireController 'edits'

##########
# ROUTES #
##########

namespace 'users', ({ get, post }) ->
  get '/:id', Users.show
  get '/:userId/edits/:id', Edits.show

  post '/', Users.create
  post '/:userId/edits', Edits.create
