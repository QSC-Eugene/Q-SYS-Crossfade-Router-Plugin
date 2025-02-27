-- table.insert(ctrls,{Name = "code",ControlType = "Text",PinStyle = "Input",Count = 1})

for x = 1, props["Output Count"].Value do
  table.insert(
    ctrls,
    {
      Name = "select." .. x,
      ControlType = "Text",
      DefaultValue = 1,
      PinStyle = "Both",
      UserPin = true
    }
  )
  for y = 1, props["Input Count"].Value do
    table.insert(
      ctrls,
      {
        Name = "Output." .. x .. ".input." .. y .. ".select",
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
    UserPin = true,

  }
)
