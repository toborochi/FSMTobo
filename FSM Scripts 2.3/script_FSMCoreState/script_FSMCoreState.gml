// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FSMCoreState(_object,_fsm,_name) constructor{
	
	controller = _object;
	fsm = _fsm;
	name = _name;
	_transitions = ds_list_create();
	
	_enter = function(){
		if(debug){print("Enter State <"+name+">");}
		Enter();
	}

	_handleInput = function(){
		HandleInput();
	}
	
	_logicUpdate = function(){
		LogicUpdate();
	}
	
	_updateObject = function(){
		Update();
	}
	
	
	_exit = function(){
		if(debug){print("Exit State <"+name+">");}
		Exit()
	}
	
	Enter		= function(){}
	HandleInput = function(){}
	
	LogicUpdate = function(){
		var size = ds_list_size(_transitions);
		for(var i=0;i<size;i++){
			var t = ds_list_find_value(_transitions,i);
			if(t.condition()){
				fsm.ChangeState(t.state);
			}
		}
	}
	Update		= function(){}
	Exit		= function(){}
	
	AddTransition = function(t){
		ds_list_add(_transitions,t)
	}

}