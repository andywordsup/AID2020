import base64
import copy
import json
import time
import hmac
import hashlib
import jwt


class Jwt():
    def __int__(self):
        pass

    @staticmethod
    def b64encode(content):
        return base64.urlsafe_b64encode(content).replace(b'=', b'')

    @staticmethod
    def b64decode(jsn):
        # 如何把去掉的=号加回来， base64串有某个规律可以实现该需求 todo
        # base64长度能被4整除
        sem = len(jsn) % 4
        if sem > 0:
            jsn += b'=' * (4 - sem)
        return base64.urlsafe_b64decode(jsn)

    @staticmethod
    # exp=300 token有效期
    def encode(payload, key, exp=300):
        # init header
        # alg代表要使用的 算法
        # typ表明该token的类别 - 此处必须为 大写的 JWT
        # header 只是申明，沒有規範
        # --------------------------------------------------------------------
        header = {'typ': 'JWT', "alg": 'HS256'}
        header_json = json.dumps(header, separators=(',', ':'), sort_keys=True)
        # .encode->字符串--->字節串
        header_bs = Jwt.b64encode(header_json.encode())
        # -----------------------------------------------------------------------
        # init payload
        payload_self = copy.deepcopy(payload)
        if not isinstance(exp, int) and isinstance(exp, str):
            raise TypeError('exp only int and str')
        # 複製後的payload
        payload_self['exp'] = time.time() + int(exp)
        # json化後payload_js
        payload_js = json.dumps(payload_self, separators=(',', ':'), sort_keys=True)
        # json對象,字節化
        payload_bs = Jwt.b64encode(payload_js.encode())
        # int sign
        # -----------------------------------------------------------------------
        if isinstance(key, str):
            key = key.encode()
        hm = hmac.new(key, header_bs + b'.' + payload_bs, digestmod="SHA256")
        sign_bs = Jwt.b64encode(hm.digest())
        return header_bs + b'.' + payload_bs + b'.' + sign_bs

    @staticmethod
    def decode(token, key):
        # 校验签名???
        # 检查 exp是否过期
        # return payload部分的解码???
        header_bs, payload_bs, sign_bs = token.split(b'.')
        # 校验sign_bs
        if isinstance(key, str):
            key = key.encode()
        hm = hmac.new(key, header_bs + b'.' + payload_bs, digestmod="SHA256")
        # 比对两次的sign结果
        if sign_bs != Jwt.b64encode(hm.digest()):
            raise
        # 检查是否过期
        payload_js = Jwt.b64decode(payload_bs)
        payload = json.loads(payload_js)

        if 'exp' in payload:
            now = time.time()
            if now > payload['exp']:
                raise
            return payload


if __name__ == "__main__":
    token = Jwt.encode({'username': 'jun'}, "123", 300)
    print('生成token')
    print(token)
    # print(token.replace(b'.', b','), '這方法不可以,因為是分割非代替')
    # print(token.split(b'.'))
    print('校驗')
    print(Jwt.decode(token, '123'))
