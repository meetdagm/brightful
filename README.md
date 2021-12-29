# brightful

Future improvements:
1. We can definetely refactor the ListView to accept a viewModel that is generic and can handle a stream service that the other viewModels can extend or use

This mobile app leverages the stacked framework to handle the heavy lifting in terms of Architecture. Any screen that you see in the code base has 2 components. A {View} component, in charge of handling the view layer of the application (Layou, User Interaction) and the {ViewModel} component, in charge of handling the business logic of the application. These previous component makes use of a service layer, to handle functionalities and communicate request to the persistence layer. 

Decoupling the application in this way, creates a clean, reusable layer where the application can be scaled properly, by abstracting away implementation details.

In addition to that, I've created a DB layer that is abstract enough that we can swap out the underlying DAAS without thouching any view or business logic layer, which makes the code highly reusable and clean.
