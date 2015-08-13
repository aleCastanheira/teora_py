from django.db import models
from teora_base.models import Teora_model

class User(Teora_model):
	name = models.CharField(max_length=50)
	email = models.EmailField(max_length=100)
	password = models.CharField(max_length=50)
	user_type_id = models.ForeignKey('User_type')

	class Meta:
		db_table = 'users'


class User_type(Teora_model):
	name = models.CharField(max_length=50)

	class Meta:
		db_table = 'user_types'