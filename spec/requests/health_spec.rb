require 'rails_helper'

# Para crear pruebas de integración de esta manera se usa rspec
# describe es para agregarle un nombrea a la prueba
# poniendo el type es para que rspec nos proporcione los metodos adecuados para esta prueba
# El health endpoint sirve para probar que el sistema funciona y responde correctamente
RSpec.describe "Health endpoint", type: :request do
  # Describe indica el contexto de la prueba
  describe "GET /health" do
    # Este indica que antes de cada prueba se ejecute el get a health
    before { get '/health'}
    # Las pruebas comienzan con it y en el string se pone lo que se espera de la prueba o lo que debería retornar
    it "should return OK" do
      #expect lo proporciona rspec y es lo que se espera que suceda
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload['api']).to eq('OK')
    end

    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end