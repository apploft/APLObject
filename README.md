APLObject
=========

NSObject subclass with automatic debugDescription. Creates a debug description containing all properties and their value using runtime-magic.

## Installation
Install via cocoapods by adding this to your Podfile:

	pod "APLObject", "~> 0.0.2"

## Usage
Just subclass `APLObject` and use `[myAPLInstance debugDescription]` for debugging.