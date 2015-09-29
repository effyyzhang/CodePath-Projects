# Carousel Demo

This is CodePath Week2 Assignment - Carousel Demo. 

##### Time spent: 
about 12h in total.

##### Completed user stories:
Setup:
- Create a new project (disable Auto Layout). New Project
- Add the image assets above. Adding Image Assets
- Configure the app icon and splash screen. App icon and launch image
- Add the Common.swift file to your project. Be sure to select "Copy items if needed".

Intro Screen:
- In the Storyboard, add a custom view controller for the IntroViewController. Creating Custom View Controller
- Configure the view controller to be freeform, so that you can make it long enough to see the entire intro page. Creating Free Form View Controller
- Add UIImageViews for each photo tile in the region below. Using UIImageView
- Configure the content size of the scroll view. Using UIScrollView
- Optional: Register for the scroll view scroll events Registering for scroll events
- Optional: Whenever a scroll event happens, configure the transform property on the image view. Using View Transforms,Animating View Properties

Sign In:
- Add custom nav bar as a UIImageView, form background, text fields, text, and Sign In button.
- Tapping the Sign In button with either a blank email or blank password should show an error alert. Using UIAlertController
- Tapping the Sign In button with a populated email and password field should display a loading alert for 2 seconds. After the 2 seconds are up, you should do one of the following (Calling a Method After Delay): Display an error for incorrect email/password. / Go to the tutorial screens.

Tutorial Screens:
- Create a custom free form view controller that is wide enough for 4 screens. Creating Custom View Controllers, Creating a Free Form View Controller
- Add a UIScrollView with paging enabled and 4 UIImageViews for the welcome screens (Note: we're explicitly not using UIPageViewController, which requires extra coding, to build these screens)
- Add a UIPageControl (should be outside the scrollview) and link it with the scrollview. Using UIPageControl
- Add the "Take Carousel for a Spin" button (should be outside the scrollview). Should have an initial alpha of 0, set the alpha to 1 upon reaching the 4th page.
- Tapping the "Take Carousel for a Spin" button should launch the Image Timeline (in a Navigation Controller) modally.
Image Timeline
- Add a UIImageView for the custom nav bar and a scrollview for the image feed.
- Add buttons for Settings and Conversations.
- Tapping the Conversation button should push the ConversationsViewController.
- Tapping the Settings button should modally present the SettingsViewController.

Create Account:
- Add custom nav bar, form background, text fields, text, terms text and button, and Create Account button.
- Upon showing the keyboard, move the elements to be visible. Registering for Keyboard Events
- Add a selected state for the terms button. Configure a Button


##### Walkthrough of all user stories:
![carousel](https://cloud.githubusercontent.com/assets/4413445/10157438/18536156-663f-11e5-9b99-4e7b028458b1.gif)
