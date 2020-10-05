d={}
d['id'] = 'topic.id'
d['title'] = 'topic.title'
d['category'] = 'topic.category'
d['introduce'] = 'topic.introduce'
d['author'] = 'author.nickname'
d['created_time'] = "topic.created_time.strftime('%Y-%m-%d %H:%M:%S')"
topics_list= [d]
print('d:',d)
print('topics_list:',topics_list)