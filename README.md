# Members Only

Building an exclusive clubhouse where  members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

There's also an authentication system authentication system using SHA1 hashing function for password encryption.

## DESCRIPTION

There're 2 main models for the app's functionality
- **User** : User data stored here
- **Post** : Contains Posts of Users (a User can have multiple posts)

There's a SESSION_CONTROLLER to manage sessions. Many helper functions to assist the session controller file is found in the **application_controller** file


## Contributors

- Louis SHEY _https://github.com/shloch_
- Fabien PHILIP _https://github.com/pwilson77_