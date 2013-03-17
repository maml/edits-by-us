{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

EditSchema = new mongoose.Schema
  userId    : String
  original  : String
  modified  : String
  accepted  : Boolean
  createdAt : { type: Date, default: (-> new Date) }

module.exports = db.model('Edit', EditSchema)