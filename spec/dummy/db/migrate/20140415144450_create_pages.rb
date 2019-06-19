active_record_migration_class =
  if Rails::VERSION::STRING[0..2].to_f >= 5
    ActiveRecord::Migration[Rails::VERSION::STRING[0..2].to_f]
  else
    ActiveRecord::Migration
  end

class CreatePages < active_record_migration_class
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
