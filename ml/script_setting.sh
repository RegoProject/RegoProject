#!/bin/bash

pip install torch \
torchvision \
timm

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

pip install gdown
echo "gdown check"

curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print$NF}' ./cookie`&id=1826V4X63UFaN1ElTN17kSiwRqIMRiQ-c" -o "resnet50_final_dish.pth" rm cookie
echo "final_dish check"

curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print$NF}' ./cookie`&id=13yHUeuqzZe4WJgz4OAz9tC68HxInLtPU" -o "resnet50_final_ing.pth" rm cookie
echo "final_ing check"

python3 real_API.py
