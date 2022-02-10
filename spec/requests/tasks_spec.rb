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
      let!(:tasks) { create_list(:task, 5)}
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
    let!(:task) {create(:task)}
    before { get "/tasks/#{task.id}"}
    it "should return a task" do
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).to eq(task.id)
      expect(payload["name"]).to eq(task.name)
      expect(payload["description"]).to eq(task.description)
      # expect(payload["users"]["id"]).to eq(task.participants.id)
      # expect(payload["users"]["name"]).to eq(task.participants.name)
      # expect(payload["users"]["email"]).to eq(task.participants.email)
      expect(response).to have_http_status(:ok)
    end
  end

  #* metodo POST para crear
  describe "POST /tasks" do
    let!(:category) { create(:category) }
    let!(:users) { create_list(:user, 3) }
    it "should create task" do
      req_payload = {
        task:{
          name: "Mi tarea", 
          description: "La descripción",
          due_date: "2022-2-21",
          category_id: category.id,
          user_id: users[0].id,
          finished: true,
          participating_users:{
            user_id: users[1].id,
            task_id: 3
          }
        }
      }

      post "/tasks", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).not_to be_nil
      expect(response).to have_http_status(:ok)
    end

    it "should return error message on invalid task" do
      req_payload = {
      task:{
        name: "Mi tarea", 
        description: "La descripción",
        due_date: "2022-2-21"
      }
    }

      post "/tasks", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["error"]).not_to be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  #* Metodo PUT para editar
  describe "PUT /tasks/{id}" do
    let!(:task) { create(:task)}
    it "should update task" do
      req_payload = {
        task:{
          name: "Mi tarea editada",
          description: "La descripción"
        }
      }

      put "/tasks/#{task.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["id"]).to eq(task.id)
      expect(response).to have_http_status(:ok)
    end

    it "should return error message on invalid task" do
      req_payload = {
        task:{
          name: nil,
          description: "La descripción"
        }
      }

      put "/tasks/#{task.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).not_to be_empty
      expect(payload["error"]).not_to be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  #* Metodo DELETE
  describe "DELETE /tasks" do
    let!(:task) { create(:task) }

    it "should delete a task" do
      delete "/tasks/#{task.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end


