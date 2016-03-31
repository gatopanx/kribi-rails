class CreateEngineGasReadings < Kribi::Migration
  def change
    create_table :engine_gas_readings do |t|
      t.references :engine, index: true, foreign_key: true
      t.datetime :target_datetime
      create_relative_counter_value_columns(t, :counter_value)
      t.integer :gas_volume
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
