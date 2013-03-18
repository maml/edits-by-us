{ mongoose, db } = require "#{ process.env.APP_ROOT }/core/db"

UserSchema = new mongoose.Schema
  email          : String
  lastName       : String
  firstName      : String
  createdAt      : { type: Date, default: (-> new Date) }
  hashedPassword : String

module.exports = db.model('User', UserSchema)