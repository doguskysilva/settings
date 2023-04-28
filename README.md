# settings

The location of all files to to backuped need to be put in `files.txt`
Each line represent a file. By security never put the user folder in path. 
Use tilde expansion to represent user folder `~/.config` and not `/home/user/.config`

## Backup
```bash 
sh manager.sh backup
```

The command will:
- get all files listed in `files.txt` and put in `resources` folder 
- add all files to stage
- create a message commit
- push all files to repository

## Restore
```bash 
sh manager.sh restore
```

The command will:
- get all files inside resources and put in each folder following `files.txt`
- if a folder not exists the script will create the path

### Tools to use before restore
Install plugins to tmux https://github.com/tmux-plugins/tpm
Install some nerd font
