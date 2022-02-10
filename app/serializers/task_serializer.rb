class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :finished #:users

  # def users
  #   participant = self.object.participants
  #   {
  #     id: participant.id,
  #     name: participant.name,
  #   }
  # end
  
end
