% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  Files:	Elevator_DSM_varied.m														*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
% Script file to create the Design Structure Matrix 								*
%																									*
% Entries indicate an interaction between two elements and the value 		*
% represents the interaction strength													*
%
% This DSM represents a subset of elements and interactions	within a			*
% generic elevator system																	*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************


DSM_size = 61;				% number of elements in the DSM
DSM = zeros(DSM_size);

% ***** DSM ENTRIES *****
% interactions between the elements of the DSM

DSM(1,1)	= 1;
DSM(15,1) = 0.5;
DSM(60,1) = 0.5;

DSM(2,2) 	= 1;
DSM(40,2)	= 1;
DSM(60,2)	= 0.5;

DSM(3,3)	= 1;
DSM(15,3)	= 0.5;
DSM(60,3)	= 0.5;

DSM(4,4)	= 1;
DSM(40,4)	= 1;
DSM(60,4)	= 0.5;

DSM(5,5)	= 1;
DSM(9,5)	= 0.5;
DSM(40,5)	= 1;
DSM(60,5)	= 0.5;

DSM(2,6)	= 1;
DSM(6,6)	= 1;
DSM(9,6)	= 0.5;
DSM(27,6)	= 2;
DSM(40,6)	= 1;

DSM(1,7)	= 1;
DSM(7,7)	= 1;
DSM(15,7)	= 0.5;
DSM(27,7)	= 2;

DSM(8,8)	= 1;
DSM(9,8)	= 0.5;
DSM(27,8)	= 2;
DSM(40,8)	= 1;

DSM(2,9)	= 1;
DSM(4,9)	= 1;
DSM(5,9)	= 1;
DSM(9,9)	= 1;
DSM(15,9)	= 0.5;
DSM(20,9)	= 0.5;
DSM(25,9)	= 2;
DSM(27,9)	= 2;
DSM(32,9)	= 2;
DSM(34,9)	= 1;
DSM(35,9)	= 0.5;
DSM(40,9)	= 2;

DSM(10,10)	= 1;
DSM(11,10)	= 2;
DSM(19,10)	= 2;
DSM(40,10)	= 2;
DSM(55,10)	= 2;

DSM(10,11)	= 2;
DSM(11,11)	= 1;
DSM(12,11)	= 2;
DSM(15,11)	= 1;
DSM(21,11)	= 1;
DSM(25,11)	= 1;
DSM(26,11)	= 1;
DSM(28,11)	= 1;
DSM(29,11)	= 1;
DSM(37,11)	= 1;
DSM(57,11)	= 0.5;
DSM(58,11)	= 0.5;

DSM(11,12)	= 2;
DSM(12,12)	= 1;
DSM(19,12)	= 0.5;
DSM(26,12)	= 2;

DSM(13,13)	= 1;
DSM(32,13)	= 1;
DSM(33,13)	= 0.5;
DSM(39,13)	= 2;
DSM(40,13)	= 2;
DSM(41,13)	= 1;
DSM(55,13)	= 1;
DSM(56,13)	= 1;
DSM(60,13)	= 1;

DSM(1,14)	= 1;
DSM(2,14)	= 1;
DSM(3,14)	= 1;
DSM(5,14)	= 1;
DSM(6,14)	= 1;
DSM(7,14)	= 1;
DSM(9,14)	= 1;
DSM(14,14)	= 1;
DSM(16,14)	= 1;
DSM(18,14)	= 1;
DSM(21,14)	= 1;
DSM(25,14)	= 1;
DSM(26,14)	= 1;
DSM(27,14)	= 1;
DSM(28,14)	= 1;
DSM(29,14)	= 1;
DSM(30,14)	= 1;
DSM(31,14)	= 1;
DSM(32,14)	= 1;
DSM(33,14)	= 1;
DSM(34,14)	= 1;
DSM(37,14)	= 1;
DSM(42,14)	= 1;
DSM(43,14)	= 1;
DSM(44,14)	= 1;
DSM(45,14)	= 1;
DSM(48,14)	= 1;
DSM(50,14)	= 1;
DSM(51,14)	= 1;
DSM(52,14)	= 1;
DSM(53,14)	= 1;

DSM(1,15)	= 0.5;
DSM(3,15)	= 0.5;
DSM(7,15)	= 0.5;
DSM(9,15)	= 0.5;
DSM(11,15)	= 1;
DSM(15,15)	= 1;
DSM(16,15)	= 0.5;
DSM(23,15)	= 1;
DSM(43,15)	= 1;
DSM(44,15)	= 1;
DSM(45,15)	= 1;
DSM(46,15)	= 1;
DSM(47,15)	= 1;
DSM(48,15)	= 1;
DSM(49,15)	= 2;
DSM(60,15)	= 0.5;

DSM(1,16)	= 1;
DSM(2,16)	= 1;
DSM(3,16)	= 1;
DSM(4,16)	= 1;
DSM(5,16)	= 1;
DSM(15,16)	= 0.5;
DSM(16,16)	= 1;
DSM(20,16)	= 0.5;
DSM(30,16)	= 1;
DSM(32,16)	= 1;
DSM(33,16)	= 0.5;
DSM(34,16)	= 1;
DSM(40,16)	= 2;
DSM(42,16)	= 1;

DSM(12,17)	= 2;
DSM(14,17)	= 2;
DSM(17,17)	= 1;
DSM(38,17)	= 0.5;
DSM(41,17)	= 1;

DSM(5,18)	= 1;
DSM(18,18)	= 1;
DSM(28,18)	= 1;
DSM(29,18)	= 1;
DSM(38,18)	= 1;
DSM(42,18)	= 0.5;

DSM(19,19)	= 1;
DSM(20,19)	= 1;
DSM(22,19)	= 0.5;
DSM(40,19)	= 1;
DSM(55,19)	= 2;

DSM(20,20)	= 1;
DSM(40,20)	= 1;

DSM(11,21)	= 1;
DSM(21,21)	= 1;
DSM(26,21)	= 1;
DSM(38,21)	= 1;
DSM(57,21)	= 0.5;
DSM(58,21)	= 0.5;

DSM(22,22)	= 1;
DSM(23,22)	= 2;
DSM(40,22)	= 2;
DSM(56,22)	= 1;

DSM(15,23)	= 1;
DSM(22,23)	= 2;
DSM(23,23)	= 1;
DSM(39,23)	= 2;

DSM(24,24)	= 1;
DSM(25,24)	= 2;
DSM(26,24)	= 0.5;
DSM(57,24)	= 0.5;

DSM(24,25)	= 1;
DSM(25,25)	= 1;
DSM(26,25)	= 2;
DSM(27,25)	= 2;
DSM(35,25)	= 0.5;
DSM(37,25)	= 1;
DSM(38,25)	= 1;
DSM(42,25)	= 1;
DSM(57,25)	= 0.5;
DSM(58,25)	= 0.5;

DSM(12,26)	= 2;
DSM(21,26)	= 1;
DSM(25,26)	= 2;
DSM(26,26)	= 1;
DSM(35,26)	= 0.5;
DSM(38,26)	= 1;
DSM(57,26)	= 0.5;
DSM(58,26)	= 0.5;

DSM(1,27)	= 1;
DSM(2,27)	= 1;
DSM(3,27)	= 1;
DSM(4,27)	= 1;
DSM(5,27)	= 0.5;
DSM(9,27)	= 1;
DSM(25,27)	= 2;
DSM(27,27)	= 1;
DSM(35,27)	= 0.5;
DSM(58,27)	= 0.5;

DSM(11,28)	= 1;
DSM(24,28)	= 1;
DSM(25,28)	= 2;
DSM(27,28)	= 1;
DSM(28,28)	= 1;
DSM(35,28)	= 0.5;
DSM(58,28)	= 0.5;

DSM(11,29)	= 1;
DSM(25,29)	= 2;
DSM(26,29)	= 2;
DSM(29,29)	= 1;
DSM(35,29)	= 0.5;
DSM(58,29)	= 0.5;

DSM(9,30)	= 1;
DSM(25,30)	= 1;
DSM(30,30)	= 1;
DSM(38,30)	= 1;
DSM(40,30)	= 1;

DSM(25,31)	= 1;
DSM(31,31)	= 1;
DSM(38,31)	= 1;

DSM(9,32)	= 0.5;
DSM(13,32)	= 1;
DSM(25,32)	= 2;
DSM(26,32)	= 1;
DSM(32,32)	= 1;
DSM(35,32)	= 0.5;
DSM(38,32)	= 0.5;
DSM(40,32)	= 1;
DSM(58,32)	= 0.5;

DSM(9,33)	= 1;
DSM(26,33)	= 1;
DSM(33,33)	= 1;
DSM(38,33)	= 1;
DSM(40,33)	= 1;

DSM(9,34)	= 1;
DSM(25,34)	= 1;
DSM(34,34)	= 1;
DSM(40,34)	= 1;

DSM(9,35)	= 1;
DSM(35,35)	= 1;
DSM(58,35)	= 1;

DSM(25,36)	= 1;
DSM(36,36)	= 1;

DSM(37,37)	= 1;
DSM(38,37)	= 1;
DSM(57,37)	= 0.5;
DSM(58,37)	= 0.5;

DSM(9,38)	= 0.5;
DSM(25,38)	= 1;
DSM(26,38)	= 1;
DSM(27,38)	= 1;
DSM(35,38)	= 0.5;
DSM(38,38)	= 1;
DSM(57,38)	= 1;
DSM(58,38)	= 1;

DSM(9,39)	= 0.5;
DSM(13,39)	= 1;
DSM(23,39)	= 2;
DSM(38,39)	= 1;
DSM(39,39)	= 1;
DSM(40,39)	= 2;

DSM(2,40)	= 1;
DSM(4,40)	= 1;
DSM(5,40)	= 1;
DSM(6,40)	= 1;
DSM(8,40)	= 1;
DSM(9,40)	= 2;
DSM(10,40)	= 2;
DSM(13,40)	= 1;
DSM(16,40)	= 2;
DSM(20,40)	= 2;
DSM(22,40)	= 2;
DSM(30,40)	= 1;
DSM(32,40)	= 1;
DSM(34,40)	= 1;
DSM(39,40)	= 2;
DSM(40,40)	= 1;
DSM(41,40)	= 2;
DSM(42,40)	= 1;
DSM(43,40)	= 1;
DSM(44,40)	= 1;
DSM(45,40)	= 1;
DSM(46,40)	= 1;
DSM(47,40)	= 1;
DSM(48,40)	= 1;
DSM(53,40)	= 2;
DSM(54,40)	= 1;
DSM(55,40)	= 2;
DSM(56,40)	= 1;
DSM(60,40)	= 0.5;

DSM(13,41)	= 1;
DSM(38,41)	= 1;
DSM(40,41)	= 2;
DSM(41,41)	= 1;
DSM(42,41)	= 2;
DSM(49,41)	= 2;
DSM(58,41)	= 0.5;
DSM(59,41)	= 1;
DSM(60,41)	= 0.5;

DSM(9,42)	= 1;
DSM(25,42)	= 2;
DSM(35,42)	= 1;
DSM(38,42)	= 1;
DSM(40,42)	= 1;
DSM(41,42)	= 2;
DSM(42,42)	= 1;
DSM(57,42)	= 0.5;
DSM(58,42)	= 0.5;

DSM(9,43)	= 1;
DSM(15,43)	= 1;
DSM(24,43)	= 1;
DSM(25,43)	= 1;
DSM(38,43)	= 2;
DSM(40,43)	= 1;
DSM(43,43)	= 1;

DSM(9,44)	= 1;
DSM(15,44)	= 1;
DSM(24,44)	= 1;
DSM(25,44)	= 1;
DSM(38,44)	= 2;
DSM(40,44)	= 1;
DSM(44,44)	= 1;

DSM(9,45)	= 1;
DSM(15,45)	= 1;
DSM(24,45)	= 1;
DSM(25,45)	= 2;
DSM(28,45)	= 1;
DSM(37,45)	= 1;
DSM(38,45)	= 1;
DSM(40,45)	= 2;
DSM(45,45)	= 1;
DSM(58,45)	= 0.5;

DSM(15,46)	= 1;
DSM(38,46)	= 1;
DSM(39,46)	= 2;
DSM(46,46)	= 1;

DSM(15,47)	= 1;
DSM(38,47)	= 1;
DSM(40,47)	= 1;
DSM(47,47)	= 1;

DSM(15,48)	= 1;
DSM(24,48)	= 1;
DSM(25,48)	= 1;
DSM(38,48)	= 1;
DSM(40,48)	= 1;
DSM(48,48)	= 1;

DSM(13,49)	= 1;
DSM(15,49)	= 2;
DSM(38,49)	= 1;
DSM(41,49)	= 2;
DSM(49,49)	= 1;
DSM(59,49)	= 0.5;
DSM(60,49)	= 0.5;

DSM(25,50)	= 1;
DSM(50,50)	= 1;

DSM(25,51)	= 1;
DSM(51,51)	= 1;

DSM(25,52)	= 1;
DSM(52,52)	= 1;

DSM(40,53)	= 2;
DSM(53,53)	= 1;
DSM(54,53)	= 1;
DSM(60,53)	= 0.5;

DSM(40,54)	= 2;
DSM(53,54)	= 1;
DSM(54,54)	= 1;

DSM(10,55)	= 1;
DSM(40,55)	= 1;
DSM(55,55)	= 1;

DSM(22,56)	= 1;
DSM(40,56)	= 1;
DSM(56,56)	= 1;

DSM(35,57)	= 0.5;
DSM(57,57)	= 1;
DSM(58,57)	= 1;
DSM(61,57)	= 0.5;

DSM(9,58)	= 0.5;
DSM(35,58)	= 0.5;
DSM(58,58)	= 1;

DSM(49,59)	= 1;
DSM(59,59)	= 1;

DSM(1,60)	= 0.5;
DSM(2,60)	= 0.5;
DSM(3,60)	= 0.5;
DSM(4,60)	= 0.5;
DSM(5,60)	= 0.5;
DSM(6,60)	= 0.5;
DSM(7,60)	= 0.5;
DSM(8,60)	= 0.5;
DSM(13,60)	= 1;
DSM(32,60)	= 1;
DSM(34,60)	= 0.5;
DSM(40,60)	= 1;
DSM(41,60)	= 0.5;
DSM(49,60)	= 0.5;
DSM(53,60)	= 0.5;
DSM(55,60)	= 0.5;
DSM(56,60)	= 0.5;
DSM(60,60)	= 1;
DSM(61,60)	= 0.5;

DSM(13,61)	= 0.5;
DSM(30,61)	= 0.5;
DSM(31,61)	= 0.5;
DSM(33,61)	= 0.5;
DSM(34,61)	= 0.5;
DSM(35,61)	= 0.5;
DSM(40,61)	= 0.5;
DSM(41,61)	= 0.5;
DSM(49,61)	= 0.5;
DSM(53,61)	= 0.5;
DSM(57,61)	= 0.5;
DSM(58,61)	= 0.5;
DSM(59,61)	= 0.5;
DSM(60,61)	= 0.5;
DSM(61,61)	= 0.5;









% **************************************************************************
%								DSM Elements Labels											*
% **************************************************************************

DSMLABEL = cell(DSM_size,1);

DSMLABEL{1,1} = 'Hall Request Indicator';
DSMLABEL{2,1} = 'Car Request Indicator';
DSMLABEL{3,1} = 'Hallway Fixtures';
DSMLABEL{4,1} = 'Car Fixtures';
DSMLABEL{5,1} = 'Emerg. Intercom-Phone';
DSMLABEL{6,1} = 'Car Buttons';
DSMLABEL{7,1} = 'Hall Buttons';
DSMLABEL{8,1} = 'Firemans Service key';
DSMLABEL{9,1} = 'Travelling Comm. Cable';

DSMLABEL{10,1} = 'Ropes';
DSMLABEL{11,1} = 'Motor';
DSMLABEL{12,1} = 'Drive Power Section';
DSMLABEL{13,1} = 'Cab Floor/Plank';
DSMLABEL{14,1} = 'Power Supplies';
DSMLABEL{15,1} = 'Building Structure';
DSMLABEL{16,1} = 'Travel Cable Power';
DSMLABEL{17,1} = 'Building Power';
DSMLABEL{18,1} = 'Power Storage';
DSMLABEL{19,1} = 'Counterweight';

DSMLABEL{20,1} = 'Compensation System';
DSMLABEL{21,1} = 'Brake System';
DSMLABEL{22,1} = 'Cab Guidance System';
DSMLABEL{23,1} = 'Guide Rails';
DSMLABEL{24,1} = 'Learn Function';
DSMLABEL{25,1} = 'Motion Controller';
DSMLABEL{26,1} = 'Electrical Drive Control';
DSMLABEL{27,1} = 'Operational Controller';
DSMLABEL{28,1} = 'Primary Position System';
DSMLABEL{29,1} = 'Primary Velcotiy Measement';

DSMLABEL{30,1} = 'Top-of-Car Insp. Ctl Panel';
DSMLABEL{31,1} = 'Remote Insp. Ctl. Panel';
DSMLABEL{32,1} = 'Load Weighing System';
DSMLABEL{33,1} = 'Construction Control Panel';
DSMLABEL{34,1} = 'Door Close Button';
DSMLABEL{35,1} = 'Service Tool';
DSMLABEL{36,1} = 'Emerg. Gen. Signal';
DSMLABEL{37,1} = 'Secondary Veloc. Check';
DSMLABEL{38,1} = 'Safety System';
DSMLABEL{39,1} = 'Mechanical Safeties System';

DSMLABEL{40,1} = 'Cab';
DSMLABEL{41,1} = 'Cab Doors';
DSMLABEL{42,1} = 'Door Controller';
DSMLABEL{43,1} = 'Terminal Sensing System';
DSMLABEL{44,1} = 'ETSD Sensor';
DSMLABEL{45,1} = 'Door Zone Sensors';
DSMLABEL{46,1} = 'Governor System';
DSMLABEL{47,1} = 'Terminal Buffer';
DSMLABEL{48,1} = 'NTSD Sensor';
DSMLABEL{49,1} = 'Hoistway Doors';

DSMLABEL{50,1} = 'Door Obstruction Sensor';
DSMLABEL{51,1} = 'Earthquake Sensor';
DSMLABEL{52,1} = 'Building Sway Sensor';
DSMLABEL{53,1} = 'Vent & Lighting System';
DSMLABEL{54,1} = 'Cab Insullation';
DSMLABEL{55,1} = 'Ropes/Hitch Springs';
DSMLABEL{56,1} = 'Guide Springs/ Rail Align';
DSMLABEL{57,1} = 'Diagnostics';
DSMLABEL{58,1} = 'Remote Monitoring System';
DSMLABEL{59,1} = 'Acces keying on Hstway Doors';

DSMLABEL{60,1} = 'Passenger Load';
DSMLABEL{61,1} = 'Service Guy';












% **************************************************************************
%							Functional Mapping to Physical Elements					*
% **************************************************************************

% Each of the functional labels represents the functional 
% requirement for which the physcial DSM element represents
% Used to cross-reference the physical elemnts and
% functional requiremnts

DSMFunc_LABEL = cell(DSM_size,1);

DSMFunc_LABEL{1,1} = 'Acknowledge Hall Svc Rqst';
DSMFunc_LABEL{2,1} = 'Acknowledge Car Service Rqst';
DSMFunc_LABEL{3,1} = 'Comm. Status w/ Hall Pass.';
DSMFunc_LABEL{4,1} = 'Comm. Status w/ Car Pass.';
DSMFunc_LABEL{5,1} = 'Emerg. Comm. w/ car pass.';
DSMFunc_LABEL{6,1} = 'Input Car Rqst';
DSMFunc_LABEL{7,1} = 'Input Hall Rqst';
DSMFunc_LABEL{8,1} = 'Input Firemans Svc Rqst';
DSMFunc_LABEL{9,1} = 'Provide Comm. Link to Pass';

DSMFunc_LABEL{10,1} = 'Xmit force to containment';
DSMFunc_LABEL{11,1} = 'Energy Transformation to Force';
DSMFunc_LABEL{12,1} = 'Provide Energy for Motion';
DSMFunc_LABEL{13,1} = 'Support load for movement';
DSMFunc_LABEL{14,1} = 'Provide power to comp.';
DSMFunc_LABEL{15,1} = 'Provide structure to contain Sys.';
DSMFunc_LABEL{16,1} = 'Provide power to containment';
DSMFunc_LABEL{17,1} = 'Provide power for system';
DSMFunc_LABEL{18,1} = 'Temporary power for memory';
DSMFunc_LABEL{19,1} = 'Provide Counterbalancing to contain.';

DSMFunc_LABEL{20,1} = 'Provide coubterbalancing of ropes';
DSMFunc_LABEL{21,1} = 'Hold containment at destination';
DSMFunc_LABEL{22,1} = 'Maintain guidance in pathway';
DSMFunc_LABEL{23,1} = 'Provide path for motion in Hwy';
DSMFunc_LABEL{24,1} = 'System Calibration';
DSMFunc_LABEL{25,1} = 'Compute Trajectory';
DSMFunc_LABEL{26,1} = 'Control Motion to trajectory';
DSMFunc_LABEL{27,1} = 'Process Service Request';
DSMFunc_LABEL{28,1} = 'Provide current position';
DSMFunc_LABEL{29,1} = 'Provide Trajectory feedback';

DSMFunc_LABEL{30,1} = 'Top-of-car control (inspection)';
DSMFunc_LABEL{31,1} = 'Remote Control (inspection)';
DSMFunc_LABEL{32,1} = 'Detect if load is within limits';
DSMFunc_LABEL{33,1} = 'Contruction Control';
DSMFunc_LABEL{34,1} = 'Passenger Door control';
DSMFunc_LABEL{35,1} = 'Provide access to view/change sys. info.';
DSMFunc_LABEL{36,1} = 'Determine if on Emerg. Power';
DSMFunc_LABEL{37,1} = 'Detect Uncontrolled motion';
DSMFunc_LABEL{38,1} = 'Determine if safe to move';
DSMFunc_LABEL{39,1} = 'Stop free-fall motion';

DSMFunc_LABEL{40,1} = 'Protect load from hwy';
DSMFunc_LABEL{41,1} = 'Provide safe load transfer';
DSMFunc_LABEL{42,1} = 'Control acces to containment';
DSMFunc_LABEL{43,1} = 'independent end of hwy sensor';
DSMFunc_LABEL{44,1} = 'Emerg. Terminal Stopiing device';
DSMFunc_LABEL{45,1} = 'Indep. Door zone sensing';
DSMFunc_LABEL{46,1} = 'Mechanical Overspeed detection';
DSMFunc_LABEL{47,1} = 'Provide end of Hwy cushion (bffr)';
DSMFunc_LABEL{48,1} = 'Detect failure slow for last landing -NTSD';
DSMFunc_LABEL{49,1} = 'Deny access to hwy';

DSMFunc_LABEL{50,1} = 'Detect obstructed access';
DSMFunc_LABEL{51,1} = 'Respond to Earthquake';
DSMFunc_LABEL{52,1} = 'Detect Building sway';
DSMFunc_LABEL{53,1} = 'Maintainsafe/comf load env.';
DSMFunc_LABEL{54,1} = 'Manage noise';
DSMFunc_LABEL{55,1} = 'Manage vertical vibration';
DSMFunc_LABEL{56,1} = 'Manage horizontal vibration';
DSMFunc_LABEL{57,1} = 'Determine cause of malfunction';
DSMFunc_LABEL{58,1} = 'Monitor system health';
DSMFunc_LABEL{59,1} = 'provide service access to hwy';

DSMFunc_LABEL{60,1} = 'Passenger Load';
DSMFunc_LABEL{61,1} = 'Service Guy';
