from django.db import models


# Create your models here.

# class -> UserProfile
# 表名 user_profile
# username, nickname,email,password,sign,info,avatar
# models.Model 這意指 UserProfile 是一個 Django Model, 這樣 Django 就會知道要這個東西要存進資料庫。
class UserProfile(models.Model):
    username = models.CharField(max_length=11, verbose_name='用户名', primary_key=True)
    nickname = models.CharField(max_length=30, verbose_name='昵称')
    email = models.CharField(max_length=50, verbose_name='邮箱', null=True)
    password = models.CharField(max_length=32)
    sign = models.CharField(max_length=50, verbose_name='个性签名')
    info = models.CharField(max_length=150, verbose_name='个人描述')
    # models.ImageField 存處的是圖片上的相對路徑並非直接存進去
    avatar = models.ImageField(upload_to='avatar/')

    class Meta:
        db_table = 'user_profile'
    def __str__(self):
        return self.username