local current_page = PageNames[props["page_index"].Value]
  
local FSize = 11
local labelSize = {40, 16}
local textboxSize = {36, 16}
local buttonSize = {36, 16}

x = 4
y = 4

if current_page == PageNames[1] then --Routing
  table.insert(
    graphics,
    {
      Type = "GroupBox",
      Position = {x + labelSize[1] + 4, y},
      Size = {
        8 + (props["Output Count"].Value * textboxSize[1]),
        28 + ((props["Input Count"].Value + 2) * textboxSize[2]) + 44
      },
      Text = "Output",
      HTextAlign = "Left",
      StrokeColor = Colors.LightGray,
      StrokeWidth = 1,
      CornerRadius = 8,
      FontSize = FSize
    }
  )
  y = 28 + labelSize[2]
  table.insert(
    graphics,
    {
      Type = "Label",
      Position = {x, y},
      Size = labelSize,
      Text = "Mute",
      HTextAlign = "Right",
      Color = Colors.LightGray,
      FontSize = FSize
    }
  )
  x = x + labelSize[1] + 8

  for i = 1, props["Output Count"].Value do
    layout["mute_" .. i] = {
      Style = "Button",
      ButtonStyle = "Toggle",
      Position = {x, y},
      PrettyName = "Output " .. i .. "~Mute",
      Size = buttonSize,
      FontSize = FSize - 2,
      Padding = 0,
      Color = {223, 0, 36}
    }
    table.insert(
      graphics,
      {
        Type = "Label",
        Position = {x, y - labelSize[2]},
        Size = textboxSize,
        Text = tostring(i),
        HTextAlign = "Center",
        Color = Colors.LightGray,
        FontSize = FSize
      }
    )
    x = x + textboxSize[1]
  end
  y = y + labelSize[2] + 4
  x = 4
  table.insert(
    graphics,
    {
      Type = "Label",
      Position = {x, y},
      Size = labelSize,
      Text = "Fading",
      HTextAlign = "Right",
      Color = Colors.LightGray,
      FontSize = FSize
    }
  )
  x = x + labelSize[1] + 8

  for i = 1, props["Output Count"].Value do
    layout["fading_" .. i] = {
      Style = "Led",
      Position = {x + 10, y},
      PrettyName = "Output " .. i .. "~Fading",
      Size = {buttonSize[2], buttonSize[2]},
      FontSize = FSize - 2,
      Padding = 0,
      Color = Colors.Green
    }
    x = x + textboxSize[1]
  end
  y = y + labelSize[2] + 4
  x = 4
  table.insert(
    graphics,
    {
      Type = "Label",
      Position = {x, y},
      Size = labelSize,
      Text = "Input",
      HTextAlign = "Right",
      Color = Colors.LightGray,
      FontSize = FSize
    }
  )
  x = x + labelSize[1] + 8

  for i = 1, props["Output Count"].Value do
    layout["select_" .. i] = {
      Style = "Text",
      Position = {x, y},
      PrettyName = "Output " .. i .. "~Select",
      Size = textboxSize,
      FontSize = FSize - 2,
      Padding = 0,
      Color = Colors.White,
      TextBoxStyle = "Normal"
    }
    x = x + textboxSize[1]
  end

  y = y + labelSize[2] + 4

  for i = 1, props["Input Count"].Value do
    x = 4
    table.insert(
      graphics,
      {
        Type = "Label",
        Position = {x, y},
        Size = labelSize,
        Text = tostring(i),
        HTextAlign = "Right",
        Color = Colors.LightGray,
        FontSize = FSize
      }
    )
    x = x + labelSize[1] + 8
    for out = 1, props["Output Count"].Value do
      layout["output_" .. out .. "_input_" .. i .. "_select"] = {
        Style = "Button",
        ButtonStyle = "Toggle",
        Position = {x, y},
        PrettyName = "Output " .. out .. "~Input " .. i .. " Select",
        Size = buttonSize,
        Margin = 2,
        CornerRadius = 2,
        Padding = 0
      }
      x = x + buttonSize[1]
    end
    y = y + labelSize[2]
  end
elseif current_page == PageNames[2] then --Settings
  table.insert(
    graphics,
    {
      Type = "GroupBox",
      Position = {x, y},
      Size = {250, 80},
      Text = "Crossfade Configure",
      HTextAlign = "Left",
      StrokeColor = Colors.LightGray,
      StrokeWidth = 1,
      CornerRadius = 8,
      FontSize = FSize
    }
  )
  table.insert(
    graphics,
    {
      Type = "Label",
      Position = {8, 28},
      Size = {64, 36},
      Text = "Time",
      HTextAlign = "Right",
      Color = Colors.LightGray,
      FontSize = FSize
    }
  )
  table.insert(
    graphics,
    {
      Type = "Label",
      Position = {8, 64},
      Size = {64, 16},
      Text = "Type",
      HTextAlign = "Right",
      Color = Colors.LightGray,
      FontSize = FSize
    }
  )

  layout["crossfade_time"] = {
    Style = "Knob",
    Position = {80, 28},
    Size = {36, 36},
    PrettyName = "Crossfader Settings~Crossfade Time",
  }
  layout["crossfade_type"] = {
    Style = "ComboBox",
    Position = {80, 64},
    Size = {170, 16},
    FontSize = FSize - 2,
    Padding = 0,
    PrettyName = "Crossfader Settings~Crossfade Type",
  }
end