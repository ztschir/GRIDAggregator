# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120412220020) do

  create_table "channel_imports", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "receiver_week_number"
    t.float    "receiver_seconds_of_week"
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.float    "apparent_doppler"
    t.float    "beat_carrier_phase"
    t.float    "pseudorange"
    t.float    "carrier_to_noise_ratio"
    t.boolean  "is_valid_pseudorange_and_phase"
    t.boolean  "is_anomaly_detected"
    t.integer  "channel_status_id"
    t.integer  "signal_type_id"
    t.integer  "transmitter_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "channel_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "channel_statuses", ["name"], :name => "channel_status_unique_values", :unique => true

  create_table "channels", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "receiver_time_id"
    t.integer  "offset_time_id"
    t.integer  "channel_status_id"
    t.integer  "signal_type_id"
    t.integer  "transmitter_id"
    t.float    "apparent_doppler"
    t.float    "beat_carrier_phase"
    t.float    "pseudorange"
    t.float    "carrier_to_noise_ratio"
    t.boolean  "is_valid_pseudorange_and_phase"
    t.boolean  "is_anomaly_detected"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "channels", ["receiver_id", "offset_time_id", "signal_type_id", "transmitter_id"], :name => "channels_unique_values", :unique => true

  create_table "ionosphere_imports", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.float    "pseudorange_derived_stec"
    t.float    "pseudorange_derived_stec_dot"
    t.integer  "transmitter_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "ionospheres", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_time_id"
    t.float    "pseudorange_derived_stec"
    t.float    "pseudorange_derived_stec_dot"
    t.integer  "transmitter_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "ionospheres", ["receiver_id", "offset_time_id", "transmitter_id"], :name => "ionospheres_unique_values", :unique => true

  create_table "leap_seconds", :force => true do |t|
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "navigation_imports", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.float    "x_position"
    t.float    "y_position"
    t.float    "z_position"
    t.float    "delta_receiver_clock_error"
    t.float    "x_velocity"
    t.float    "y_velocity"
    t.float    "z_velocity"
    t.float    "delta_receiver_clock_error_dot"
    t.integer  "navigation_solver_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "navigation_solutions", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "navigation_solver_id"
    t.integer  "offset_time_id"
    t.float    "x_position"
    t.float    "y_position"
    t.float    "z_position"
    t.float    "delta_receiver_clock_error"
    t.float    "x_velocity"
    t.float    "y_velocity"
    t.float    "z_velocity"
    t.float    "delta_receiver_clock_error_dot"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "navigation_solutions", ["receiver_id", "offset_time_id"], :name => "navigation_solution_unique_values", :unique => true

  create_table "navigation_solvers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "navigation_solvers", ["name"], :name => "navigation_solvers_unique_values", :unique => true

  create_table "offset_times", :force => true do |t|
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.datetime "utc_time"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "offset_times", ["offset_week_number", "offset_whole_seconds_of_week", "offset_fractional_second"], :name => "offset_time_unique_values", :unique => true

  create_table "receiver_times", :force => true do |t|
    t.integer  "receiver_week_number"
    t.float    "receiver_seconds_of_week"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "receiver_times", ["receiver_week_number", "receiver_seconds_of_week"], :name => "receiver_time_unique_values", :unique => true

  create_table "receivers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "receivers", ["name"], :name => "receivers_unique_values", :unique => true

  create_table "scintillation_imports", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.float    "measurement_interval_length"
    t.float    "s4_whole_interval"
    t.float    "s4_first_half_interval"
    t.float    "s4_second_half_interval"
    t.float    "sigma_phi_whole_interval"
    t.float    "sigma_phi_first_half_interval"
    t.float    "sigma_phi_second_half_interval"
    t.float    "tau0"
    t.float    "scintillation_power_ratio"
    t.integer  "reference_channel_indicator"
    t.integer  "signal_type_id"
    t.integer  "transmitter_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "scintillations", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_time_id"
    t.float    "measurement_interval_length"
    t.float    "s4_whole_interval"
    t.float    "s4_first_half_interval"
    t.float    "s4_second_half_interval"
    t.float    "sigma_phi_whole_interval"
    t.float    "sigma_phi_first_half_interval"
    t.float    "sigma_phi_second_half_interval"
    t.float    "tau0"
    t.float    "scintillation_power_ratio"
    t.integer  "reference_channel_indicator"
    t.integer  "signal_type_id"
    t.integer  "transmitter_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "scintillations", ["receiver_id", "offset_time_id", "signal_type_id", "transmitter_id"], :name => "scintillations_unique_values", :unique => true

  create_table "signal_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "signal_types", ["name"], :name => "signal_type_unique_values", :unique => true

  create_table "system_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "system_types", ["name"], :name => "system_type_unique_values", :unique => true

  create_table "transmitter_imports", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_week_number"
    t.integer  "offset_whole_seconds_of_week"
    t.float    "offset_fractional_second"
    t.float    "azmiuth"
    t.float    "elevation"
    t.integer  "health_status_id"
    t.integer  "transmitter_system_id"
    t.integer  "transmitter_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "transmitters", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "offset_time_id"
    t.float    "azmiuth"
    t.float    "elevation"
    t.integer  "health_status_id"
    t.integer  "transmitter_system_id"
    t.integer  "transmitter_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "transmitters", ["receiver_id", "offset_time_id", "transmitter_system_id", "transmitter_id"], :name => "transmitter_unique_values", :unique => true

end
