// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FSMCore() constructor{
	
	current_state = pointer_null;
	
	Initialize = function(state){
		current_state = state;
		current_state._enter();
	}
	
	ChangeState = function(state){
		current_state._exit();
		current_state= state;
		current_state._enter();
	}
	
	Update = function(){
		
		if(current_state!=pointer_null){
			current_state._handleInput();
			current_state._logicUpdate();
			current_state._updateObject();
		}
	}
}