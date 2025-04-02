# Q-SYS-Crossfade-Router-Plugin

A drop in replacement for a Router Component that utilizes internal crossfaders

## Properties

| Name          | Description |
| ------------- | ----------- |
| Input Count   | Sets the Number of Inputs between 2 and 128 |
| Output Count  | Sets the Number of Outputs between 1 and 128 |
| Type          | Select a multi-chanel type (Mono, Stereo, Multi-chanel) |
| Count         | Sets how many channels per Input when Multi-channel is selected |

Note: Fading LED will only light when running on a core. this is a limitation of the crossfader component within Q-SYS Designer. See documentation [here](https://help.qsys.com/#Q-SYS_Designer/003_Emulate_Mode.htm#Limitations?Highlight=Crossfader)

## Release Notes

### 1.3.2.0

- Added Control Descriptions
- Added Property Descriptions
- renamed "Crossfade Type" and "Crossfade Time" controls to align with the rest of the control naming
- Added Help Documentation

### 1.3.1.2

- Expanded to 128x128
