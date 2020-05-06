# FSMTobo
 Finite State Machine for Game Maker
 ___
 This is a little experiment that came to my mind while making a FSM in C#. I haven't done performance tests or anything like that, you can expect anything from this project. You can fork it and improve it or just let it disappear on the internet.
 
 ## How to use it
 
 ### Creating States

1. Each state is an object that is instantiated when the **FSM** is created. To create a state you have to create four scripts. (You can name it whatever you want.)

> * ```Enter Script```: It runs when the state is entered. This means that it runs once upon entering a state.
> * ```Input Script```: It runs all the time. Keyboard inputs could be handled here.
> * ```Physics Script```: It runs all the time. The physics or movements that respond to keyboard input is done here.
> * ```Exit Script```: It runs once just like the ```Enter Script``` when the state changes.

 2. After that create an object (let's call it ```oState```) that will be your state and add the following code:
 
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



 ### SetUp your FSM
 1. Create an object that will be you **FSM** and add the following code:
 
 **Create Event:**
 ```gml
//Initialize the FSM
FSMInitialize();

// All states of the FSM
var myState = instance_create_layer(0,0,"Instances",oState);
var myState2 = instance_create_layer(0,0,"Instances",oState2);
// etc...

// Starting state
current = myState;
```
 **Step Event:**
 ```gml
 FSMLoop(current,self);
 ```
