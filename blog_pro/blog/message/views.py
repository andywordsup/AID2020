import json

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from message.models import Message
from tools.login_check import login_check
from topic.models import Topic


@login_check('POST')
def messages(request, topic_id):
    if request.method != "POST":
        result = {'code': 401, 'error': 'please post'}
        return JsonResponse(result)
    # 開發留言回覆
    # 獲取訪客用戶名,透過請求
    user = request.user
    json_str = request.body
    # load 回 python obj
    json_obj = json.loads(json_str)

    content = json_obj.get('content')
    if not content:
        result = {'code': 402, 'error': 'please content'}
        return JsonResponse(result)
    parent_id = json_obj.get('parent_id', 0)
    try:
        topic = Topic.objects.get(id=topic_id)
        # print('topic=Topic.objects.get(id=topic_id):', topic)
    except Exception as e:
        # topic被删除 or 当前topic_id 不在
        result = {'code': 403, 'error': 'have no topic'}
        return JsonResponse(result)
    # 私有博客只能身為博主的訪客可以留言
    if topic.limit == "private":
        # 檢查 身份 url sql
        print('topic.author:',topic.author)
        if user.username != topic.author.username:
            result = {'code': 404, 'error': 'mother fuckk'}
    # 創建數據
    Message.objects.create(content=content, publisher=user, topic=topic, parent_message=parent_id)

    return JsonResponse({'code':200, 'data':{}})