for x = 1, props["Output Count"].Value do
  table.insert(
    ctrls,
    {
      Name = "select_" .. x,
      ControlType = "Knob",
      ControlUnit = "Integer",
      DefaultValue = 1,
      PinStyle = "Both",
      UserPin = true,
      Min = 1,
      Max = props["Input Count"].Value,
      Description = "Selects the input to be crossfaded to the corresponding output."
    }
  )
  table.insert(
    ctrls,
    {
      Name = "mute_" .. x,
      ControlType = "Button",
      ButtonType = "Toggle",
      PinStyle = "Both",
      UserPin = true,
      Description = "Mutes the output."
    }
  )
  table.insert(
    ctrls,
    {
      Name = "fading_" .. x,
      ControlType = "Indicator",
      IndicatorType = "Led",
      PinStyle = "Output",
      UserPin = true,
      Description = "Indicates that the output is fading."
    }
  )
  for y = 1, props["Input Count"].Value do
    table.insert(
      ctrls,
      {
        Name = "output_" .. x .. "_input_" .. y .. "_select",
        ControlType = "Button",
        PinStyle = "Both",
        UserPin = true,
        ButtonType = "Toggle",
        Description = "Selects a specific input to be crossfaded to the corresponding output."
      }
    )
  end
end

table.insert(
  ctrls,
  {
    Name = "crossfade_time",
    ControlType = "Knob",
    PinStyle = "Both",
    UserPin = true,
    ControlUnit = "Float",
    Min = 0.01,
    Max = 100,
    Description = "The time it takes to crossfade between inputs." 
  }
)
table.insert(
  ctrls,
  {
    Name = "crossfade_type",
    ControlType = "Text",
    PinStyle = "Both",
    UserPin = true,
    Description = "The type of crossfade to use.",
  }
)