// Some variables
hspeed_ = 20;


FSMInitialize();

// All states of the FSM
var idle = instance_create_layer(0,0,"Instances",oStateIdle);
var walk = instance_create_layer(0,0,"Instances",oStateWalk);
var jump = instance_create_layer(0,0,"Instances",oStateJump);

// Starting state
current = idle;

// Transitions
FSMAddTransition(idle,IdleToWalk,walk);
FSMAddTransition(walk,WalkToIdle,idle);
FSMAddTransition(idle,IdleToJump,jump);
FSMAddTransition(jump,JumpToIdle,idle);