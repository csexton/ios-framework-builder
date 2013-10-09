# iOS Framework Builder

This project has been inspired a great deal by [Jeff Verkoeyen's iOS Framework](https://github.com/jverkoey/iOS-Framework) guide. Many thanks Jeff.

This is basically a ruby port of his shell script. I ran into problem with his guide when apple released the 64 bit platforms—specifically needing to support 32 bit and 64 bit simulators with the same `.framework` bundle.

## Getting Started

See the [howto guide](HOWTO.md) to get started. This will guide you through the steps necessary add the build script to your project.

## Why?

You might ask "Why is this build script in a repo on github?"

Two reasons:

* I hope folks might find this helpful.
* I hope you might be able to extend this code to be more flexible and useful.

If you find a way to improve this script please send a pull request. I just ask that you make the changes in `/lib` and not in the `/standalone`. The latter is generated code.
