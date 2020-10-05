from django.db import models

# Create your models here.
from topic.models import Topic
from user.models import UserProfile


class Message(models.Model):
    content = models.CharField(max_length=50, verbose_name='內容')
    created_time = models.DateTimeField(auto_now_add=True)
    # 外鍵
    topic = models.ForeignKey(Topic)
    # 外鍵
    publisher = models.ForeignKey(UserProfile)
    #
    parent_message = models.IntegerField(default=0)

    class Meta:
        db_table = 'message'
