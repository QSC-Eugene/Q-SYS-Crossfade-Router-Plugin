XFaders = {}
for i = 1, Properties["Output Count"].Value do
  table.insert(XFaders,_G["XFader" .. i])
end