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

python3 real_API.py
