if props["Type"].Value == "Mono" then
  for x = 1, props["Input Count"].Value do
    table.insert(
      wiring,
      {
        "Input " .. x,
        "Router Input " .. x
      }
    )
  end
  for x = 1, props["Output Count"].Value do
    table.insert(
      wiring,
      {
        "XFader" .. x .. " Output",
        "Output " .. x
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. x,
        "XFader" .. x .. " Input A"
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. (x + props["Output Count"].Value),
        "XFader" .. x .. " Input B"
      }
    )
  end
elseif props["Type"].Value == "Stereo" then
  for x = 1, props["Input Count"].Value do
    table.insert(
      wiring,
      {
        "Input " .. x .. " Left",
        "Router Input " .. x .. " Left"
      }
    )
    table.insert(
      wiring,
      {
        "Input " .. x .. " Right",
        "Router Input " .. x .. " Right"
      }
    )
  end
  for x = 1, props["Output Count"].Value do
    table.insert(
      wiring,
      {
        "XFader" .. x .. " Output Left",
        "Output " .. x .. " Left"
      }
    )
    table.insert(
      wiring,
      {
        "XFader" .. x .. " Output Right",
        "Output " .. x .. " Right"
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. x .. " Left",
        "XFader" .. x .. " Input A Left"
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. x .. " Right",
        "XFader" .. x .. " Input A Right"
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. (x + props["Output Count"].Value) .. " Left",
        "XFader" .. x .. " Input B Left"
      }
    )
    table.insert(
      wiring,
      {
        "Router Output " .. (x + props["Output Count"].Value) .. " Right",
        "XFader" .. x .. " Input B Right"
      }
    )
  end
elseif props["Type"].Value == "Multi-channel" then
  for x = 1, props["Input Count"].Value do
    for y = 1, props["Count"].Value do
      table.insert(
        wiring,
        {
          "Input " .. x .. " Channel " .. y,
          "Router Input " .. x .. " Channel " .. y
        }
      )
    end
  end
  for x = 1, props["Output Count"].Value do
    for y = 1, props["Count"].Value do
      table.insert(
        wiring,
        {
          "XFader" .. x .. " Output Channel " .. y,
          "Output " .. x .. " Channel " .. y
        }
      )
      table.insert(
        wiring,
        {
          "Router Output " .. x .. " Channel " .. y,
          "XFader" .. x .. " Input A Channel " .. y
        }
      )
      table.insert(
        wiring,
        {
          "Router Output " .. (x + props["Output Count"].Value) .. " Channel " .. y,
          "XFader" .. x .. " Input B Channel " .. y
        }
      )
    end
  end
end
