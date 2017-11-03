# Josh's Dotfiles
## To Install:
```bash
https://raw.githubusercontent.com/cjoshmartin/Dotfiles/master/install.sh | bash
```

## Notes:

#### Requires
 - vim, git, curl and zsh
 
 
#### Running the dockerfile 

```bash
 docker build .
 # afterwards it will give you a image id
 # paste that into the following command
 docker run -it [docker image id]
 
 # to remove all docker containers type:
 docker rm $(docker ps -a -q)
```
