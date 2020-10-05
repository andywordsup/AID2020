from django.contrib import admin

# Register your models here.
from django.contrib import admin

# Register your models here.

from . import models


class TopicManager(admin.ModelAdmin):
    list_display = ['id', 'title', 'category','limit', 'created_time','author']


admin.site.register(models.Topic,TopicManager)
