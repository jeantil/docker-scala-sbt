# Usage

Create and build your own docker file referencing this one, like for example

```
from jeantil/scala-sbt
CMD ["sbt", "compile","~test"]
```

The `scala-sbt` image has 2 volumes to be bound :

 - /src 
 - /root/.ivy2

I stronly suggest creating a named volume to bind /root/.ivy2 to avoid
downloading all your dependencies each time the container restarts : 
```
docker volumes create --name ivy2
```

Then you can use the image like so : 
```
docker run -v .:/src -v ivy2:/root/.ivy2 ${image name or sha-1}
```

