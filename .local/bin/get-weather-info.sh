#!/bin/sh

weatherInfo=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16-)
weatherCondition=$(printf "%s" "$weatherInfo" | head -1 | xargs)
temperature=$(printf "%s" "$weatherInfo" | head -2 | tail -1 | xargs)
case $weatherCondition in
  "Clear" | "Sunny") icon= ;;
  "Cloudy" | "Overcast" | "Very cloudy") icon= ;;
  "Fog" | "Mist" | "Patches of fog") icon= ;;
  "Heavy rain" | "Heavy rain at times" | "Heavy showers" | "Moderate or heavy rain shower") icon= ;;
  "Blizzard" | "Heavy snow" | "Heavy snow showers" | "Patchy heavy snow" | "Snow") icon= ;;
  "Light drizzle" | "Light drizzle and rain" | "Light rain" | "Light rain shower" | \
    "Light rain shower, rain shower" |"Light showers" | "Moderate rain" | \
    "Patchy light drizzle" | "Patchy light rain" | "Patchy rain possible" | "Rain shower") icon= ;;
  "Light sleet" | "Light sleet showers" | "Light snow" |  "Light snow showers" | "Moderate snow" | \
    "Patchy light snow" | "Patchy moderate snow" | "Patchy sleet possible" | "Patchy snow possible") icon= ;;
  "Partly cloudy") icon= ;;
  "Moderate or heavy rain with thunder" | "Thundery heavy rain" | "Thundery outbreaks possible") icon= ;;
  "Thundery showers" | "Thundery snow showers") icon= ;;
  *) icon="???";;
esac
printf " %s  %s \\n" "$icon" "$temperature"
