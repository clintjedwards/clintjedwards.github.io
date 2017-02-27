# Personal Website

Simple personal website. Written with flask.

https://clintjedwards.com

Icons from [Iconfinder](https://www.iconfinder.com/Neolau1119)


## Getting Started (Running from scratch)

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

* Clone from repository
```
git clone git@github.com:cje3295/personal_website.git
```

* Create virtual environment
```
cd personal_website
virtualenv venv
source ./venv/bin/activate
```

* Install required python packages
```
pip install -r requirements.txt
```

* Create application configuration file
```
cp example_config.py config.py
```

* Create secret key for config.py
```
python
import os
os.urandom(24).encode('hex')
```
Paste the result in to your configuration file under secret_key

* You can look at the flask script application management options by typing
from the application directory
```
python manage.py --help
```
* Run the local web server
```
python manage.py runserver -h localhost -p 5000
```

## Getting Started (Running with docker)
* Clone from repository
```
git clone git@github.com:cje3295/personal_website.git
```

* Pull the docker image
```
docker pull cje3295/paraphernalia:personal_website
```

* Mount the code to docker container and expose correct ports to the host machine
```
docker run -p 80:80 -v ~/Documents/personal_website:/var/web/app cje3295/paraphernalia:personal_website
```
We want to mount our code(located at ~/Documents/personal_website) inside the /var/web/app directory. This will allow uwsgi and nginx to find and serve the code. We also bind our localhost port 80 to the container's port 80.



## Built With

* [Flask](http://flask.pocoo.org/) - The python web framework used
* [Lets Encrypt](https://letsencrypt.org/) - SSL certificate issuer

## Authors

* **Clint Edwards** - [Github](https://github.com/cje3295)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
