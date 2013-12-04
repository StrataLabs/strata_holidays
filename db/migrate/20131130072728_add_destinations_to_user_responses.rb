class AddDestinationsToUserResponses < ActiveRecord::Migration
  def change
    add_column :user_responses, :destinations, :string
  end
end
