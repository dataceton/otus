Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      column :username, String, null: false, unique: true
      column :first_name, String, null: false
      column :last_name, String, null: false
      column :email, String, null: false, unique: true
      column :phone, String, null: false, unique: true
    end
  end
end