import json

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from message.models import Message
from tools.login_check import login_check, get_user_by_request
from topic.models import Topic
from user.models import UserProfile


@login_check('POST', 'DELETE', 'PUT')  # 優先誘發
def topics(request, author_id):
    # 127.0.0.1:8000/v1/topics/<author_id>?category=[tec|no-tec]
    if request.method == 'GET':
        url = request.build_absolute_uri()
        print('url_get:',url)
        t_id = url.split('/')[-1].split('/')[-1]
        t_id = t_id[-2:]
        print('t_id_get:', t_id)
        # 获取用户博客数据
        # 前端地址 -> http://127.0.0.1:5000/<username>/topics
        # author_id 被访问的博主用户名,get 訪問
        # authors  博主  当前被访问博客的博主已對象顯示
        # author  博主  当前被访问博客的博主
        # assert isinstance(author_id, object)
        print('author id:', author_id)
        # author id: andy333
        authors = UserProfile.objects.filter(username=author_id)  # 記住是集合
        print('authors:', authors)
        # authors: <QuerySet [<UserProfile: UserProfile object>]>
        if not authors:
            # 沒有該博主名？？有可能輸入錯誤
            result = {'code': 308, 'error': 'no author'}
            return JsonResponse(result)
        # author  博主  当前被访问博客的博主
        author = authors[0]
        print('author = authors[0]:', author)
        # author = authors[0]: UserProfile object
        # visitor ?
        visitor = get_user_by_request(request)  # 由 meta 資訊 取token
        # visitor 访客 【1，登陆了 2，游客（未登录）】
        visitor_name = None
        if visitor:
            visitor_name = visitor.username
            # /v1/topics/<author_id>用戶全量數據
            # /v1/topics/<author_id>?category=[tec/no-tec]
        # ------------------------------------------------
        t_id = request.GET.get('t_id')
        # 获取 t_id,功能分水嶺
        if t_id:
            is_self = False
            # http://127.0.0.1:8000/v1/topics/andy333?t_id=8
            # t_id 有或去代碼詳情頁
            t_id = int(t_id)
            print('t_id = int(t_id):', t_id)

            # ------------------------------------------------------------
            # if author_id == 'superuser':
            #     try:
            #         author_topic = Topic.objects.get(id=t_id)
            #     except Exception as e:
            #         return JsonResponse({'code': 312, 'error': 'no topic'})
            #     res = index_topic_res(author_topic)
            #     return JsonResponse(res)
            # ------------------------------------------------------------

            if author_id == visitor_name:
                # 博主访问自己的博客
                is_self = True
                try:
                    author_topic = Topic.objects.get(id=t_id)
                except Exception as e:
                    return JsonResponse({'code': 312, 'error': 'no topic'})
            else:  # for 訪客
                try:
                    author_topic = Topic.objects.get(author_id=author_id, id=t_id, limit='public')
                except Exception as e:
                    return JsonResponse({'code': 313, 'error': 'no topic'})
            res = make_topic_res(author, author_topic, is_self)
            # 取完參數跑完函式後返回
            return JsonResponse(res)





        # 当前是否为 博主访问自己的博客
        else:

            # 访客访问博主的博客
            # ------------------------------------------------

            category = request.GET.get('category')
            # maybe tec/no-tec/None
            if category in ['tec', 'no-tec']:
                # /v1/topics/<author_id>?category=[tec/no-tec]
                # http://127.0.0.1:8000/v1/topics/andy333?t_id=8
                if author_id == visitor_name:  # get訪問,token認證
                    # 博主访问自己的博客
                    topics = Topic.objects.filter(author_id=author_id, category=category)
                else:
                    # 访客来了
                    topics = Topic.objects.filter(author_id=author_id, category=category, limit='public')

            else:
                # /v1/topics/<author_id>這裡用戶全量數據,屬於有登入的博主訪問/全量/tec/no-tec
                if author_id == visitor_name:
                    # 博主訪問自己博客,獲取全量數據
                    print('author_id == visitor_name:', author_id)
                    # topics = Topic.objects.get(author_id=author_id)
                    topics = Topic.objects.filter(author_id=author_id)
                    # topics: <QuerySet [<UserProfile: UserProfile object>]>

                else:
                    # 非博主本人
                    # topics = Topic.objects.get(author_id=author_id, categorty="public")
                    topics = Topic.objects.filter(author_id=author_id, limit="public")
                    # 訪客,只能或的public數據
                    # 最後數據都取出了,返回
            res = make_topics_res(author, topics)
            return JsonResponse(res)


    elif request.method == "POST":
        # 提交用户博客数据的內容文章
        json_str = request.body
        if not json_str:
            result = {'code': 301, 'error': 'no json'}
            return JsonResponse(result)
        json_obj = json.loads(json_str)
        print(" json_obj in topic:", json_obj)
        title = json_obj.get('title')

        # xss注入
        import html
        # 进行转义
        title = html.escape(title)

        if not title:
            result = result = {'code': 302, 'error': 'no title'}
            return JsonResponse(result)
        content = json_obj.get('content')
        if not content:
            result = {'code': 303, 'error': 'Please give me content'}
            return JsonResponse(result)
        # 获取纯文本内容 - 用于切割文章简介
        content_text = json_obj.get('content_text')
        if not content_text:
            result = result = {'code': 302, 'error': 'content_text'}
            return JsonResponse(result)
        # 切割简介
        introduce = content_text[:30]
        limit = json_obj.get('limit')
        if not limit in ['public', 'private']:
            result = {'code': 302, 'error': 'limit is wrong'}
            return JsonResponse(result)
        category = json_obj.get('category')
        # Todo 检查 same to 'limit'
        # 创建数据
        try:
            Topic.objects.create(title=title, category=category, limit=limit, content=content, introduce=introduce,
                                 author=request.user)
            result = {'code': 200, 'username': request.user.username}
            print('request.user.username in create:', request.user.username)
            print('request.user in create:', request.user)
            # request.user.username in create: andy333
            # request.user in create: UserProfile object

            return JsonResponse(result)
        except Exception as e:
            result = {'code': 399, 'error': 'create false'}
            return JsonResponse(result)

    elif request.method == 'DELETE':
        # 博主删除自己的文章
        # /v1/topics/<author_id>
        # token存储的用户
        # Header信息抓回來的request (已token 形式包裝過)user
        author = request.user
        token_author_id = author.username
        print('token_author_id = author.username:', token_author_id)
        # url中传过来的author_id 必须与token中的用户名相等,url 使用者根token 認證
        print(author_id != token_author_id)
        if author_id != token_author_id:
            result = {'code': 309, 'error': 'You can not do it '}
            return JsonResponse(result)

        topic_id = request.GET.get('topic_id')  # 不懂

        try:
            topic = Topic.objects.get(id=topic_id)
            print('topic in del:', topic)
            # 後端取值確認,取不到報錯
            # '<li class="delete" style="padding-left:20px" data=' + topics[t].id +'>删除</li>';

        except:
            result = {'code': 310, 'error': 'You can not do it !'}
            return JsonResponse(result)

        # 删除 ex: author_id: root(url傳的),跟後端使用這確認是否相同
        if topic.author.username != author_id:
            result = {'code': 311, 'error': 'You can not do it !! '}
            return JsonResponse(result)

        topic.delete()
        res = {'code': 200}
        return JsonResponse(res)

    elif request.method == 'PUT':



        url = request.build_absolute_uri()
        t_id = url.split('/')[-1].split('?')[-1]
        t_id = t_id[-2:]
        print('t_id_put:', t_id)
        json_str = request.body
        if not json_str:
            result = {'code': 209, 'error': 'check json'}
            return JsonResponse(result)
        json_obj = json.loads(json_str)
        if 'title' not in json_obj:
            result = {'code': 210, 'error': 'title'}
            return JsonResponse(result)
        if 'content' not in json_obj:
            result = {'code': 211, 'error': 'content'}
            return JsonResponse(result)
        if 'content_text' not in json_obj:
            result = {'code': 211, 'error': 'content_text'}
            return JsonResponse(result)
        if 'limit' not in json_obj:
            result = {'code': 211, 'error': 'limit'}
            return JsonResponse(result)
        if 'category' not in json_obj:
            result = {'code': 211, 'error': 'category'}
            return JsonResponse(result)
        title = json_obj.get('title', '')
        content = json_obj.get('content', '')
        content_text = json_obj.get('content_text', '')
        introduce = content_text[:30]
        limit = json_obj.get('limit', '')
        category = json_obj.get('category', '')
        topic = Topic.objects.filter(id=t_id)
        topic = topic[0]
        topic.title = title
        topic.content = content
        topic.introduce = introduce
        topic.limit = limit
        topic.category = category
        topic.save()
        result = {'code': 200, 'username': request.user.username}
        return JsonResponse(result)




    else:
        raise

    # ----------------------------------------------------------------------------------



def make_topics_res(author, topics):
    """

    :param author:被訪問者
    :param topics:被訪問者文章
    :return:
    """

    res = {'code': 200, 'data': {}}
    data = {'nickname': author.nickname}
    topics_list = []
    print('topics in make_topics_res:', topics)
    # <QuerySet [<Topic: Topic object>, <Topic: Topic object>, <Topic: Topic object>]>

    for topic in topics:
        # 給的變量千萬不要是對象
        d = {}
        d['id'] = topic.id
        d['title'] = topic.title
        d['category'] = topic.category
        d['introduce'] = topic.introduce
        # 當前文章作者名
        d['author'] = author.nickname
        d['created_time'] = topic.created_time.strftime('%Y-%m-%d %H:%M:%S')
        topics_list.append(d)
    data['topics'] = topics_list[::-1]
    res['data'] = data
    return res


"""
{
	"code": 200,
	"data": {
		"nickname": "andy333",
		"topics": [{
			"id": 2,
			"title": "topic test",
			"category": "tec",
			"introduce": "first test",
			"author": "andy333",
			"created_time": "2020-09-07 06:25:51"
		}, {
			"id": 8,
			"title": "&lt;script&gt;alter(123)&lt;/script&gt;",
			"category": "tec",
			"introduce": "'&lt;script&gt;alter(123)&lt;/",
			"author": "andy333",
			"created_time": "2020-09-07 20:02:04"
		}]
	}
}
"""


def make_topic_res(author, author_topic, is_self):
    """
    拼接詳情頁返回的數據
    :param author:訪問者對象
    :param author_topic:被訪問的博主文章對象
    :param is_self: 是否是博主自己登入
    :return:留言&回复的映射字典
    """
    if is_self:
        # 找下一個文章的方法:取id,此id大於當前博客id的第一個
        next_topic = Topic.objects.filter(id__gt=author_topic.id, author=author).first()
        # author_topic.id
        # 一定要考慮作者,就直接用外鍵對象查
        last_topic = Topic.objects.filter(id__lt=author_topic.id, author=author).last()

    else:  # 訪客訪問博主
        # 找下一個文章的方法:取id,此id大於當前博客id的第一個
        next_topic = Topic.objects.filter(id__gt=author_topic.id, author=author, limit='public').first()
        # author_topic.id
        # 一定要考慮作者,就直接用外鍵對象查
        last_topic = Topic.objects.filter(id__lt=author_topic.id, author=author, limit='public').last()
    if next_topic:
        # 判端下一個是否存在
        next_id = next_topic.id
        # next_topic.id:
        print('next_topic', next_topic)

        # print('next_topic[0]:', next_topic)
        print('next_id=next_topic.id:', next_id)
        next_title = next_topic.title

    else:
        next_id = None
        next_title = None
    if last_topic:
        last_id = last_topic.id
        last_title = last_topic.title
    else:
        last_id = None
        last_title = None
    # topic 是外鍵,在sql會由topic_id呈現,取的時候還是按照models定義
    # 取出這則文章的所有留言回覆對像
    all_messages = Message.objects.filter(topic=author_topic).order_by('-created_time')
    # 所有的留言
    msg_list = []
    # 留言&回复的映射字典
    reply_dict = {}
    msg_count = 0
    for msg in all_messages:
        if msg.parent_message == 0:
            msg_count += 1
            msg_list.append({'id': msg.id,
                             'content': msg.content,
                             'publisher': msg.publisher.nickname,
                             # 這粒序列化要小心,轉str不然報wrong
                             'publisher_avatar': str(msg.publisher.avatar),
                             'created_time': msg.created_time.strftime('%Y-%m-%d'),
                             'reply': []
                             })
        else:
            reply_dict.setdefault(msg.parent_message, [])
            reply_dict[msg.parent_message].append({'msg_id': msg.id,
                                                   'content': msg.content,
                                                   'publisher': msg.publisher.nickname,
                                                   'publisher_avatar': str(msg.publisher.avatar),
                                                   'created_time': msg.created_time.strftime('%Y-%m-%d'),
                                                   })
        # 合并  msg_list 和 reply_dict
        for _msg in msg_list:
            if _msg['id'] in reply_dict:
                _msg['reply'] = reply_dict[_msg['id']]

    # ----------------------------------------------------------------------
    res = {'code': 200, 'data': {}}
    res['data']['nickname'] = author.nickname  # 作者者名稱
    res['data']['title'] = author_topic.title  # 標題名
    res['data']['category'] = author_topic.category  # 類型
    res['data']['created_time'] = author_topic.created_time.strftime('%Y-%m-%d %H:%M:%S')  # 創建時間
    res['data']['content'] = author_topic.content  # 內容
    res['data']['introduce'] = author_topic.introduce  # 介紹內容
    res['data']['author'] = author.nickname  # 作者名稱
    res['data']['next_id'] = next_id  # 下一章節id
    res['data']['next_title'] = next_title  # 下一章節標題
    res['data']['last_id'] = last_id  # 上一節id
    res['data']['last_title'] = last_title  # 上一章節標題

    res['data']['messages_count'] = msg_count
    res['data']['messages'] = msg_list
    return res

