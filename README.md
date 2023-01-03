# Homer
Homer is a jailbreak tweak for iOS 7 that runs a custom command when the Home button is clicked, optionally preventing the default behavior of closing the app and returning to the home screen.

> **Warning** • This is a specialized tweak that can make it hard to use your phone.

## To build and use
1. Install [Theos](https://theos.dev/) on your computer.
1. Clone the repo locally.
1. Run `make do`, which builds the package and attempts to install on your iOS device (if you’ve [set the device IP address first](https://theos.dev/docs/commands)).

This tweak has been tested on a jailbroken iPhone 4 running iOS 7. It works alongside [Activator](http://rpetri.ch/cydia/activator/) and [Speedy Homey](https://pw5a29.github.io/).

## Usage
On your iPhone, go to Settings ‣ Homer. Respring after making any changes.

When `Prevent Default Action` is on, the iPhone Home button does not background the current app and return to the SpringBoard. This is deliberate, so I used Activator to show the multitasking view upon completing some other gesture so I can go back home and switch to other apps when necessary.

## It’s 2023 why are you doing this
I’ve been upgrading my [smarthome setup](https://johnmatu.la/projects/smarthome/) lights and controls lately. The web UI still runs on an iPhone 4, and for this latest iteration, I wanted to take over all of iPhone’s buttons for my own needs. Specifically, I really wanted to get the physical Home button under my control, but any customization I could set up in Activator was understandably restricted. After discovering how to [bypass this restriction](https://github.com/rpetrich/libactivator/blob/headers/LAListener.h#L18) and really start breaking the iOS experience, I kludged this little tweak together by reviewing similar tweaks that were compatible with iOS 7 ([1](http://cydia.saurik.com/package/us.hannahpappah.incarcerapp/), [2](https://www.reddit.com/r/jailbreak/comments/3qm3nh/release_buttondisabler_disable_your_physical/)).
