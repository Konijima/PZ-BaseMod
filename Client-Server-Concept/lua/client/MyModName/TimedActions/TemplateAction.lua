--- Load Client
local Client = require 'MyModName/Client';

---@class TemplateAction : ISBaseTimedAction
local TemplateAction = ISBaseTimedAction:derive("TemplateAction")

function TemplateAction:isValid()
	return true;
end

function TemplateAction:update()
    
end

function TemplateAction:start()
    
end

function TemplateAction:stop()
	ISBaseTimedAction.stop(self);
end

function TemplateAction:perform()
	ISBaseTimedAction.perform(self);
end

function TemplateAction:new(character)
	local o = ISBaseTimedAction.new(self, character, time);
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time or 50;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

--- Set the TimedAction
Client.TimedActions.TemplateAction = TemplateAction;
