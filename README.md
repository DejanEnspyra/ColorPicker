<a href="https://swift.org" target="_blank"><img src="https://img.shields.io/badge/Language-Swift%204-orange.svg" alt="Language Swift 4"></a> 

# ColorPicker
Color picker written in Swift

This is a revised edition from https://github.com/DejanEnspyra/ColorPicker

Revisions include update to Swift 4 and the addition of a brightness selector.
   
![GitHub Logo](/images/screenshot1.png)

## Installation

Copy ColorPicker, BrightnessPicker, and ColorControl into your project.

Create a new view with three views with outlets: <br>
   * @IBOutlet var colorPicker: ColorPicker!<br>
   * @IBOutlet var colorView: UIView!<br>
   * @IBOutlet var brightness: BrightnessPicker!<br>

Viewcontroller must conform to the ColorDelegate protocol. Use the pickedColor() protocol function to change the colorView background plus any other functions you desire.
