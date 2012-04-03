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

ActiveRecord::Schema.define(:version => 20120403151154) do

  create_table "channels", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "receiverTimeID"
    t.integer  "offsetTimeID"
    t.integer  "channelStatusID"
    t.integer  "signalTypeID"
    t.integer  "transmitterID"
    t.float    "apperentDoppler"
    t.float    "beatCarrierPhase"
    t.float    "pseudorange"
    t.float    "carrierToNoiseRatio"
    t.boolean  "isValidPseudorangeAndPhase"
    t.boolean  "isAnomalyDetected"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "ionospheres", :force => true do |t|
    t.integer  "offsetTimeID"
    t.float    "pseudorangeDerivedSTEC"
    t.float    "pseudorangeDerivedSTECDot"
    t.integer  "transmitterID"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "navigation_solutions", :force => true do |t|
    t.integer  "receiverID"
    t.integer  "navigationSolverID"
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

  create_table "offset_times", :force => true do |t|
    t.integer  "offsetWeekNumber"
    t.float    "offsetWholeSecondsOfWeek"
    t.float    "offsetFractionalSecond"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "receiver_times", :force => true do |t|
    t.integer  "receiverWeekNumber"
    t.float    "receiverSecondsOfWeek"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "receivers", :force => true do |t|
    t.string   "Name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

end
