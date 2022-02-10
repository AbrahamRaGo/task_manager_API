require 'rails_helper'

RSpec.describe "Categories endpoint", type: :request do

#* Metodo GET para listar y mostrar
  describe "GET /caegories" do
    describe "Response without data in db" do
      before { get '/categories'}
      it "should return OK" do
        payload = JSON.parse(response.body)
        expect(payload).to be_empty
        expect(response).to have_http_status(200)
      end
    end
    describe "Response with data in db" do
      # ? con el signo de adminracion se indica que se ejecute early, sino se pone se ejecutaria hasta que la variable categories sea utilizada
      let!(:categories) { create_list(:category, 5) }
      before { get '/categories'}
      it "should return OK" do
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(categories.size)
        expect(response).to have_http_status(200)
      end
    end
  end
  describe "GET /categories/{id}" do
    # ? let es de rspect y create es de factory_bot
    let!(:category) { create(:category) }
    before {get "/categories/#{category.id}"}
    it "should return a category" do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).to eq(category.id)
      expect(response).to have_http_status(200)
    end
  end

#* Metodo POST y PUT para crear y editar
  describe "POST /categories" do
    it "should create a category" do
      req_payload = {
        category: {
          name: "Mi categoria",
          description: "Esta es la descripcion"
        }
      }

      post "/categories", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).not_to be_nil
      expect(response).to have_http_status(:ok)
    end

    it "should return error message on invalid category" do
      req_payload = {
        category: {
          description: "Esta es la descripcion"
        }
      }

      post "/categories", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["error"]).not_to be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe "PUT /categories{id}" do
    let!(:category) {create(:category)}

    it "should update a category" do
      req_payload = {
        category: {
          name: "Mi categoria",
          description: "Esta es la descripcion"
        }
      }

      put "/categories/#{category.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).to eq(category.id)
      expect(response).to have_http_status(:ok)
    end

    it "should return error message on invalid category" do
      req_payload = {
        category: {
          name: nil,
          description: "Esta es la descripcion"
        }
      }

      put "/categories/#{category.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["error"]).not_to be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

#* Metodo DELETE
  describe "DEELETE /categories/{id}" do
    let!(:category) { create(:category) }

    it "should delete a category" do
      delete "/categories/#{category.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end