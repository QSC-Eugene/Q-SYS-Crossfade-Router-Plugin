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
      Max = props["Input Count"].Value
    }
  )
  table.insert(
    ctrls,
    {
      Name = "mute_" .. x,
      ControlType = "Button",
      ButtonType = "Toggle",
      PinStyle = "Both",
      UserPin = true
    }
  )
  table.insert(
    ctrls,
    {
      Name = "fading_" .. x,
      ControlType = "Indicator",
      IndicatorType = "Led",
      PinStyle = "Output",
      UserPin = true
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
        ButtonType = "Toggle"
      }
    )
  end
end

table.insert(
  ctrls,
  {
    Name = "Crossfade Time",
    ControlType = "Knob",
    PinStyle = "Both",
    UserPin = true,
    ControlUnit = "Float",
    Min = 0.01,
    Max = 100
  }
)
table.insert(
  ctrls,
  {
    Name = "Crossfade Type",
    ControlType = "Text",
    PinStyle = "Both",
    UserPin = true
  }
)