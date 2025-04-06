# Mount disk using a shell script (Tested on Debian)

## Requirements 
This scripts depends on the library `pcregrep`, it makes working with regex easier.

Install it on debian via
```
sudo apt install pcregrep
```

## How to use it 
First you need to condigure the variables accroding to your need.
`user` variable is your username
`diskSize` is the size of your disk
`mountPoint` is the location where you want to mount the disk

You can find necessary info via the command `lsblk`. And fell free to edit the regex accroding to your needs or what might work for you.

After successfully completing this you have to make this file executable. You can do it via the command `sudo chmod +x mount-disk.sh`.

Now you are ready to execute it `./mount-disk.sh` (feel free to change the path). 

It works but you really don't want to run it every time. Let's setup a cronjob, that will mount it automatically every time. 

You will have to use cronjob for it. Type `sudo crontab -e` to edit the file and add the job. It requires root privileges, so we are using crontab for the root user. 
Now add the following line
```
@reboot /home/karim/.scripts/mount-disk.sh
```

`@reboot` means we want to the script located `/home/karim/.scripts/mount-disk.sh` here every time we boot the system. Don't forget to change the username.

Yeah long processssss, but it's worth it.
