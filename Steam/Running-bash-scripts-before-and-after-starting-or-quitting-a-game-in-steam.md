# Running bash scripts before and after starting/quitting a game (in GNU/Linux)

Right click on a game in Steam and choose "properties". Then in the "General" tab and under the rubric "Launch options" one can enter the following:
```
/home/olof/bin/gaming-mode.sh && %command% && /home/olof/bin/normal-mode.sh
```
Note that the scripts must be executable (`chmod +x ..`).
