local multiType = props["Type"].Value
local multiTypeIndex = 0

if multiType == "Mono" then
  multiTypeIndex = 1
elseif multiType == "Stereo" then
  multiTypeIndex = 2
elseif multiType == "Multi-channel" then
  multiTypeIndex = 3
end

table.insert(
  components,
  {
    Name = "Router",
    Type = "router_with_output",
    Properties = {
      ["n_inputs"] = props["Input Count"].Value,
      ["n_outputs"] = (props["Output Count"].Value * 2),
      ["multi_channel_type"] = multiTypeIndex,
      ["multi_channel_count"] = props["Count"].Value
    }
  }
)

for x = 1, (props["Output Count"].Value) do
  table.insert(
    components,
    {
      Name = "XFader" .. x,
      Type = "crossfader",
      Properties = {
        ["multi_channel_type"] = multiTypeIndex,
        ["multi_channel_count"] = props["Count"].Value
      }
    }
  )
  table.insert(
    components,
    {
      Name = "Gain" .. x,
      Type = "gain",
      Properties = {
        ["multi_channel_type"] = multiTypeIndex,
        ["multi_channel_count"] = props["Count"].Value
      }
    }
  )
end