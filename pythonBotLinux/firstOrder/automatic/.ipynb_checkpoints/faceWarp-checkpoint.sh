#!/bin/bash
source ~/anaconda3/etc/profile.d/conda.sh
conda activate faceswap
cd ~/../storage/discord/pythonBotLinux/firstOrder/first-order-model
if [ -z "$1" ]; then
echo 1. Dame
echo 2. Reddit Moment
echo 3. Flex Tape Disclamer
echo 4. A Toast
echo 5. Attention
echo 6. JP Apology
echo 7. Scatman
echo 8. Single
echo 9. STFU
echo Enter Number Of Video To Warp too: 
read VIDEO
else
echo $1
VIDEO=$1
fi
echo Loading........
python demo.py  --config config/vox-adv-256.yaml --driving_video ../automatic/inputCropped/$VIDEO.mp4 --source_image ../automatic/inputImage/image.jpg --checkpoint checkpoints/vox-adv-cpk.pth.tar --relative --adapt_scale
mv result.mp4 ~/../storage/discord/pythonBotLinux/firstOrder/automatic
cd ~/../storage/discord/pythonBotLinux/firstOrder/automatic
ffmpeg -i result.mp4 -i inputCropped/$VIDEO.mp3 -c:v copy -c:a aac finalFile.mp4 -y
rm result.mp4
echo Process Finished, the completed file is named finalFile.mp4