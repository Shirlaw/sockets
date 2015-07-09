routes = (io, Patient) ->
  io.on "connection", (socket) ->

    Patient.find (err, patients) ->
      socket.emit "patients", patients

    socket.on "delete", (patient) ->
      Patient.remove { _id: patient.id }, (err) ->
        if err
          return handleError(err)

module.exports = routes
