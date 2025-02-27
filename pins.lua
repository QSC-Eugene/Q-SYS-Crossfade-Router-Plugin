if props["Type"].Value == "Mono" then
  for x = 1, props["Input Count"].Value do
    table.insert(
      pins,
      {
        Name = "Input " .. x,
        Direction = "input"
      }
    )
  end

  for x = 1, props["Output Count"].Value do
    table.insert(
      pins,
      {
        Name = "Output " .. x,
        Direction = "output"
      }
    )
  end
elseif props["Type"].Value == "Stereo" then
  for x = 1, props["Input Count"].Value do
    table.insert(
      pins,
      {
        Name = "Input " .. x .. " Left",
        Direction = "input"
      }
    )
    table.insert(
      pins,
      {
        Name = "Input " .. x .. " Right",
        Direction = "input"
      }
    )
  end

  for x = 1, props["Output Count"].Value do
    table.insert(
      pins,
      {
        Name = "Output " .. x .. " Left",
        Direction = "output"
      }
    )
    table.insert(
      pins,
      {
        Name = "Output " .. x .. " Right",
        Direction = "output"
      }
    )
  end
elseif props["Type"].Value == "Multi-channel" then
  for x = 1, props["Input Count"].Value do
    for y = 1, props["Count"].Value do
      table.insert(
        pins,
        {
          Name = "Input " .. x .. " Channel " .. y,
          Direction = "input"
        }
      )
    end
  end

  for x = 1, props["Output Count"].Value do
    for y = 1, props["Count"].Value do
      table.insert(
        pins,
        {
          Name = "Output " .. x .. " Channel " .. y,
          Direction = "output"
        }
      )
    end
  end
end
