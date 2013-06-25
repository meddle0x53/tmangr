Handlebars.registerHelper 'submitButton', (text) ->
  return new Handlebars.SafeString('<button type="submit" class="btn btn-primary">' + text + '</button>')

Handlebars.registerHelper "debug", (optionalValue) ->
  console.log("Current Context")
  console.log("====================")
  console.log(@)
 
  if optionalValue
    console.log("Value")
    console.log("====================")
    console.log(optionalValue)

