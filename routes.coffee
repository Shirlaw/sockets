routes = (app, mongoose, Patient) ->

  app.get '/', (req,res) ->
    res.render "index"

  app.get "/patients", (req, res) ->
    Patient.find (err, patients) ->
      res.send patients

module.exports = routes