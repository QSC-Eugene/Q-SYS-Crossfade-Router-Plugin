table.insert(
  props,
  {
    Name = "Input Count",
    Type = "integer",
    Value = 4,
    Min = 2,
    Max = 64
  }
)
table.insert(
  props,
  {
    Name = "Output Count",
    Type = "integer",
    Value = 4,
    Min = 2,
    Max = 64
  }
)
table.insert(
  props,
  {
    Name = "Type",
    Type = "enum",
    Value = "Mono",
    Choices = {"Mono", "Stereo", "Multi-channel"}
  }
)
table.insert(
  props,
  {
    Name = "Count",
    Type = "integer",
    Value = 8,
    Min = 2,
    Max = 64
  }
)

