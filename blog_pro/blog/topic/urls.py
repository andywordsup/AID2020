from django.conf.urls import url

from topic import views

urlpatterns = [
    # http://127.0.0.1/v1/topics/<author_id>
    # url(r'^/$', views.topics),
    url(r'^/(?P<author_id>[\w]{1,11})$', views.topics),
]
