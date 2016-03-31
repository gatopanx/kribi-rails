class CreateEngineStatusChangeEvents < Kribi::Migration
  def change
    create_table :engine_status_change_events do |t|
      t.references :engine, index: true, foreign_key: true
      t.datetime :target_datetime
      t.float :duration_in_hours
      t.integer :type, default: 0
      t.integer :engine_mode, default: 0
      t.integer :derating_mode, default: 0
      t.float :load_limitation, default: 0
      t.integer :resolution_department, default: 0
      t.text :outage_description
      t.text :other_description
      t.integer :status, default: 0
      [
        :standard_daily,
        :standard_weekly,
        :standard_monthly,
        :standard_quarter,
        :standard_yearly,
        :customer_monthly
      ].each do |match_key_type|
        t.send(:string, "match_key_#{match_key_type}", index: true)
      end

      t.timestamps null: false
    end
  end
end