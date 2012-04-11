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

ActiveRecord::Schema.define(:version => 20120407194558) do

  create_table "channel_imports", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "receiverWeekNumber"
    t.float    "receiverSecondsOfWeek"
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.float    "apparentDoppler"
    t.float    "beatCarrierPhase"
    t.float    "pseudorange"
    t.float    "carrierToNoiseRatio"
    t.boolean  "isValidPseudorangeAndPhase"
    t.boolean  "isAnomalyDetected"
    t.integer  "channelStatusID"
    t.integer  "signalTypeID"
    t.integer  "transmitterID"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "channel_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "channels", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "receiverTimeID"
    t.integer  "offsetTimeID"
    t.integer  "channelStatusID"
    t.integer  "signalTypeID"
    t.integer  "transmitterID"
    t.float    "apparentDoppler"
    t.float    "beatCarrierPhase"
    t.float    "pseudorange"
    t.float    "carrierToNoiseRatio"
    t.boolean  "isValidPseudorangeAndPhase"
    t.boolean  "isAnomalyDetected"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "channels", ["receiverID", "offsetTimeID", "signalTypeID", "transmitterID"], :name => "channels_unique_values", :unique => true

  create_table "ionosphere_imports", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.float    "pseudorangeDerivedSTEC"
    t.float    "pseudorangeDerivedSTECDot"
    t.integer  "transmitterID"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ionospheres", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetTimeID"
    t.float    "pseudorangeDerivedSTEC"
    t.float    "pseudorangeDerivedSTECDot"
    t.integer  "transmitterID"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "ionospheres", ["receiverID", "offsetTimeID", "transmitterID"], :name => "ionospheres_unique_values", :unique => true

  create_table "navigation_imports", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.float    "xPosition"
    t.float    "yPosition"
    t.float    "zPosition"
    t.float    "deltaReceiverClockError"
    t.float    "xVelocity"
    t.float    "yVelocity"
    t.float    "zVelocity"
    t.float    "deltaReceiverClockErrorDot"
    t.integer  "navigationSolverID"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "navigation_solutions", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "navigationSolverID"
    t.integer  "offsetTimeID"
    t.float    "xPosition"
    t.float    "yPosition"
    t.float    "zPosition"
    t.float    "deltaReceiverClockError"
    t.float    "xVelocity"
    t.float    "yVelocity"
    t.float    "zVelocity"
    t.float    "deltaReceiverClockErrorDot"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "navigation_solutions", ["receiverID", "offsetTimeID"], :name => "navigation_solution_unique_values", :unique => true

  create_table "navigation_solvers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offset_times", :force => true do |t|
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "offset_times", ["offsetWeekNumber", "offsetWholeSecondsOfWeek", "offsetFractionalSecond"], :name => "offset_time_unique_values", :unique => true

  create_table "receiver_times", :force => true do |t|
    t.integer  "receiverWeekNumber"
    t.float    "receiverSecondsOfWeek"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "receiver_times", ["receiverWeekNumber", "receiverSecondsOfWeek"], :name => "receiver_time_unique_values", :unique => true

  create_table "receivers", :force => true do |t|
    t.string   "Name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scintillation_imports", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.float    "measurementIntervalLength"
    t.float    "s4WholeInterval"
    t.float    "s4FirstHalfInterval"
    t.float    "s4SecondHalfInterval"
    t.float    "sigmaPhiWholeInterval"
    t.float    "sigmaPhiFirstHalfInterval"
    t.float    "sigmaPhiSecondHalfInterval"
    t.float    "tau0"
    t.float    "scintillationPowerRatio"
    t.integer  "referenceChannelIndicator"
    t.integer  "signalTypeID"
    t.integer  "transmitterID"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "scintillations", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetTimeID"
    t.float    "measurementIntervalLength"
    t.float    "s4WholeInterval"
    t.float    "s4FirstHalfInterval"
    t.float    "s4SecondHalfInterval"
    t.float    "sigmaPhiWholeInterval"
    t.float    "sigmaPhiFirstHalfInterval"
    t.float    "sigmaPhiSecondHalfInterval"
    t.float    "tau0"
    t.float    "scintillationPowerRatio"
    t.integer  "referenceChannelIndicator"
    t.integer  "signalTypeID"
    t.integer  "transmitterID"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "scintillations", ["receiverID", "offsetTimeID", "signalTypeID", "transmitterID"], :name => "scintillations_unique_values", :unique => true

  create_table "signal_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "system_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transmitter_imports", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetWeekNumber"
    t.integer  "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.float    "azmiuth"
    t.float    "elevation"
    t.integer  "healthStatusID"
    t.integer  "transmitterSystemID"
    t.integer  "transmitterID"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "transmitters", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "offsetTimeID"
    t.float    "azmiuth"
    t.float    "elevation"
    t.integer  "healthStatusID"
    t.integer  "transmitterSystemID"
    t.integer  "transmitterID"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "transmitters", ["receiverID", "offsetTimeID", "transmitterSystemID", "transmitterID"], :name => "transmitter_unique_values", :unique => true

end
