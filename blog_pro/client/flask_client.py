# -*- coding:utf-8 -*-
######################################################
#        > File Name: flask_client.py
#      > Author: GuoXiaoNao
#     > Mail: 250919354@qq.com
#     > Created Time: Mon 20 May 2019 11:52:00 AM CST
######################################################

from flask import Flask, send_file

app = Flask(__name__)


@app.route('/index')
def index():
    # 首页
    return send_file('templates/index.html')


@app.route('/index2')
def index2():
    # 首页
    return send_file('templates/index2.html')

@app.route('/login')
def login():
    # 登录
    return send_file('templates/login.html')


@app.route('/register')
def register():
    # 注册
    return send_file('templates/register.html')




if __name__ == '__main__':
    app.run(debug=True)
