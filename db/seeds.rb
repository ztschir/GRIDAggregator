# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


NavigationSolver.create(id:0, name:'CONVERGED')
NavigationSolver.create(id:1, name:'FAILED_TO_CONVERGE')
NavigationSolver.create(id:2, name:'TOO_FEW_SVS_AFTER_PRUNING')
NavigationSolver.create(id:3, name:'ITAR_VIOLATION')
NavigationSolver.create(id:4, name:'CONVERGED_BUT_LARGE_RESIDUAL')
NavigationSolver.create(id:5, name:'TOO_FEW_SVS')

ChannelStatus.create(id:0, name:'NULL')
ChannelStatus.create(id:1, name:'ALLOCATED')
ChannelStatus.create(id:2, name:'ACQUIRED')
ChannelStatus.create(id:3, name:'SYMBOL_LOCK')
ChannelStatus.create(id:4, name:'FREQ_LOCK')
ChannelStatus.create(id:5, name:'PHASE_LOCK')
ChannelStatus.create(id:6, name:'DATA_LOCK')

SignalType.create(id:0, name:'GPS_L1_CA')
SignalType.create(id:1, name:'GPS_L2_CM')
SignalType.create(id:2, name:'GPS_L2_CL')
SignalType.create(id:3, name:'GPS_L2_CLM')
SignalType.create(id:4, name:'GPS_L5_I')
SignalType.create(id:5, name:'GPS_L5_Q')
SignalType.create(id:6, name:'GPS_L5_IQ')
SignalType.create(id:7, name:'GPS_L1_CA_ALT1')
SignalType.create(id:8, name:'CDMA_UHF_PILOT')
SignalType.create(id:9, name:'CDMA_UHF_SYNC')

SystemType.create(id:0, name:'GPS')
SystemType.create(id:1, name:'GALILEO')
SystemType.create(id:2, name:'GLONASS')
SystemType.create(id:3, name:'CDMA')
