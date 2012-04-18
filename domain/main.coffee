# Nomad walks the file system.  Like a boss.
#
# Doesn't matter if it's a real file system, a file slug, version control, or a
# remote server.  Nomad is still in training, so he needs an accessStrategy and
# credentials.  In a future version, Nomad will simply kick in the door.
#
# Contract:
#
#   given:
#     accessStrategies
#     credentials
#
#   services:
#     loadApp:
#       in:
#         accessStrategy: String
#         appRoot: String
#
#       out:
#         rootNode: FsNode #object
#
given = {}

services =
  loadApp: (accessStrategy, appRoot, next) ->
    return next "#{accessStrategy} not supported" unless accessStrategy in @given.accessStrategies.keys()

    fs = accessStrategies[accessStrategy]
    fs.load appRoot, next

loader = (dependencies) ->
  @given = dependencies if dependencies?
  return services


module.exports = loader
