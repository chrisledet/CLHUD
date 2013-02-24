## CLHUD

Simple HUD library for iOS.

[![](https://raw.github.com/chrisledet/CLHUD/master/Screenshot.png)](https://raw.github.com/chrisledet/CLHUD/master/Screenshot.png)

### Usage

To start using CLHUD, copy all the files inside the `Classes` directory into your Xcode project.

Then import the CLHUD header file inside your code:

	#import "CLHUD.h"
	
To display it on your view controller, just do the following:
	
	CLHUD *hud = [CLHUD alloc] initWithTitle:@"Completed!"];
	[hud displayOnView:self.view];

You can also set the display duration:

	[hud displayOnView:self.view for:5.0f];

And if you would like to set the text font:

	hud.textFont = [UIFont fontWithName:@"Courier" size:20.0f];
	
### Sample Project

This repo includes a sample Xcode project to see CLHUD in action.
	
### LICENSE

CLHUD is released under the MIT License.
