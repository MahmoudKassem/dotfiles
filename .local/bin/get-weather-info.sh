#!/bin/sh

weatherInfo=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16-)
weatherCondition=$(printf "%s" "$weatherInfo" | head -1 | xargs)
temperature=$(printf "%s" "$weatherInfo" | head -2 | tail -1 | xargs)
case $weatherCondition in
  "Clear" | "Sunny") icon= ;;
  "Cloudy" | "Overcast" | "Very cloudy") icon= ;;
  "Fog" | "Mist" | "Patches of fog") icon= ;;
  "Heavy rain" | "Heavy showers") icon= ;;
  "Heavy snow" | "Heavy snow showers" | "Patchy heavy snow") icon= ;;
  "Light drizzle" | "Light rain" | "Light rain shower" | "Light showers" | "Moderate rain" | "Patchy light drizzle" | \
  "Patchy light rain" | "Patchy rain possible") icon= ;;
  "Light sleet" | "Light sleet showers" | "Moderate snow" | "Patchy moderate snow" | "Light snow" | \
  "Light snow showers") icon= ;;
  "Partly cloudy") icon= ;;
  "Thundery heavy rain" | "Thundery outbreaks possible") icon= ;;
  "Thundery showers" | "Thundery snow showers") icon= ;;
  *) icon="???";;
esac
printf " %s  %s \\n" "$icon" "$temperature"
