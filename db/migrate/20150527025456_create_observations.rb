class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.date :dateObserved
      t.integer :hourObserved
      t.string :localTimeZone
      t.string :reportingArea
      t.string :stateCode
      t.float :latitude
      t.float :longitude
      t.string :parameterName
      t.integer :aqi
      t.integer :categoryNumber
      t.string :categoryName

      t.timestamps null: false
    end
  end
end
