//@arg x
var o = argument0; // Object that has its own scripts
var fsm = argument1; // Finite State Machine

switch(FSMstatus){
	case states.enter:
		if(o.enterAction!=pointer_null)
		{
			script_execute(o.enterAction);
		}

		FSMstatus = states.loop;
	break;
	
	case states.loop:
		
		if(o.inputAction!=pointer_null)
		{
			script_execute(o.inputAction);
			
		}

		for(var i=0;i<ds_list_size(o.transitions);i++){
			var array = ds_list_find_value(o.transitions,i);
			var logic = script_execute(array[0]);
			nextState = array[1];
			
			
			if(logic){
				FSMstatus = states.leave;
				break;
			}
		}
		
		if(o.physicsAction!=pointer_null)
		{
			script_execute(o.physicsAction);
			
		}
	break;
	
	case states.leave:
		if(o.exitAction!=pointer_null)
		{
			script_execute(o.exitAction);
		}
	
		fsm.current = nextState;
		FSMstatus = states.enter;
	break;
}