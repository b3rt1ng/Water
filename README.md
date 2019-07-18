# Water
This project it still a work in progress.


## What is it ?
Water is a tool that allow you to get informations about an IP address.
The script is using some shodan fonctionalyties and provide an accurate ip info gathering.
I tried to make the tool as fluid as possible (i called it water).

### why would i need this ?
 water can be really usefull when it comes to information gathering. You can use it to get some usefulls informations about a website but also about someone.

### Updates ideas.

automatic information gathering | more ip information using basics calculs | exif image information | ip fishing url generator | reverse shell generator and listener

### Shodan
[shodan](https://www.shodan.io/) is a search engine made to scan all kind of things related to internet connected devices.
Shodan provide some really usefull and easy to use api, allowing us to include it on the script. In order to use the API, you'll need to make yourself an account on the website and you'll get an API key. you can see the api but clicking on "show api key".

### Why does the program won't work on my device ?

-> the most common issue is that the script just won't boot preoprely. it's probably because you downloaded the script directly. To fix this, just copy the entire script [here](https://raw.githubusercontent.com/b3rt1ng/Water/master/main.bat) and paste it on the batch file

-> check if your computer's command prompt isn't bridled by an administrator, some command can be restricted.

-> the program has been tested on windows 10, it's possible that some command aren't even existing on your version (like curl for example)

-> try to run the program as an administrator (but this should not be a problem)

-> your firewall could restrict the usage of some API or some network usage, making some commands uneficients.

Otherwise, you can still try to adapt the software to your device and it would be a pleasure to add you as a contributor in this project.
I am still a beginer on batch and informatical security in general but i'm on my way to learn so, be kind.



#### usefull links:
[Download](https://github.com/b3rt1ng/Water/files/3311720/water.zip) |
[shodan API usage](https://developer.shodan.io/api)

