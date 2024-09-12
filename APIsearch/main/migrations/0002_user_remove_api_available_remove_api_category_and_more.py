# Generated by Django 5.1.1 on 2024-09-12 03:49

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=18)),
                ('role', models.CharField(max_length=12)),
                ('first_name', models.CharField(max_length=20)),
                ('last_name', models.CharField(max_length=20)),
                ('patronymic', models.CharField(blank=True, max_length=20, null=True)),
                ('age', models.IntegerField()),
                ('birth_date', models.DateField()),
                ('phone', models.CharField(max_length=11)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='api',
            name='available',
        ),
        migrations.RemoveField(
            model_name='api',
            name='category',
        ),
        migrations.RemoveField(
            model_name='api',
            name='description',
        ),
        migrations.AddField(
            model_name='api',
            name='body',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='api',
            name='count_of_uses',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='api',
            name='created_at',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='api',
            name='protocol',
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
        migrations.AddField(
            model_name='api',
            name='type',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
        migrations.AlterField(
            model_name='api',
            name='name',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
        migrations.AlterField(
            model_name='api',
            name='price',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='api',
            name='creator',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='main.user'),
        ),
    ]
