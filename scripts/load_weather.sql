TRUNCATE TABLE dl_weather;
COPY dl_weather(weather) 
FROM '/home/ubuntu/insight/energy_pricing/downloads/weather/source/loc1_weather.json';
