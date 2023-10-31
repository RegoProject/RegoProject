#!/usr/bin/env python
# coding: utf-8

# In[26]:


import io
import torch
from PIL import Image
import json
import flask
from flask import Flask, request, jsonify
import pickle
from torchvision import transforms
from torchvision.models import resnet50
import base64
import ast
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.preprocessing import MultiLabelBinarizer
import pandas as pd
from torchvision.datasets import ImageFolder

app = Flask(__name__)

# device 설정
device = "cuda" if torch.cuda.is_available() else "cpu"

# 데이터 변환 모듈 로드 (검증 데이터 용으로)
transform = transforms.Compose(
    [
        transforms.Resize([224, 224]),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485, 0.456, 0.406],
                             std=[0.229, 0.224, 0.225])
    ]
)

"""recipe.csv 불러오고 필요한 list 생성"""
df = pd.read_csv('recipe.csv', encoding='cp949')
cook_list = [] # 레시피 목록
ingredients = [] # 레시피별 재료 목록
all_ingredients = {} # 전체 재료 목록
for idx, row in df.iterrows(): # pandas dataframe의 한 행씩 가져옴. idx=행 번호(0부터), row=행의 data
    cook_list.append(row['메뉴'])
    ingredient_map = {}
    for val in ast.literal_eval(row['재료']):
        ingredient_map[val] = 1
        all_ingredients[val] = 1
    ingredients.append(ingredient_map)

# cook_list 정렬(success에 필요)
cook_list.sort()

# 재료의 카테고리 번호를 저장 (중복X)(recommend에 필요)
category_index = {} 
for idx, val in enumerate(sorted(all_ingredients.keys())):
    category_index[val] = idx

matrix = []
for ingred_map in ingredients:
    tmp = []
    for val in ingred_map.keys(): 
        tmp.append(category_index[val])
    matrix.append(tmp)

# 0, 1 행렬로 변환
mlb = MultiLabelBinarizer()
multi_hot_matrix = mlb.fit_transform(matrix)

"""식재료 데이터 불러오기"""
val_data_dir = '../ing_val4'
val_dataset = ImageFolder(val_data_dir)
class_names = val_dataset.classes

"""success 모델 로딩"""
# num_classes는 학습된 레시피의 개수
success_model = resnet50(num_classes = len(cook_list))
success_weights_path = "resnet50.pth"
success_model.load_state_dict(torch.load(success_weights_path, map_location=torch.device('cpu')))
success_model.eval()

"""ing_predict 모델 로딩"""
# num_classes는 학습된 식재료 개수
ing_model = resnet50(num_classes = 69)
ing_weights_path = "ing_resnet50.pth"
ing_model.load_state_dict(torch.load(ing_weights_path, map_location=torch.device('cpu')))
ing_model.eval()

"""완성 사진 성공 여부 출력해주는 API"""
@app.route('/success', methods=['POST'])
def predict():
    if request.method == 'POST':
        data = flask.request.data.decode('utf-8')
        s = io.StringIO(data)
        js = json.load(s)

        label = js['label'] # 사용자가 만든 음식 라벨
        image = Image.open(io.BytesIO(base64.b64decode(js['image'].split(',')[-1]))).convert('RGB')
        input_data = transform(image).unsqueeze(0).to(device)

        outputs = success_model(input_data)
        top4_op = outputs.topk(4, dim=-1)[1][0].numpy().tolist()
        
        # 모델이 예측한것과 레시피의 음식이 일치하는지 확인 (음식 라벨과 모델 예측값이 일치하는지 확인)    
        success_res = False
        for i in top4_op:
            if cook_list[i] == label:
                success_res = True
        
        result = {
            "results" : success_res
        }

        return flask.Response(
            response=json.dumps(result, ensure_ascii=False, indent='\t'),
            status=200,
            mimetype="application/json"
        )
    
"""레시피 추천해주는 API"""
@app.route('/recommend', methods=['POST'])
def recommend():
    if request.method == 'POST':
        data = flask.request.data.decode('utf-8')
        s = io.StringIO(data)
        js = json.load(s)
        
        ing = js['user_ing']
        
        all_ing_len = len(list(all_ingredients.keys()))
        
        user_matrix = [0 for i in range(all_ing_len)]
        for i in ing:
            user_matrix[i]=1
        
        similarity_scores = cosine_similarity([user_matrix], multi_hot_matrix)[0]
        
        idxs = np.argsort(similarity_scores)[::-1]

        # 상위 5개 점수
        top5_scores = similarity_scores[idxs][:5]
        top5_idxs = idxs[:5] # 상위 5개 인덱스 번호
        top5_recipe = [] # 상위 5개 매칭 레시피

        for id in top5_idxs:
            top5_recipe.append(cook_list[id])
        
        result = {
            "recipe" : top5_recipe
        }
        
        return flask.Response(
            response=json.dumps(result, ensure_ascii=False, indent='\t'),
            status=200,
            mimetype="application/json"
        )

"""OD 식재료 라벨 출력하는 API"""
@app.route('/ing_predict', methods=['POST'])
def predict_ing():
    if request.method == 'POST':
        data = flask.request.data.decode('utf-8')
        s = io.StringIO(data)
        js = json.load(s)

        image = Image.open(io.BytesIO(base64.b64decode(js['image'].split(',')[-1]))).convert('RGB')
        input_data = transform(image).unsqueeze(0).to(device)

        outputs = ing_model(input_data)
        label_pre = outputs.topk(1, dim=-1)[1][0]
        
        result = {
            "result" : class_names[label_pre]
        }
        
        return flask.Response(
            response=json.dumps(result, ensure_ascii=False, indent='\t'),
            status=200,
            mimetype="application/json"
        )
        
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

