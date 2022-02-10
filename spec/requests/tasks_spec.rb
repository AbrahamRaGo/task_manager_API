require 'rails_helper'
RSpec.describe "Tasks endpoint" , type: :request do
  #* Get para index
  describe "GET /tasks" do
    describe "Response without data in db" do
      before { get '/tasks'}
      it "shoul return OK" do
        payload = JSON.parse(response.body)
        expect(payload).to be_empty
        expect(response).to have_http_status(:ok)
      end
    end

    describe "Response with data in db" do
      let(:tasks) { create_list(:task, 5) }
      before { get '/tasks'}
      it "should return OK" do
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(tasks.size)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  #* get para show
  describe "GET /tasks/{id}" do
    let!(:task) { create(:task) }
    before { get "/tasks/#{task.id}"}
    it "should return a task" do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).to eq(category.id)
      expect(response).to have_http_status(:ok)
    end
  end

  #* metodo POST para crear
  describe "POST /tasks" do
    req_payload = {
      task:{
        name: "Mi tarea", 
        description: "La descripción",
        due_date: "2022-2-21"
      }
    }
  end
    #todo.... Hacer el metodo put
end



#todo.... Hacer el metodo delete