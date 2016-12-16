from flask import Flask

#Disable warning: Import should be placed at the top of the module pylint: disable=C0413

app = Flask(__name__)
app.config.from_object('config.config')

from app import views
