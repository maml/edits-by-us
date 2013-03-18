{APP_ROOT} = process.env

{requireController, namespace} = require "#{ APP_ROOT }/core/lib/route_helpers"

Users = requireController 'users'
Edits = requireController 'edits'

##########
# ROUTES #
##########

namespace 'users', ({ get, post }) ->
  get '/:id', Users.show
  post Users.create

namespace 'edits', ({ get, post }) ->
  get '/:id', Edits.show
  post Edits.create
