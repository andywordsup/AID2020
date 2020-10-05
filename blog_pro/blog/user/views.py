import hashlib
import json
import time

from django.shortcuts import render
from django.http import JsonResponse

# Create your views here.
from btoken.views import make_token
from tools.login_check import login_check
from user.models import UserProfile


@login_check('PUT')
def users(request, username=None):
    if request.method == 'GET':
        if not username:
            # /v1/users
            return JsonResponse({'code': 200, 'error': 'GET'})
        if username:
            # /v1/users/<username>?
            # 拿指定用戶數據指定用戶的指定字段數據
            # /v1/user/<username>?/nickname
            # 指定用戶的指定字段數據
            try:
                user = UserProfile.objects.get(username=username)
                print('user in get:', user)
                # user in get: UserProfile object

            except Exception as e:
                result = {'code': 208, 'error': 'check123 '}
                return JsonResponse(result)
        # 检查是否有查询字符串
        if request.GET.keys():
            # .GET.keys()取不到會直接報錯,但因為if else 關係走else
            # 查詢指定字段,email,password不給
            # 全量查询【password email 不给】
            data = {}
            print('request.GET.keys():', request.GET.keys())
            # dict_keys(['nickname', 'avatar'])

            for k in request.GET.keys():  # 判別循環的字段跟次數
                if hasattr(user, k):  # 判別是否有此字段才進入循環
                    v = getattr(user, k)
                    if k == "avatar":
                        data[k] = str(v)
                    else:
                        data[k] = v
            result = {'code': 200, 'username': username, 'data': data}
            return JsonResponse(result)


        else:
            # 全量查询【password email 不给】
            result = {'code': 200, 'username': username,
                      'data': {'info': user.info,
                               'sign': user.sign,
                               'avatar': str(user.avatar),
                               # 這user.avater是imgfile對象字段,必須改
                               'nickname': user.nickname}}
            return JsonResponse(result)




    elif request.method == 'POST':
        # 創建
        json_str = request.body
        print(request.body)  # .body 造成b""
        # b'{"username":"andy","email":"aaa@818250","password_1":"111111","password_2":"111111"}'
        if not json_str:
            result = {'code': 201, 'error': 'check yur json'}
            return JsonResponse(result)
        json_obj = json.loads(request.body)
        username = json_obj.get('username')
        if not username:
            result = {'code': 202, 'error': 'check yur username'}
            return JsonResponse(result)
        email = json_obj.get('email')
        if not email:
            result = {'code': 203, 'error': 'check yur email'}
            return JsonResponse(result)
        password_1 = json_obj.get('password_1')
        password_2 = json_obj.get('password_2')
        if not password_1 or not password_2:
            result = {'code': 204, 'error': 'check yur password'}
            return JsonResponse(result)
        if password_1 != password_2:
            result = {'code': 205, 'error': 'password not the same'}
            return JsonResponse(result)
        # -----------------先查讀--------後可以避免不必要的寫
        # 優先查詢當前用戶名是否已存在
        old_user = UserProfile.objects.filter(username=username)  # old_user 是一個集合 這裡是list
        if old_user:
            result = {'code': 206, 'error': 'username was already reg '}
            return JsonResponse(result)
        # 到這裡都沒問題代表用戶名暫時okay
        # 密碼md5哈希處理
        m = hashlib.md5()
        m.update(password_1.encode())
        # ======CharField 尽量避免使用 null=True
        sign = info = ''
        try:
            # 創建且存入的動作
            UserProfile.objects.create(username=username, nickname=username, password=m.hexdigest(), sign=sign,
                                       info=info, email=email)
        except Exception as e:
            # 數據庫當機,用戶名已存在
            result = {'code': 207, 'error': 'server is busy'}
            return JsonResponse(result)
        # make token
        token = make_token(username)
        print(token)
        # b'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjExMSIsImV4cCI6MTU5OTE1MjgyOX0.r4sWCxO63rVc5Kdq4LRKyXlLd4yXPdW3w_L7dRqApCU'

        print(token.decode())
        # 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjExMSIsImV4cCI6MTU5OTE1MjgyOX0.r4sWCxO63rVc5Kdq4LRKyXlLd4yXPdW3w_L7dRqApCU'
        # .decode()解密
        result = ({'code': 200, 'username': username, 'data': {'token': token.decode()}})
        return JsonResponse(result)
        # ---------------------------------------------------------------------------------------------------
    elif request.method == 'PUT':
        # http://127.0.0.1:5000/<username>/change_info
        # META可拿取http协议原生请求头,META 也是类字典对象，可使用
        # 字典相关方法
        # 特别注意 http头有可能被django重命名，建议百度
        # 更新数据
        # 取得前端傳來的token
        request.META.get('HTTP_AUTHORIZATION')
        user = request.user
        print('user id in PUT:', user)
        # UserProfile object
        json_str = request.body
        if not json_str:
            result = {'code': 209, 'error': 'check json'}
            return JsonResponse(result)
        json_obj = json.loads(json_str)

        if 'sign' not in json_obj:
            result = {'code': 210, 'error': 'no sign'}
            return JsonResponse(result)
        if 'info' not in json_obj:
            result = {'code': 211, 'error': 'no info'}
            return JsonResponse(result)

        info = json_obj.get('info', '')
        sign = json_obj.get('sign', '')
        # 存起來
        request.user.sign = sign
        request.user.info = info
        request.user.save()
        result = {'code': 200, 'username': request.user.username}
        return JsonResponse(result)

    else:
        raise


@login_check('POST')
def user_avatar(request, username):
    """

    :param request:
    :param username:
    :return:
    """
    if request.method != 'POST':
        return JsonResponse({'code': 211, 'error': 'need POST'})
    result = {'code': 212, 'error': 'avatar'}
    # avatar = request.FILES['avatar']
    # avatar = request.POST.get('avatar') 不可以這樣取
    avatar = request.FILES.get('avatar')
    print("avatar = request.FILES.get('avatar'):", avatar)
    if not avatar:
        return JsonResponse({'code': 213, 'error': 'no have avatar'})
    # TODO 判断url中的username 是否 跟 token 中的username一致，若不一致，则返回error
    request.user.avatar = avatar
    request.user.save()
    result = {'code': 200, 'username': request.user.username}
    return JsonResponse(result)
