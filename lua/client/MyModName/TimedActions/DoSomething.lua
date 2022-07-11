--- Load Client
local Client = require 'MyModName/Client';

---@class DoSomethingTimedAction : ISBaseTimedAction
local DoSomethingTimedAction = ISBaseTimedAction:derive("DoSomethingTimedAction");

function DoSomethingTimedAction:isValid()
	return true;
end

function DoSomethingTimedAction:update()
    
end

function DoSomethingTimedAction:start()
    
end

function DoSomethingTimedAction:stop()
	ISBaseTimedAction.stop(self);
end

function DoSomethingTimedAction:perform()
	ISBaseTimedAction.perform(self);
end

function DoSomethingTimedAction:new(character, time)
	local o = ISBaseTimedAction.new(self, character);
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time or 50;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

--- Add the timed action to the client TimedActions object
Client.TimedActions.DoSomething = DoSomethingTimedAction;
