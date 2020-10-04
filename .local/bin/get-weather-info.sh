#!/bin/sh

weatherInfo=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs)
weatherCondition=$(printf "%s" "$weatherInfo" | sed -r 's/([^0-9]+)([0-9]+.*)/\1/' | xargs)
temperature=$(printf "%s" "$weatherInfo" | sed -r 's/([^0-9]+)([0-9]+.*)/\2/')
case $weatherCondition in
  "Clear") icon= ;;
  "Cloudy") icon=摒 ;;
  "Fog") icon=  ;;
  "Heavy rain") icon=  ;;
  "Heavy showers") icon=  ;;
  "Heavy snow") icon= ;;
  "Heavy snow showers") icon= ;;
  "Light rain") icon=  ;;
  "Light showers") icon=  ;;
  "Light sleet") icon=ﭽ  ;;
  "Light sleet showers") icon=ﭽ  ;;
  "Light snow") icon= ;;
  "Light snow showers") icon= ;;
  "Overcast") icon=摒 ;;
  "Partly cloudy") icon=  ;;
  "Sunny") icon=  ;;
  "Thundery heavy rain") icon=  ;;
  "Thundery showers") icon=ﭼ  ;;
  "Thundery snow showers") icon=  ;;
  "Very cloudy") icon=  ;;
  *) icon="???" ;;
esac
printf "%s  %s \\n" "$icon" "$temperature"