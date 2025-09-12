


12th Sep 2025 (Friday) topic: Client - Server Communication -Unix

Lec Slide Link:  https://www.csd.uoc.gr/~hy556/material/tutorials/cs556-3rd-tutorial.pdf





working diagrma 

        +-----------------+                           +-----------------+
        |                 |   Connect to port 8080    |                 |
        |    CLIENT.C     |  -----------------------> |    SERVER.C     |
        |  (127.0.0.1)    |                           |  (127.0.0.1)    |
        |                 |   Send message:           |                 |
        |                 |   "Hi my name is Kittu"   |                 |
        |                 |  -----------------------> |                 |
        |                 |                           |                 |
        |                 |   Receive echo:           |                 |
        |                 |   "Hi my name is Kittu"   |                 |
        |                 |  <----------------------- |                 |
        +-----------------+                           +-----------------+

                      📍 Both run on localhost (same PC)
                      🧠 Communication via TCP socket on port 8080


ThankYou
bhai

| Can You Use This?               | Answer          | Notes                                    |
| ------------------------------- | --------------- | ---------------------------------------- |
| `client.c` to `localhost:8080`  | ✅ Yes           | This is what you're doing now            |
| Web browser to `localhost:8080` | ❌ No (not HTTP) | Unless server is HTTP (e.g., Flask/Node) |
| `curl localhost:8080`           | ❌ No            | Same — `curl` expects HTTP response      |





📁 Your folder structure should look like this:
CNS/
├── Client/
│   └── client.c
├── Server/
│   └── server.c



