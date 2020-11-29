#!/usr/bin/python
import os
import requests

import subprocess


import discord
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

client = discord.Client()

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content == '~help':
        response = "welcome to botka\nto use the bot, supply an image, along with the command ~warp and a number between 1 and 4\n1 = Dame\n2 = Reddit Momment\n3 = Flex Tape Disclamer\n4 = A Toast\n5 = Attention\n6 = JP Apology\n7 = Scatman\n8 = Single\n9 = STFU\nFor example, attaching the command ~warp 3 to an image would warp the acompanying image to the Flex Tape Disclamer source video\nplease allow around a minute for the finished video to return"
        await message.channel.send(response)

    if message.content.startswith('~warp'):
        if not message.attachments:
            response = "no image detected, please attach your command to a valid jpg or png image, use ~help for more"
            await message.channel.send(response)
            return
        videoChoice = message.content[-1:]
        url = message.attachments[0].url
        r = requests.get(url, allow_redirects=True)
        open('image.jpg', 'wb').write(r.content)

        response = "image downloaded, warping, this will take a minute"
        await message.channel.send(response)

        #os.replace("~/../storage/discord/pythonBotLinux/image.jpg", "~/../storage/discord/pythonBotLinux/firstOrder/automatic/inputImage/image.jpg")
        os.replace("image.jpg", "firstOrder/automatic/inputImage/image.jpg")
        subprocess.call(['firstOrder/automatic/faceWarp.sh', videoChoice])

        response = "warping complete, finalizing"
        await message.channel.send(response)
        os.replace("firstOrder/automatic/finalFile.mp4", "BotkaMitaVideo.mp4")

        await message.channel.send(file=discord.File('BotkaMitaVideo.mp4'))

client.run(TOKEN)