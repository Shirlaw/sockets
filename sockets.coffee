routes = (io, Patient) ->
  io.on "connection", (socket) ->

    Patient.find (err, patients) ->
      socket.emit "patients", patients

    socket.on "delete", (patient) ->
      Patient.remove { _id: patient.id }, (err) ->
        if err
          return handleError(err)

    socket.on 'create_patient', ->
      Patient.create { size: 'small' }, (err, patient) =>
        if err
          return handleError(err)
        socket.emit "load_patient", patient

module.exports = routes
