# Hacking with Swift

My personal version of the code from "Hacking with Swift" by Paul Hudson

## Introduction

A simple introduction, overview of XCode and Swift programming language

## Project I: Storm Viewer

Learned the structure of a basic iOS App, designed UI through Interface Builder, basic constraints, used UIViewController and UITableViewController

## Project II: Guess the Flag

Practiced designing UI with interface builder, I learned about @2x, @3x images and using assets catalog. I Changed the look of a standard UIButton editing the CALayer underneath.
Used AlertController to show the score

#### Project II - Edits

I decided to update Paul Hudson's Project II displaying the score with a label and preventing the score to be negative, forcing a new game (reset score to 0)

## Project III: Social Media

Learned to create BarButtonItem inside navigationBar, implement basic sharing functionality with UIActivityViewController

## Project IV: Easy Browser

I used WebKit framework implmenting new WKWebView, implemented also some WKNavigationDelegate methods.  
  
Used also a lot of other classes like URL, URLRequest, UIToolbar, UIProgressView and a lot more...  
  
Most important thing: I learned a little bit of KVO adding an observer to observe WKWebView estimatedProgress property. Implemented observeValue method.

> Remember to delete the observer once is not used, in this case not needed because I had only one VC, in case of a more complex app this is mandatory

#### Project IV - Future edits

Add the option to load the list of website from a file

## Project V: Word Scramble
