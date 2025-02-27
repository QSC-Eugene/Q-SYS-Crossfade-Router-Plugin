Inputs = Properties["Input Count"].Value
Outputs = Properties["Output Count"].Value

--[[ #include "FaderList.lua" ]]
local CurrentSource = {}

local choices = {}
for x = 1, Inputs do
  table.insert(choices, x)
end

function SetFB(outputIndex)
  Controls["select." .. outputIndex].String = CurrentSource[outputIndex]
  for y = 1, Inputs do
    Controls["Output." .. outputIndex .. ".input." .. y .. ".select"].Boolean = (y == CurrentSource[outputIndex])
  end
end

function GotoSource(input, output)
  local inactiveChannel = (not XFaders[output]["crossfade.to.A"].Boolean and {"A", output} or {"B", (output + Outputs)})
  Router["select." .. inactiveChannel[2]].Value = input
  XFaders[output]["crossfade.to." .. inactiveChannel[1]].Boolean = true
  CurrentSource[output] = input
  SetFB(output)
end

for x = 1, Outputs do
  Controls["select." .. x].Choices = choices
  if XFaders[x]["crossfade.to.A"].Boolean then
    CurrentSource[x] = math.floor(Router["select." .. x].Value)
  else
    CurrentSource[x] = math.floor(Router["select." .. (x + Outputs)].Value)
  end
  SetFB(x)

  Controls["select." .. x].EventHandler = function(ctrl)
    GotoSource(tonumber(ctrl.String), x)
  end
  for y = 1, Inputs do
    Controls["Output." .. x .. ".input." .. y .. ".select"].EventHandler = function(ctrl)
      if ctrl.Boolean then
        GotoSource(y, x)
      elseif not ctrl.Boolean and y == CurrentSource[x] then
        ctrl.Boolean = true
      end
    end
  end
end

Controls["Crossfade Type"].Choices = {"-6dB Constant Gain", "-3dB Constant Power"}
if Controls["Crossfade Type"].String == "" then
  Controls["Crossfade Type"].String = XFaders[1]["crossfade.type"].String
end
Controls["Crossfade Type"].EventHandler = function(ctrl)
  for x = 1, (Outputs) do
    XFaders[x]["crossfade.type"].String = ctrl.String
  end
end
Controls["Crossfade Time"].Value = XFaders[1]["crossfade.time"].Value
Controls["Crossfade Time"].EventHandler = function(ctrl)
  for x = 1, (Outputs) do
    XFaders[x]["crossfade.time"].Value = ctrl.Value
  end
end
