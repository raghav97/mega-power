# Mega Hostel Power Status

This is an open source application developed solely on Ruby on Rails to check the electricity status of my hostel (Mega Hostel, SASTRA University). The main purpose of this application to make sure that there is electricity in the hostel when I bunk the class, otherwise bunking the class would be useless.

## Working

I assume that when I am in the classroom, my laptop is in my room charging and is connected to the Internet. The laptop runs a cron job every minute to check the laptop battery status using the shell command

```
upower -i /org/freedesktop/UPower/devices/battery_BAT0 
```

The shell command would return the current battery stats. If the battery is charging, then it implies that the hostel has power. The data is stored in an array format and every minute, the new power status is pushed into the array. If the laptop is discharging, it concludes that the hostel does not have electricity and quickly sends a message to my Twilio verified mobile number. It also notifies me the power is back.

## Requirements

* A Laptop with Ubuntu / Linux (as cron jobs only work on Linux)
* Install Ruby 2.3.4
* Install Rails 5.0.1
* A Twilio Account with the Twilio id and password which should be added in a .env file
* Modify the seeds file to your Twilio verified phone number and user name
 
## Usage

As of now, this application is open-source and anyone can use this by cloning the repository.
Once all the requirements are satisfied, run the following commands in the terminal to get the app running

```
whenever
whenever --update-crontab
sudo service cron restart
crontab
```
Thats it! This would run the cron job every minute and you should be getting the message to your phone when the power is cut off. 

Happy bunking!