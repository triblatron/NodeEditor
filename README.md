# NodeEditor
An editor for node-based low-code environments.  It will separate the UI from the back-end using a network protocol.
The aim is to have a consistent experience across mobile, desktop and web, although this could be tricky on mobile with smaller screens.
There is the possibility to support multiple node types such as UML classes using plugins.

# Task list
* Get basic funcionality working:
  * Build a model of a graph using abstract shapes such as boxes, paths, ports, lebels and groups
  * Build a widget tree in the chosen front-end toolkit
  * Generate protocol in response to user actions in the editor
    * Drag from the palette to the main view to instantiate a template
    * Click a node to bring up the details in the inspector
    * Double-click a group node to enter it
    * Click a port to start drawing a path
    * Drag a path and drop on another node to create a connection.
    * Drag a path across a connection to delete it.
* Fancy features
  * Create a plugin system to extend the type of node we understand such as UML classes
    * This would involve making the protocol flexible enough or implementing multiple protocols
    * The client and the server would have to talk the same protocol
    * The server can be extended with new node types such as UML classes and state machines
    * The protocol could talk in terms of the Model such as boxes, arrows and such, but not in terms of the View
    
## Dependencies
* Dart SDK
* Flutter SDK ( includes the Dart SDK )
* gRPC
* googletest
* A C++ 17 compiler:
  - Visual Studio >= 2019
  - gcc >= 8
  - clang >= 5
* arrow_path >= 3.1.0

## Schedule
We aim to hit 1.0 in the next few months.
