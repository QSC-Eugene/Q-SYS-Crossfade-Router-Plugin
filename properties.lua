table.insert(
  props,
  {
    Name = "Input Count",
    Type = "integer",
    Value = 8,
    Min = 2,
    Max = 128,
    Description = "Number of inputs on the router."
  }
)
table.insert(
  props,
  {
    Name = "Output Count",
    Type = "integer",
    Value = 8,
    Min = 1,
    Max = 128,
    Description = "Number of outputs on the router."
  }
)
table.insert(
  props,
  {
    Name = "Type",
    Type = "enum",
    Value = "Mono",
    Choices = {"Mono", "Stereo", "Multi-channel"},
    Description = "Type of router. Can be Mono, Stereo or Multi-channel.",
  }
)
table.insert(
  props,
  {
    Name = "Count",
    Type = "integer",
    Value = 8,
    Min = 2,
    Max = 64,
    Description = "Number of channels per input or output when Type is set to Multi-channel.",
  }
)