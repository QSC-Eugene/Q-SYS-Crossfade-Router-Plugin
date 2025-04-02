Inputs = Properties["Input Count"].Value
Outputs = Properties["Output Count"].Value

XFaders = {}
Gains = {}
for i = 1, Properties["Output Count"].Value do
  table.insert(XFaders,_G["XFader" .. i])
  table.insert(Gains,_G["Gain" .. i])
end
CurrentSource = {}

function SetFB(outputIndex)
  Controls["select_" .. outputIndex].Value = CurrentSource[outputIndex]
  for y = 1, Inputs do
    Controls["output_" .. outputIndex .. "_input_" .. y .. "_select"].Boolean = (y == CurrentSource[outputIndex])
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
  if XFaders[x]["crossfade.to.A"].Boolean then
    CurrentSource[x] = math.floor(Router["select." .. x].Value)
  else
    CurrentSource[x] = math.floor(Router["select." .. (x + Outputs)].Value)
  end
  SetFB(x)

  Controls["select_" .. x].EventHandler = function(ctrl)
    GotoSource(ctrl.Value, x)
  end
  for y = 1, Inputs do
    Controls["output_" .. x .. "_input_" .. y .. "_select"].EventHandler = function(ctrl)
      if ctrl.Boolean then
        GotoSource(y, x)
      elseif not ctrl.Boolean and y == CurrentSource[x] then
        ctrl.Boolean = true
      end
    end
  end

  XFaders[x].position.EventHandler = function(ctrl)
    Controls["fading_" .. x].Boolean = not (ctrl.Position == 1 or ctrl.Position == 0)
  end
  Gains[x].mute.EventHandler = function(ctrl)
    Controls["mute_" .. x].Boolean = ctrl.Boolean
  end
  Controls["mute_" .. x].EventHandler = function(ctrl)
    Gains[x].mute.Boolean = ctrl.Boolean
  end
end

Controls["crossfade_type"].Choices = {"-6dB Constant Gain", "-3dB Constant Power"}
if Controls["crossfade_type"].String == "" then
  Controls["crossfade_type"].String = XFaders[1]["crossfade.type"].String
end
Controls["crossfade_type"].EventHandler = function(ctrl)
  for x = 1, Outputs do
    XFaders[x]["crossfade.type"].String = ctrl.String
  end
end
Controls["crossfade_time"].Value = XFaders[1]["crossfade.time"].Value
Controls["crossfade_time"].EventHandler = function(ctrl)
  for x = 1, Outputs do
    XFaders[x]["crossfade.time"].Value = ctrl.Value
  end
end
