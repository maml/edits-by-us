{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

EditSchema = new mongoose.Schema
  userId    : String
  authorId  : String
  original  : String
  modified  : String
  accepted  : { type: Boolean, default: false }
  rejected  : { type: Boolean, default: false }
  createdAt : { type: Date, default: (-> new Date) }
  permalink : String

module.exports = db.model('Edit', EditSchema)