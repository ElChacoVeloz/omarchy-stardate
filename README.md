# Omarchy Stardate

A Stardate bar widget for Omarchy Shell.

## Formula

Stardate = (Year - 2323) × 1000 + (DayOfYear / DaysInYear) × 1000

## Features

- Displays the current Stardate in the Omarchy bar
- Updates once per hour
- Shows the precise Stardate and calendar date in its tooltip
- Refreshes manually when clicked

## Installation

Clone the repository into your Omarchy plugins directory:

```bash
git clone https://github.com/ElChacoVeloz/omarchy-stardate.git \
  ~/.config/omarchy/plugins/iserrano.stardate
```

Add the widget to `~/.config/omarchy/shell.json`:

```json
{
  "id": "iserrano.stardate"
}
```

Restart Omarchy Shell:

```bash
omarchy restart shell
```
