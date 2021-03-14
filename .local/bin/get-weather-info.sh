#!/bin/sh

weatherInfo=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16-)
weatherCondition=$(printf "%s" "$weatherInfo" | head -1 | xargs)
temperature=$(printf "%s" "$weatherInfo" | head -2 | tail -1 | xargs)
case $weatherCondition in
  "Clear") icon= ;;
  "Cloudy") icon=摒 ;;
  "Fog") icon=  ;;
  "Heavy rain") icon=  ;;
  "Heavy showers") icon=  ;;
  "Heavy snow") icon= ;;
  "Heavy snow showers") icon= ;;
  "Light drizzle") icon=  ;;
  "Light rain") icon=  ;;
  "Light rain shower") icon=  ;;
  "Light showers") icon=  ;;
  "Light sleet") icon=ﭽ  ;;
  "Light sleet showers") icon=ﭽ  ;;
  "Light snow") icon= ;;
  "Light snow showers") icon= ;;
  "Mist") icon=  ;;
  "Moderate rain") icon=  ;;
  "Moderate snow") icon=ﭽ;;
  "Overcast") icon=摒 ;;
  "Partly cloudy") icon=  ;;
  "Patches of fog") icon=  ;;
  "Patchy heavy snow") icon= ;;
  "Patchy light drizzle") icon=  ;;
  "Patchy light rain") icon=  ;;
  "Patchy moderate snow") icon=ﭽ  ;;
  "Patchy rain possible") icon=  ;;
  "Sunny") icon=  ;;
  "Thundery heavy rain") icon=  ;;
  "Thundery showers") icon=ﭼ  ;;
  "Thundery snow showers") icon=  ;;
  "Very cloudy") icon=  ;;
  *) icon="???" ;;
esac
printf " %s  %s \\n" "$icon" "$temperature"
