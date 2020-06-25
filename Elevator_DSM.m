% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************
%																									*
%  Files:	Elevator_DSM.m																	*
%																									*
%	Created by: Ronnie E. Thebeau															*
%					System Design and Management Program								*
%					Massacusetts Institute of Technology								*
%																									*
%	Date: December 2000																		*
%																									*
% Entries indicate an interaction between two elements and the value 		*
% represents the interaction strength													*
%																									*
% This DSM represents a subset of elements and interactions	within a			*
% generic elevator system																	*
%																									*
% **************************************************************************
% **************************************************************************
% **************************************************************************
% **************************************************************************




% **************************************************************************
%								DSM TEMPLATE													*
% **************************************************************************

DSM_size = 61;				% number of elements in the DSM
DSM = zeros(DSM_size);

% ***** DSM ENTRIES *****

DSM(1,1)	= 1;
DSM(15,1) = 1;
DSM(60,1) = 1;

DSM(2,2) 	= 1;
DSM(40,2)	= 1;
DSM(60,2)	= 1;

DSM(3,3)	= 1;
DSM(15,3)	= 1;
DSM(60,3)	= 1;

DSM(4,4)	= 1;
DSM(40,4)	= 1;
DSM(60,4)	= 1;

DSM(5,5)	= 1;
DSM(9,5)	= 1;
DSM(40,5)	= 1;
DSM(60,5)	= 1;

DSM(2,6)	= 1;
DSM(6,6)	= 1;
DSM(9,6)	= 1;
DSM(27,6)	= 1;
DSM(40,6)	= 1;

DSM(1,7)	= 1;
DSM(7,7)	= 1;
DSM(15,7)	= 1;
DSM(27,7)	= 1;

DSM(8,8)	= 1;
DSM(9,8)	= 1;
DSM(27,8)	= 1;
DSM(40,8)	= 1;

DSM(2,9)	= 1;
DSM(4,9)	= 1;
DSM(5,9)	= 1;
DSM(9,9)	= 1;
DSM(15,9)	= 1;
DSM(20,9)	= 1;
DSM(25,9)	= 1;
DSM(27,9)	= 1;
DSM(32,9)	= 1;
DSM(34,9)	= 1;
DSM(35,9)	= 1;
DSM(40,9)	= 1;

DSM(10,10)	= 1;
DSM(11,10)	= 1;
DSM(19,10)	= 1;
DSM(40,10)	= 1;
DSM(55,10)	= 1;

DSM(10,11)	= 1;
DSM(11,11)	= 1;
DSM(12,11)	= 1;
DSM(15,11)	= 1;
DSM(21,11)	= 1;
DSM(25,11)	= 1;
DSM(26,11)	= 1;
DSM(28,11)	= 1;
DSM(29,11)	= 1;
DSM(37,11)	= 1;
DSM(57,11)	= 1;
DSM(58,11)	= 1;

DSM(11,12)	= 1;
DSM(12,12)	= 1;
DSM(19,12)	= 1;
DSM(26,12)	= 1;

DSM(13,13)	= 1;
DSM(32,13)	= 1;
DSM(33,13)	= 1;
DSM(39,13)	= 1;
DSM(40,13)	= 1;
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

DSM(1,15)	= 1;
DSM(3,15)	= 1;
DSM(7,15)	= 1;
DSM(9,15)	= 1;
DSM(11,15)	= 1;
DSM(15,15)	= 1;
DSM(16,15)	= 1;
DSM(23,15)	= 1;
DSM(43,15)	= 1;
DSM(44,15)	= 1;
DSM(45,15)	= 1;
DSM(46,15)	= 1;
DSM(47,15)	= 1;
DSM(48,15)	= 1;
DSM(49,15)	= 1;
DSM(60,15)	= 1;

DSM(1,16)	= 1;
DSM(2,16)	= 1;
DSM(3,16)	= 1;
DSM(4,16)	= 1;
DSM(5,16)	= 1;
DSM(15,16)	= 1;
DSM(16,16)	= 1;
DSM(20,16)	= 1;
DSM(30,16)	= 1;
DSM(32,16)	= 1;
DSM(33,16)	= 1;
DSM(34,16)	= 1;
DSM(40,16)	= 1;
DSM(42,16)	= 1;

DSM(12,17)	= 1;
DSM(14,17)	= 1;
DSM(17,17)	= 1;
DSM(38,17)	= 1;
DSM(41,17)	= 1;

DSM(5,18)	= 1;
DSM(18,18)	= 1;
DSM(28,18)	= 1;
DSM(29,18)	= 1;
DSM(38,18)	= 1;
DSM(42,18)	= 1;

DSM(19,19)	= 1;
DSM(20,19)	= 1;
DSM(22,19)	= 1;
DSM(40,19)	= 1;
DSM(55,19)	= 1;

DSM(20,20)	= 1;
DSM(40,20)	= 1;

DSM(11,21)	= 1;
DSM(21,21)	= 1;
DSM(26,21)	= 1;
DSM(38,21)	= 1;
DSM(57,21)	= 1;
DSM(58,21)	= 1;

DSM(22,22)	= 1;
DSM(23,22)	= 1;
DSM(40,22)	= 1;
DSM(56,22)	= 1;

DSM(15,23)	= 1;
DSM(22,23)	= 1;
DSM(23,23)	= 1;
DSM(39,23)	= 1;

DSM(24,24)	= 1;
DSM(25,24)	= 1;
DSM(26,24)	= 1;
DSM(57,24)	= 1;

DSM(24,25)	= 1;
DSM(25,25)	= 1;
DSM(26,25)	= 1;
DSM(27,25)	= 1;
DSM(35,25)	= 1;
DSM(37,25)	= 1;
DSM(38,25)	= 1;
DSM(42,25)	= 1;
DSM(57,25)	= 1;
DSM(58,25)	= 1;

DSM(12,26)	= 1;
DSM(21,26)	= 1;
DSM(25,26)	= 1;
DSM(26,26)	= 1;
DSM(35,26)	= 1;
DSM(38,26)	= 1;
DSM(57,26)	= 1;
DSM(58,26)	= 1;

DSM(1,27)	= 1;
DSM(2,27)	= 1;
DSM(3,27)	= 1;
DSM(4,27)	= 1;
DSM(5,27)	= 1;
DSM(9,27)	= 1;
DSM(25,27)	= 1;
DSM(27,27)	= 1;
DSM(35,27)	= 1;
DSM(58,27)	= 1;

DSM(11,28)	= 1;
DSM(24,28)	= 1;
DSM(25,28)	= 1;
DSM(27,28)	= 1;
DSM(28,28)	= 1;
DSM(35,28)	= 1;
DSM(58,28)	= 1;

DSM(11,29)	= 1;
DSM(25,29)	= 1;
DSM(26,29)	= 1;
DSM(29,29)	= 1;
DSM(35,29)	= 1;
DSM(58,29)	= 1;

DSM(9,30)	= 1;
DSM(25,30)	= 1;
DSM(30,30)	= 1;
DSM(38,30)	= 1;
DSM(40,30)	= 1;

DSM(25,31)	= 1;
DSM(31,31)	= 1;
DSM(38,31)	= 1;

DSM(9,32)	= 1;
DSM(13,32)	= 1;
DSM(25,32)	= 1;
DSM(26,32)	= 1;
DSM(32,32)	= 1;
DSM(35,32)	= 1;
DSM(38,32)	= 1;
DSM(40,32)	= 1;
DSM(58,32)	= 1;

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
DSM(57,37)	= 1;
DSM(58,37)	= 1;

DSM(9,38)	= 1;
DSM(25,38)	= 1;
DSM(26,38)	= 1;
DSM(27,38)	= 1;
DSM(35,38)	= 1;
DSM(38,38)	= 1;
DSM(57,38)	= 1;
DSM(58,38)	= 1;

DSM(9,39)	= 1;
DSM(13,39)	= 1;
DSM(23,39)	= 1;
DSM(38,39)	= 1;
DSM(39,39)	= 1;
DSM(40,39)	= 1;

DSM(2,40)	= 1;
DSM(4,40)	= 1;
DSM(5,40)	= 1;
DSM(6,40)	= 1;
DSM(8,40)	= 1;
DSM(9,40)	= 1;
DSM(10,40)	= 1;
DSM(13,40)	= 1;
DSM(16,40)	= 1;
DSM(20,40)	= 1;
DSM(22,40)	= 1;
DSM(30,40)	= 1;
DSM(32,40)	= 1;
DSM(34,40)	= 1;
DSM(39,40)	= 1;
DSM(40,40)	= 1;
DSM(41,40)	= 1;
DSM(42,40)	= 1;
DSM(43,40)	= 1;
DSM(44,40)	= 1;
DSM(45,40)	= 1;
DSM(46,40)	= 1;
DSM(47,40)	= 1;
DSM(48,40)	= 1;
DSM(53,40)	= 1;
DSM(54,40)	= 1;
DSM(55,40)	= 1;
DSM(56,40)	= 1;
DSM(60,40)	= 1;

DSM(13,41)	= 1;
DSM(38,41)	= 1;
DSM(40,41)	= 1;
DSM(41,41)	= 1;
DSM(42,41)	= 1;
DSM(49,41)	= 1;
DSM(58,41)	= 1;
DSM(59,41)	= 1;
DSM(60,41)	= 1;

DSM(9,42)	= 1;
DSM(25,42)	= 1;
DSM(35,42)	= 1;
DSM(38,42)	= 1;
DSM(40,42)	= 1;
DSM(41,42)	= 1;
DSM(42,42)	= 1;
DSM(57,42)	= 1;
DSM(58,42)	= 1;

DSM(9,43)	= 1;
DSM(15,43)	= 1;
DSM(24,43)	= 1;
DSM(25,43)	= 1;
DSM(38,43)	= 1;
DSM(40,43)	= 1;
DSM(43,43)	= 1;

DSM(9,44)	= 1;
DSM(15,44)	= 1;
DSM(24,44)	= 1;
DSM(25,44)	= 1;
DSM(38,44)	= 1;
DSM(40,44)	= 1;
DSM(44,44)	= 1;

DSM(9,45)	= 1;
DSM(15,45)	= 1;
DSM(24,45)	= 1;
DSM(25,45)	= 1;
DSM(28,45)	= 1;
DSM(37,45)	= 1;
DSM(38,45)	= 1;
DSM(40,45)	= 1;
DSM(45,45)	= 1;
DSM(58,45)	= 1;

DSM(15,46)	= 1;
DSM(38,46)	= 1;
DSM(39,46)	= 1;
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
DSM(15,49)	= 1;
DSM(38,49)	= 1;
DSM(41,49)	= 1;
DSM(49,49)	= 1;
DSM(59,49)	= 1;
DSM(60,49)	= 1;

DSM(25,50)	= 1;
DSM(50,50)	= 1;

DSM(25,51)	= 1;
DSM(51,51)	= 1;

DSM(25,52)	= 1;
DSM(52,52)	= 1;

DSM(40,53)	= 1;
DSM(53,53)	= 1;
DSM(54,53)	= 1;
DSM(60,53)	= 1;

DSM(40,54)	= 1;
DSM(53,54)	= 1;
DSM(54,54)	= 1;

DSM(10,55)	= 1;
DSM(40,55)	= 1;
DSM(55,55)	= 1;

DSM(22,56)	= 1;
DSM(40,56)	= 1;
DSM(56,56)	= 1;

DSM(35,57)	= 1;
DSM(57,57)	= 1;
DSM(58,57)	= 1;
DSM(61,57)	= 1;

DSM(9,58)	= 1;
DSM(35,58)	= 1;
DSM(58,58)	= 1;

DSM(49,59)	= 1;
DSM(59,59)	= 1;

DSM(1,60)	= 1;
DSM(2,60)	= 1;
DSM(3,60)	= 1;
DSM(4,60)	= 1;
DSM(5,60)	= 1;
DSM(6,60)	= 1;
DSM(7,60)	= 1;
DSM(8,60)	= 1;
DSM(13,60)	= 1;
DSM(32,60)	= 1;
DSM(34,60)	= 1;
DSM(40,60)	= 1;
DSM(41,60)	= 1;
DSM(49,60)	= 1;
DSM(53,60)	= 1;
DSM(55,60)	= 1;
DSM(56,60)	= 1;
DSM(60,60)	= 1;
DSM(61,60)	= 1;

DSM(13,61)	= 1;
DSM(30,61)	= 1;
DSM(31,61)	= 1;
DSM(33,61)	= 1;
DSM(34,61)	= 1;
DSM(35,61)	= 1;
DSM(40,61)	= 1;
DSM(41,61)	= 1;
DSM(49,61)	= 1;
DSM(53,61)	= 1;
DSM(57,61)	= 1;
DSM(58,61)	= 1;
DSM(59,61)	= 1;
DSM(60,61)	= 1;
DSM(61,61)	= 1;



% **************************************************************************
%									DSM Elements Labels										*
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
%					Functional Mapping to Physical Elements							*
% **************************************************************************

% Each of the functional labels represents the functional 
% requirement for which the physcial DSM element represents
% Used to cross-reference the physical elemnts and
% functional requiremnts

