# Distributed snake game in Java

Up to 4 players can join the game.

## Building

``mvn install``

## Running

Starting the server:

```
mvn exec:java -Dexec.mainClass=server.Server
```

Starting the client in player mode:

```
mvn exec:java -Dexec.mainClass=client.Client -Dexec.args="PLAYER"
```

Starting the client in computer mode:

```
mvn exec:java -Dexec.mainClass=client.Client -Dexec.args="COMPUTER"
```

## Playing

Each player plays using the arrows keys