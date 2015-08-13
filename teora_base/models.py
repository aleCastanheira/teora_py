from django.db import models


class Teora_model(models.Model):
	active = models.BooleanField()
	created_by = models.IntegerField()
	creation_date = models.DateTimeField(auto_now=True)
	modified_by = models.IntegerField()
	modification_date = models.DateTimeField(auto_now=True)
	removed_by = models.IntegerField()
	removal_date = models.DateTimeField(auto_now=True)

	class Meta:
		abstract = True