# botkaMaitai
This is a bot written in python to automatically convert images using the first-order facial warp model, using one of 9 meme videos as templates

# To start the server on linux, run
cd ~/../storage/discord/pythonBotLinux && python bot.py

# To install on linux(I recommend using a paperpace server, make sure you have a gpu with cuda)
1. Download and unzip the folder somewhere
2. Install anaconda3
3. Install ffmpeg
4. Navigate to the first-order-model folder
5. pip install -r requirements.txt
6. Try and run the server, pip install any failed imports(likely discord, dotenv, and more)
7. You may be missing other packages, not sure all that is needed but once the server
successfully runs, use in discord
8. To add to new servers, check the discord dashboard
9. Edit the .env file with your discord token

# To install on windows
1. Do the same things as linux, basically just set up as you would to use the first order model
2. delete the bot.py file and rename the windowsBot.py file to bot.py
