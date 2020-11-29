@echo off
call C:\Users\chall\anaconda3\Scripts\activate.bat C:\Users\chall\anaconda3
cd C:\Users\chall\Desktop\pythonBot\firstOrder\first-order-model
call conda activate FO2
IF "%1"=="" (
echo 1. Dame
echo 2. Reddit Moment
echo 3. Flex Tape Disclamer
echo 4. A Toast
echo 5. Attention
echo 6. JP Apology
echo 7. Scatman
echo 8. Single
echo 9. STFU
set /p video="Enter Number Of Video To Warp too: "
) ELSE (
echo %1
set video=%1
)
echo Loading........
call python demo.py  --config config/vox-adv-256.yaml --driving_video ../automatic/inputCropped/%video%.mp4 --source_image ../automatic/inputImage/image.jpg --checkpoint checkpoints/vox-adv-cpk.pth.tar --relative --adapt_scale
move result.mp4 C:\Users\chall\Desktop\pythonBot\firstOrder\automatic
cd C:\Users\chall\Desktop\pythonBot\firstOrder\automatic
ffmpeg -i result.mp4 -i inputCropped/%video%.mp3 -c:v copy -c:a aac finalFile.mp4 -y
del result.mp4
CLS
echo Process Finished, the completed file is named finalFile.mp4