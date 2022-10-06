# Docker-Unifi-API-client

For a little project I've been wanting a way to programmatically connect to my Unifi equipment. And after finding a easy to understand api the only huge task left was writing this thin wrapper in the form like a huge whale with a container on its back.

But enough with the fuzzy story about why this container exists.
Especially thinking that I'm considering myself mostly as a classic-modern, middle-aged junior in mostly any of these type of scripting and programming tasks.

For example I'm trying learn while automating all provision of any hardware connected in my network and eventually automating as much as everything enabling me toward the ultimate goal.

Plugging in a bare-metal ( or plastic) thing 🤖, and provision, configure and enable it to help me toward the next expansion.

And as I desperately needed something which enabled me to communicate with my Unifi controller(s) in a programmatic way. When combining this with Ansible or a shell script it's way more efficient then asking it to what to you want verbally.

All credits though, belong to [Art-of-Wifi](https://github.com/Art-of-WiFi) who did all of the heavy lifting with this really cool php api.

## Requirements

* Working [docker](https://get.docker.com) installation
* direct network connectivity between this server and the host and port (usually TCP port 8443 or port 443 for UniFi OS) where the UniFi Controller is running
* you must use accounts with local access, not UniFi Cloud accounts, to access the UniFi Controller API through this class

## UniFi OS Support

Support for UniFi OS-based controllers has been added as of version 1.1.47:

* UniFi Dream Router (UDR)
* UniFi Dream Machine (UDM)
* UniFi Dream Machine Pro (UDM PRO)
* Cloud Key Gen2 (UCK G2), firmware version 2.0.24 or higher
* Cloud Key Gen2 Plus (UCK G2 Plus), firmware version 2.0.24 or higher

The class automatically detects UniFi OS-based controllers and adjusts URLs and several functions/methods accordingly.
If your own code implements strict validation of the URL that is passed to the constructor, please adapt your
logic to allow URLs without a port suffix or with port 443 when working with a UniFi OS-based controller.

Please test all methods you plan on using thoroughly before using the API Client with
UniFi OS devices in a production environment.

## Getting Started

To get your container built is as easy as flopping around a few commands:

```bash
git clone https://github.com/pbicskei/docker-unifi-api-client.git

cd docker-unifi-api-client
make load
make build
```

## Preparation

Before you can run your freshly built container; A little bit of preparation is needed, because the container will need a few secret values in order to connect to your UniFi controller.

Create a `.env` file in the root of the repository and ensure its private.

```bash
cp .env-example .env
chmod 600 .env
```

> Adjust the content of this file according your Unifi Installation.
> Using it through is proxy or providing your controller with a ssl certificate is highly recommended.

In the .env file there is also a function to easily instantiate an api-call to the controller.

```bash
source .env
```

```bash
function api_call() {
docker run --rm -it --name ubnt_api_call \
-e CONTROLLER_USER=${UBNT_USER} \
-e CONTROLLER_PASSWORD=${UBNT_PASSWORD} \
-e CONTROLLER_URL=${UBNT_URL} \
-e CONTROLLER_VERSION=${UBNT_VERSION} \
unifi-api-client calls/$*
}
```

## Usage

In your terminal use `api_call` without arguments to retreive the list of available calls.

```bash
api_call
```

Passing `api_call` with an argument for example; `list_self.php` will result in the information about the User it's connecting with.

```bash
api_call list_self.php
```

### Bonus

Because we are using a intermediate function we can easily process it through a json processor like `jq` for example.

```bash
api_call list_self.php | jq '.'
```
