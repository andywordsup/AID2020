import json
import hashlib
import time

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from tools.login_check import login_check
from user.models import UserProfile


def tokens(request):
    """
    登入帳號,取前端传来的数据/生成token
    #前端地址 http://127.0.0.1:5000/login
    create token==login
    :param request:
    :return:
    """

    if request.method != 'POST':
        result = {'code': 101, 'error': 'Please use POST'}
        # 前端地址 http://127.0.0.1:5000/login
        # 获取前端传来的数据/生成token
        # 获取-校验密码-生成token
        # 获取前端提交的数据
        return JsonResponse(result)
    json_str = request.body
    print(json_str)
    # .body 造成b""
    # b'{"username":"andy","email":"aaa@818250","password":"111111"}'
    if not json_str:
        result = {'code': 102, 'error': 'Please give me json'}
        return JsonResponse(result)
    # 用於將str型別的資料轉成dict,轉python對象。
    json_obj = json.loads(json_str)

    username = json_obj.get('username')
    print('username:', username)
    if not username:
        result = {'code': 103, 'error': 'check username'}
        return JsonResponse(result)
    password = json_obj.get('password')
    if not password:
        result = {'code': 104, 'error': 'check password'}
        return JsonResponse(result)
    # 參數已可認定格式全部取出後從資料庫比對驗證有無重複數據
    user = UserProfile.objects.filter(username=username)
    print("tokens(request):UserProfile.objects.filter(username=username):", user)
    # user 是一個集合 這裡是list["username":"andy","email":"aaa@818250","password_1":"111111","password_2":"111111"]
    # 但直接 print 會顯示<QuerySet [<UserProfile: UserProfile object>]>

    if not user:
        result = {'code': 105, 'error': 'check account or password'}

        return JsonResponse(result)
    user = user[0]
    print(user.username)
    m = hashlib.md5()
    m.update(password.encode())
    print(user.password)
    print(m.hexdigest())
    if m.hexdigest() != user.password:
        result = {'code': 106, 'error': 'check account or password'}
        return JsonResponse(result)

    token = make_token(username)
    result = {'code': 200, 'username': username, 'data': {'token': token.decode()}}
    return JsonResponse(result)


# ----------------------------------------------------------------------------

def make_token(username, expire=3600 * 24):
    # 官方jwt / 自定义jwt
    import jwt
    key = '1234567'
    now = time.time()
    payload = {'username': username, 'exp': int(now + expire)}
    return jwt.encode(payload, key, algorithm='HS256')
