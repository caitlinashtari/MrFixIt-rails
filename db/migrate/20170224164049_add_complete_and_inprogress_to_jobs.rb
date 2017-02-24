class AddCompleteAndInprogressToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :in_progress, :boolean, :default => false
  end
end
