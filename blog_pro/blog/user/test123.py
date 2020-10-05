import json

import jwt
from IPython.core.display import JSON

jsonData = {'typ': 'JWT', 'alg': 'HS256', 'num': '123'}
# 被正規json化程對象後,字節化
# json_b = b'{"username":"andy","email":"aaa@818250","password_1":"111111","password_2":"111111"}'
# 變json對象
text = json.dumps(jsonData)
print(text)
# json對象字節化
bb = text.encode()
print(bb)
# 将已编码的 JSON 字符串解码为 Python 对象
json_obj1 = json.loads(bb)
print(json_obj1)

# 将已编码的 JSON 字符串解码为 Python 对象
# json_obj2 = json.loads(json_b)
# print(json_obj2)
# name = json_obj2.get('username')
# print(name)
