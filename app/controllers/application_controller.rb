class ApplicationController < ActionController::API
  def hello
    render html: "¡Hola, mundo!"
  end
end
