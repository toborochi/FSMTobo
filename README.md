# FSMTobo
 Finite State Machine for Game Maker
 ___
 This is a little experiment that came to my mind while making a FSM in C#. I haven't done performance tests or anything like that, you can expect anything from this project. You can fork it and improve it or just let it disappear on the internet.
 
 # How to use it
 
 ## Creating States

1. Each state is an object that is instantiated when the **FSM** is created. To create a state you have to create four scripts. (You can name it whatever you want.)

> * ```Enter Script```: It runs when the state is entered. This means that it runs once upon entering a state.
> * ```Input Script```: It runs all the time. Keyboard inputs could be handled here.
> * ```Physics Script```: It runs all the time. The physics or movements that respond to keyboard input is done here.
> * ```Exit Script```: It runs once just like the ```Enter Script``` when the state changes.

 2. After that create an object (let's call it ```oState1```) that will be your state and add the following code:
 
 **Create Event:**
 
 ```gml
FSMStateInitialize(
	EnterScript,
	InputScript,
	PhysicsScript,
	ExitScript
	);
```
**CleanUp State:**
```gml
FSMStateCleanUp();
```



 ## SetUp your FSM
 1. Create an object that will be you **FSM** and add the following code:
 
 **Create Event:**
 ```gml
//Initialize the FSM
FSMInitialize();

// All states of the FSM
var myState1 = instance_create_layer(0,0,"Instances",oState);
var myState2 = instance_create_layer(0,0,"Instances",oState2);
// etc...

// Starting state
current = myState;
```
 **Step Event:**
 ```gml
 FSMLoop(current,self);
 ```

## Transitions
So far we have a FSM and a set of states. But there is still no relationship between states. Each state can have several edges and each one can have a different condition. To solve this, for every edge that has a state there must be a script that returns a **boolean** that indicates when it should change to another state. If it returns true, it changes to the state to which it is related. 

For example, if we want to add a transition between two states ```oState1``` and ```oState2```, we could create a script called ```State1ToState2```. In this script it would go all the conditions to go from state ```State1``` to ```State2```.

1. So, after the **Create Event** code we put the transitions (It would look something like this):
```gml
//Initialize the FSM
FSMInitialize();

// All states of the FSM
var myState1 = instance_create_layer(0,0,"Instances",oState);
var myState2 = instance_create_layer(0,0,"Instances",oState2);
// etc...

// Starting state
current = myState;

// Transitions
FSMAddTransition(oState1,State1ToState2,oState2)
```
