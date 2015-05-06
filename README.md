#ios-pics-flask-server
a simple exemple for sending and receiving pics from iOS with Flask

It took me a while to figure out how to send a pics to a flask server from a Swift iOS app. I don't have any personnal website so i decide to put it on gitHub.

How to install Flask : http://flask.pocoo.org/

iOS app use CocoaPods with Alamofire : https://github.com/Alamofire/Alamofire AFNetworking : https://github.com/AFNetworking/AFNetworking SwiftyJSON : https://github.com/SwiftyJSON/SwiftyJSON

How to install CocoaPods : https://cocoapods.org/

iOS part :

I decide to use AFNetworking for sending pics because i was in trouble to set MimeType , multipart/form-data and stuff like that with Alamofire. This amazing lib is written in Objective-C so you need to tell it to XCode. How ? http://stackoverflow.com/questions/24120402/swift-and-afnetworking-integration I get the answer here. thanks to the great mighty SO one more time.

So first AFNetworking is used to send pics with good MimeType. On success, the ResponseObject is stored as JSON object via SwifftyJSON, it's now possible to get the pics name just by writting : json["name"].string!

then, this information is used to download the just sent pictures.

Flask part:

First, you need to learn more about flask here : http://flask.pocoo.org/docs/0.10/ The simple python code come from here : http://flask.pocoo.org/docs/0.10/patterns/fileuploads/

When the app send a POST request to (URL_PATH)/picture, in this case, http://localhost:5000/picture upload_file() will be called and will do the job :)

I decided to change the pics name to a timestamp to avoid to get only one pics on server-side

send_pics(name) take the name of the picture you want to download and send it back to you.

It's probably not the best way to use iOS with Flask, but I'm was looking for an example during so many times, i hope it will help

Feel free to help me to improve this example !

Sorry for my english :D
