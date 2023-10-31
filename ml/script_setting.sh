#!/bin/bash

pip install torch \
torchvision \
timm

git clone https://github.com/RegoProject/RegoProject.git
cd RegoProject/ml
git clone https://github.com/IDEA-Research/GroundingDINO.git
cd GroundingDINO
pip install -q -e .
pip install -q roboflow
cd ..
echo "Git downlod check"

mkdir weights
cd weights
wget -q https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth
cd ..
echo "Grounding DINO check"

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1826V4X63UFaN1ElTN17kSiwRqIMRiQ-c' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1826V4X63UFaN1ElTN17kSiwRqIMRiQ-c" -O resnet50_final_dish.pth && rm -rf /tmp/cookies.txt

python3 real_API.py
